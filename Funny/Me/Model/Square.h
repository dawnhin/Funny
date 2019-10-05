//
//  Square.h
//  Funny
//
//  Created by 黎铭轩 on 4/10/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Square : NSObject
/** id */
//@property (nonatomic, strong) NSString *id;
/** 图片 */
@property (nonatomic, strong) NSString *icon;
/** 标题文字 */
@property (nonatomic, strong) NSString *name;
/** 链接 */
@property (nonatomic, strong) NSString *url;
/** cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
