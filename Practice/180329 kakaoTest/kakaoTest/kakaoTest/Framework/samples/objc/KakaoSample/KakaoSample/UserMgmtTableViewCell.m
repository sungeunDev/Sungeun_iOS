/**
 * Copyright 2015-2017 Kakao Corp.
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

#import "UserMgmtTableViewCell.h"
#import "InsetableTextField.h"
#import "UIImageView+WebCache.h"

@interface UserMgmtTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet InsetableTextField *name;
@property (weak, nonatomic) IBOutlet InsetableTextField *nickName;
@property (weak, nonatomic) IBOutlet InsetableTextField *age;
@property (weak, nonatomic) IBOutlet InsetableTextField *gender;

@end

@implementation UserMgmtTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.name.inset = self.nickName.inset = self.age.inset = self.gender.inset = 10;
}

- (void)setUser:(KOUser *)user {
    if (user == nil) {
        return;
    }
    
    NSString *imageURL = nil;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        imageURL = user.properties[KOUserThumbnailImagePropertyKey];
    } else {
        imageURL = user.properties[KOUserProfileImagePropertyKey];
    }
    
    if (imageURL) {
        [self.thumbnail sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
    } else {
        self.thumbnail.image = [UIImage imageNamed:@"PlaceHolder"];
    }
    
    if (user.email) {
        self.email.text = user.email;
    } else {
        self.email.text = @"--";
    }
    
    self.name.text = user.properties[@"name"];
    self.nickName.text = user.properties[KOUserNicknamePropertyKey];
    self.age.text = user.properties[@"age"];
    self.gender.text = user.properties[@"gender"];
}

- (NSDictionary *)userDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:4];
    if (self.email.text) {
        dictionary[@"email"] = self.email.text;
    }
    if (self.name.text) {
        dictionary[@"name"] = self.name.text;
    }
    if (self.nickName.text) {
        dictionary[KOUserNicknamePropertyKey] = self.nickName.text;
    }
    if (self.age.text) {
        dictionary[@"age"] = self.age.text;
    }
    if (self.gender.text) {
        dictionary[@"gender"] = self.gender.text;
    }
    return dictionary;
}

@end
