//
//  ContentVideoView.h
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContentVideoView : UIView
@property (strong, nonatomic)TopicModel *topic;
+(instancetype)VideoView;
@end

NS_ASSUME_NONNULL_END
