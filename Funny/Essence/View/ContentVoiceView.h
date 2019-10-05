//
//  ContentVoiceView.h
//  Funny
//
//  Created by 黎铭轩 on 24/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContentVoiceView : UIView
@property (strong, nonatomic)TopicModel *topic;
+(instancetype)voiceView;
-(void)reset;
@end

NS_ASSUME_NONNULL_END
