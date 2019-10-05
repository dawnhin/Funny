//
//  UserModel.h
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject
/**用户名*/
@property (nonatomic, strong) NSString *username;
/**性别*/
@property (nonatomic, strong) NSString *sex;
/**头像*/
@property (nonatomic, strong) NSString *profile_image;
@end

NS_ASSUME_NONNULL_END
