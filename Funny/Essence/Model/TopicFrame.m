//
//  TopicFrame.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "TopicFrame.h"
static CGFloat const avatarMaxY=50;
static CGFloat const inset=10;
static CGFloat const toolBarHeight=50;
static CGFloat const textX=14;
static CGFloat const topcommentH=20;
@implementation TopicFrame
- (void)setTopic:(TopicModel *)topic{
    _topic=topic;
    //文字宽度
    CGFloat textWidth=[UIScreen mainScreen].bounds.size.width-28;
    //文字高度
    CGFloat textHeight=[topic.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size.height;
    //计算最大Y值
    CGFloat maxY=avatarMaxY + inset*2 + textHeight;
    if (topic.type != TopicTypeTalk) {
        CGFloat contentViewX=textX;
        CGFloat contentViewY=maxY;
        CGFloat contentViewWidth=textWidth;
        CGFloat contentViewHeight=topic.height*contentViewWidth/topic.width;
        if (topic.type == TopicTypeVideo && contentViewHeight > 250) {
            contentViewHeight=250;
            topic.bigImage=YES;
        }
        if (contentViewHeight>1500) {
            contentViewHeight=300;
            topic.bigImage=YES;
        }
        self.contentViewFrame=CGRectMake(contentViewX, contentViewY, contentViewWidth, contentViewHeight);
        maxY=contentViewY + contentViewHeight;
    }
    if (topic.top_cmt) {
        NSString *content=[NSString stringWithFormat: @"%@ : %@",topic.top_cmt.user,topic.top_cmt.content];
        CGFloat topCommentHeight=[content boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
        maxY=topCommentHeight+topcommentH+maxY;
    }
    //cell的高度
    self.cellHeight=maxY+toolBarHeight;
}
@end
