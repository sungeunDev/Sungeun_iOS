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

#import "StoryViewController.h"
#import "UIAlertController+Addition.h"
#import "StoryProfileTableViewCell.h"
#import "IconTableViewCell.h"
#import "ProfileImageViewController.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@interface StoryViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation StoryViewController {
    KOStoryProfile *_storyProfile;
    NSString *_lastStoryID;
    NSArray *_menu;
    BOOL _isStoryUser;
    UITapGestureRecognizer *_singleTapGesture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(profileImageTapped:)];
    _singleTapGesture.numberOfTapsRequired = 1;
    _singleTapGesture.numberOfTouchesRequired = 1;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"StoryProfileTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"StoryProfileTableViewCell"];
    
    [KOSessionTask storyIsStoryUserTaskWithCompletionHandler:^(BOOL isStoryUser, NSError *error) {
        if (error) {
            NSLog(@"isStoryUser failed = %@", error);
        } else {
            _isStoryUser = isStoryUser;
            
            if (isStoryUser) {
                [self loadStoryMenu];
            } else {
                [UIAlertController showMessage:@"스토리 유저가 아닙니다."];
            }
        }
    }];
}

- (void)loadStoryMenu {
    [KOSessionTask storyProfileTaskWithCompletionHandler:^(id result, NSError *error) {
        if (result) {
            _storyProfile = result;
            _menu = @[@"Post Note", @"Post Photo", @"Post Link", @"Get My Story", @"Get My Stories", @"Delete Last Story"];
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (_isStoryUser ? 2 : 1);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && _isStoryUser) {
        return 213;
    }
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_isStoryUser) {
        return 0;
    }
    
    if (section == 0) {
        return 1;
    }
    
    return _menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        StoryProfileTableViewCell *profileCell = [tableView dequeueReusableCellWithIdentifier:@"StoryProfileTableViewCell"];
        [profileCell setStoryProfile:_storyProfile];
        
        BOOL hasGesture = NO;
        for (UIGestureRecognizer *gesture in [profileCell.profileImageView gestureRecognizers]) {
            if (gesture == _singleTapGesture) {
                hasGesture = YES;
                break;
            }
        }
        
        if (!hasGesture) {
            [profileCell.profileImageView addGestureRecognizer:_singleTapGesture];
            profileCell.profileImageView.userInteractionEnabled = YES;
        }
        
        return profileCell;
    }
    
    UITableViewCell *normalCell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (normalCell == nil) {
        normalCell  = [[IconTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    normalCell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"StoryMenuIcon%d", (int) indexPath.row]];
    normalCell.textLabel.text = _menu[indexPath.row];
    
    return normalCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        return;
    }
    
    NSString *menuString = _menu[indexPath.row];
    
    if ([menuString isEqualToString:@"Post Note"]) {
        [self postNote];
        
    } else if ([menuString isEqualToString:@"Post Photo"]) {
        [self postPhoto];
        
    } else if ([menuString isEqualToString:@"Post Link"]) {
        [self postLink];
        
    } else if ([menuString isEqualToString:@"Get My Story"]) {
        [self getMyStory];
        
    } else if ([menuString isEqualToString:@"Get My Stories"]) {
        [self getMyStories];
        
    } else if ([menuString isEqualToString:@"Delete Last Story"]) {
        [self deleteLastStory];
    }
}

- (void)postNote {
    [KOSessionTask storyPostNoteTaskWithContent:@"post note test"
                                     permission:KOStoryPostPermissionFriend
                                       sharable:YES
                               androidExecParam:@{@"andParam1":@"value1", @"andParam2":@"value2"}
                                   iosExecParam:@{@"iosParam1":@"value1", @"iosParam2":@"value2"}
                              completionHandler:^(KOStoryPostInfo *post, NSError *error) {
                                  if (error) {
                                      [UIAlertController showMessage:[NSString stringWithFormat:@"post note error = %@", error.description]];
                                  } else {
                                      _lastStoryID = post.ID;
                                      [UIAlertController showMessage:[NSString stringWithFormat:@"post note success = %@", _lastStoryID]];
                                  }
                              }];
}

- (void)postPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.allowsEditing = NO;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)storyPostImages:(NSArray *)imageURLs {
    [KOSessionTask storyPostPhotoTaskWithImageUrls:imageURLs
                                           content:@"post photo test"
                                        permission:KOStoryPostPermissionFriend
                                          sharable:YES
                                  androidExecParam:@{@"andParam1":@"value1", @"andParam2":@"value2"}
                                      iosExecParam:@{@"iosParam1":@"value1", @"iosParam2":@"value2"}
                                 completionHandler:^(KOStoryPostInfo *post, NSError *error) {
                                     if (error) {
                                         [UIAlertController showMessage:[NSString stringWithFormat:@"post photo error = %@", error.description]];
                                     } else {
                                         _lastStoryID = post.ID;
                                         [UIAlertController showMessage:[NSString stringWithFormat:@"post photo success = %@", _lastStoryID]];
                                     }
                                 }];
}

- (void)postLink {
    [KOSessionTask storyGetLinkInfoTaskWithUrl:@"https://developers.kakao.com" completionHandler:^(KOStoryLinkInfo *link, NSError *error) {
        if (error) {
            [UIAlertController showMessage:[NSString stringWithFormat:@"get link info error = %@", error.description]];
        } else {
            [self storyPostLink:link];
        }
    }];
}

- (void)storyPostLink:(KOStoryLinkInfo *)linkInfo {
    [KOSessionTask storyPostLinkTaskWithLinkInfo:linkInfo
                                         content:@"post link test"
                                      permission:KOStoryPostPermissionFriend
                                        sharable:YES
                                androidExecParam:@{@"andParam1":@"value1", @"andParam2":@"value2"}
                                    iosExecParam:@{@"iosParam1":@"value1", @"iosParam2":@"value2"}
                               completionHandler:^(KOStoryPostInfo *post, NSError *error) {
                                   if (error) {
                                       [UIAlertController showMessage:[NSString stringWithFormat:@"post link error = %@", error.description]];
                                   } else {
                                       _lastStoryID = post.ID;
                                       [UIAlertController showMessage:[NSString stringWithFormat:@"post link success = %@", _lastStoryID]];
                                   }
                               }];
}

- (void)getMyStory {
    if (!_lastStoryID) {
        [UIAlertController showMessage:@"포스팅을 먼저 해주세요!"];
        return;
    }
    
    [KOSessionTask storyGetMyStoryTaskWithMyStoryId:_lastStoryID completionHandler:^(KOStoryMyStoryInfo *myStory, NSError *error) {
        if (error) {
            [UIAlertController showMessage:[NSString stringWithFormat:@"my story error = %@", error.description]];
        } else {
            [UIAlertController showMessage:[NSString stringWithFormat:@"my story success = %@", myStory.description]];
        }
    }];
}

- (void)getMyStories {
    if (!_lastStoryID) {
        [UIAlertController showMessage:@"포스팅을 먼저 해주세요!"];
        return;
    }
    
    [KOSessionTask storyGetMyStoriesTaskWithLastMyStoryId:_lastStoryID completionHandler:^(NSArray *myStories, NSError *error) {
        if (error) {
            [UIAlertController showMessage:[NSString stringWithFormat:@"my stories error = %@", error.description]];
        } else {
            [UIAlertController showMessage:[NSString stringWithFormat:@"my stories success = %@", myStories.description]];
        }
    }];
}

- (void)deleteLastStory {
    if (!_lastStoryID) {
        [UIAlertController showMessage:@"포스팅을 먼저 해주세요!"];
        return;
    }
    
    [KOSessionTask storyDeleteMyStoryTaskWithMyStoryId:_lastStoryID completionHandler:^(NSError *error) {
        if (error) {
            [UIAlertController showMessage:[NSString stringWithFormat:@"delete error = %@", error.description]];
        } else {
            [UIAlertController showMessage:@"delete success."];
            _lastStoryID = nil;
        }
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissImagePickerViewController];
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if(!image) {
        image = info[UIImagePickerControllerOriginalImage];
        
        if (image == nil) {
            return;
        }
    }
    
    [KOSessionTask storyMultiImagesUploadTaskWithImages:@[image] completionHandler:^(NSArray *imageUrls, NSError *error) {
        if (error) {
            [UIAlertController showMessage:[NSString stringWithFormat:@"upload photo error = %@", error.description]];
        } else {
            [self storyPostImages:imageUrls];
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissImagePickerViewController];
}

- (void)dismissImagePickerViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)profileImageTapped:(UITapGestureRecognizer *)recognizer {
    if (!_storyProfile || _storyProfile.profileImageURL.length == 0) {
        return;
    }
    
    [self performSegueWithIdentifier:@"ProfileImage" sender:_storyProfile.profileImageURL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ProfileImage"]) {
        ProfileImageViewController *viewController = segue.destinationViewController;
        viewController.profileImageUrlString = sender;
    }
}

@end
