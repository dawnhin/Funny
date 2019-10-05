//
//  TopicFrame.h
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopicModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopicFrame : NSObject
@property (strong, nonatomic)TopicModel *topic;
@property (assign, nonatomic)CGFloat cellHeight;
/**图片或视频或声音内容尺寸*/
@property (assign, nonatomic)CGRect contentViewFrame;
@end

NS_ASSUME_NONNULL_END
