//
//  TopicTableViewCell.h
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicFrame.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopicTableViewCell : UITableViewCell
@property (strong, nonatomic)TopicFrame *topicFrame;
+(instancetype)cell;
@end

NS_ASSUME_NONNULL_END
