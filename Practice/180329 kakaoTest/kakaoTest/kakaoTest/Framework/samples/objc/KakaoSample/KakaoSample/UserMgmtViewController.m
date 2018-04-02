/**
 * Copyright 2015-2018 Kakao Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "UserMgmtViewController.h"
#import "UIAlertController+Addition.h"
#import "UserMgmtTableViewCell.h"
#import "IconTableViewCell.h"
#import "ProfileImageViewController.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@interface UserMgmtViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UserMgmtViewController {
    BOOL _doneSignup;
    KOUser *_user;
    NSArray *_menu;
    NSArray *_menuBeforeSignup;
    UITapGestureRecognizer *_singleTapGesture;
}

- (void)showErrorMessage:(NSError *)error {
    if (error.code == KOErrorCancelled) {
        [UIAlertController showMessage:@"에러, 다시 로그인해주세요!"];
    } else {
        id description = error.userInfo[NSLocalizedDescriptionKey];
        [UIAlertController showMessage:[NSString stringWithFormat:@"에러! code=%d, msg=%@", (int) error.code, description != nil ? description : @"unknown error"]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _menu = @[@"me", @"업데이트 프로필", @"Unlink", @"톡 프로필 보기"];
    _menuBeforeSignup = @[@"Signup"];
    
    _singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(profileImageTapped:)];
    _singleTapGesture.numberOfTapsRequired = 1;
    _singleTapGesture.numberOfTouchesRequired = 1;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    UINib *nib = [UINib nibWithNibName:@"UserMgmtTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UserMgmtTableViewCell"];
    
    [self requestMe:NO];
}

- (void)requestMe:(BOOL)displayResult {
    [KOSessionTask meTaskWithCompletionHandler:^(id result, NSError *error) {
        if (error) {
            [self showErrorMessage:error];
            _doneSignup = NO;
        } else {
            if (displayResult) {
                [UIAlertController showMessage:[result description]];
            }
            
            _doneSignup = YES;
            _user = result;
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        if (_doneSignup) {
            return _menu.count;
        } else {
            return _menuBeforeSignup.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UserMgmtTableViewCell *userCell = [tableView dequeueReusableCellWithIdentifier:@"UserMgmtTableViewCell"];
        [userCell setUser:_user];
        
        BOOL hasGesture = NO;
        for (UIGestureRecognizer *gesture in [userCell.thumbnail gestureRecognizers]) {
            if (gesture == _singleTapGesture) {
                hasGesture = YES;
                break;
            }
        }
        
        if (!hasGesture) {
            [userCell.thumbnail addGestureRecognizer:_singleTapGesture];
            userCell.thumbnail.userInteractionEnabled = YES;
        }
        
        return userCell;
    }
    
    UITableViewCell *normalCell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (normalCell == nil) {
        normalCell = [[IconTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    normalCell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"UserMenuIcon%d", (int) indexPath.row]];
    if (_doneSignup) {
        normalCell.textLabel.text = _menu[indexPath.row];
    } else {
        normalCell.textLabel.text = _menuBeforeSignup[indexPath.row];
    }
    
    return normalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 368;
    }
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        return;
    }
    
    if (!_doneSignup) {
        switch (indexPath.row) {
            case 0:
                [KOSessionTask signupTaskWithProperties:[self userFormData] completionHandler:^(BOOL success, NSError *error) {
                    if (error) {
                        [self showErrorMessage:error];
                    } else {
                        [self requestMe:NO];
                    }
                }];
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0: {
                [self requestMe:YES];
            }
                break;
                
            case 1: {
                [KOSessionTask profileUpdateTaskWithProperties:[self userFormData] completionHandler:^(BOOL success, NSError *error) {
                    if (error) {
                        [self showErrorMessage:error];
                    } else {
                        [UIAlertController showMessage:@"프로필 업데이트에 성공하셨습니다."];
                    }
                }];
            }
                break;
                
            case 2: {
                [KOSessionTask unlinkTaskWithCompletionHandler:^(BOOL success, NSError *error) {
                    if (error) {
                        [self showErrorMessage:error];
                    } else {
                        NSLog(@"User unlink is successfully completed!");
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                }];
            }
                break;
                
            case 3: {
                [self performSegueWithIdentifier:@"TalkProfile" sender:self];
            }
                break;
        }
    }
}

- (NSDictionary *)userFormData {
    UserMgmtTableViewCell *userCell = (UserMgmtTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    return [userCell userDictionary];
}

- (void)profileImageTapped:(UITapGestureRecognizer *)recognizer {
    if (!_user || !_user.properties[KOUserProfileImagePropertyKey]) {
        return;
    }
    
    NSString *profileImage = _user.properties[KOUserProfileImagePropertyKey];
    if (profileImage.length == 0) {
        return;
    }
    
    [self performSegueWithIdentifier:@"ProfileImage" sender:profileImage];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ProfileImage"]) {
        ProfileImageViewController *viewController = segue.destinationViewController;
        viewController.profileImageUrlString = sender;
    }
}

@end
