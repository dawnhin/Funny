//
//  Header.h
//  Funny
//
//  Created by 黎铭轩 on 21/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#ifndef Header_h
#define Header_h
#import <ReactiveObjC.h>
#import "UIView+Extension.h"
#import "HttpTool.h"
#import <MJExtension/MJExtension.h>
#import "UIImageView+placeHolder.h"
#import "NSString+Time.h"
#define statusHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define BaseURL @"http://api.budejie.com/api/api_open.php"
#define GlobalColor(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]
#define BackgroundColor GlobalColor(229, 229, 229, 1)
#endif /* Header_h */

typedef NS_ENUM(NSUInteger, TopicType) {
    TopicTypeAll = 1,
    TopicTypePicture = 10,
    TopicTypeTalk = 29,
    TopicTypeVoice = 31,
    TopicTypeVideo = 41
};
