//
//  TopicTableViewCell.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "ContentPictureView.h"
#import "ContentVideoView.h"
#import "ContentVoiceView.h"
@interface TopicTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *create_time;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *unlikeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *topCommentText;
@property (weak, nonatomic) IBOutlet UIView *commentView;
@property (strong, nonatomic)ContentPictureView *pictureView;
@property (strong, nonatomic)ContentVideoView *videoView;
@property (strong, nonatomic)ContentVoiceView *voiceView;
@end
@implementation TopicTableViewCell
+ (instancetype)cell{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.text.numberOfLines=0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setTopicFrame:(TopicFrame *)topicFrame{
    TopicModel *topic=topicFrame.topic;
    [self.avatar setHeader:topic.profile_image];
    self.name.text=topic.name;
    self.create_time.text=topic.created_at;
    self.text.text=topic.text;
    [self.likeButton setTitle:[NSString stringWithFormat:@"%ld",topic.ding] forState:UIControlStateNormal];
    [self.unlikeButton setTitle:[NSString stringWithFormat:@"%ld",topic.cai] forState:UIControlStateNormal];
    [self.shareButton setTitle:[NSString stringWithFormat: @"%ld",topic.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld",topic.comment] forState:UIControlStateNormal];
    if (topic.top_cmt) {
        self.commentView.hidden=NO;
        self.topCommentText.text=[NSString stringWithFormat: @"%@ : %@",topic.top_cmt.user.username,topic.top_cmt.content];
    }
    else{
        self.commentView.hidden=YES;
    }
    if (topic.type == TopicTypePicture) {
        self.pictureView.topic=topic;
        self.pictureView.frame=topicFrame.contentViewFrame;
        self.pictureView.hidden=NO;
        self.voiceView.hidden=YES;
        self.videoView.hidden=YES;
    }
    else if (topic.type == TopicTypeVideo){
        self.videoView.topic=topic;
        self.videoView.frame=topicFrame.contentViewFrame;
        self.videoView.hidden=NO;
        self.pictureView.hidden=YES;
        self.voiceView.hidden=YES;
    }
    else if (topic.type == TopicTypeVoice){
        self.voiceView.topic=topic;
        self.voiceView.frame=topicFrame.contentViewFrame;
        self.voiceView.hidden=NO;
        self.pictureView.hidden=YES;
        self.videoView.hidden=YES;
    }
    else{
        self.pictureView.hidden=YES;
        self.voiceView.hidden=YES;
        self.videoView.hidden=YES;
    }
}
- (void)setFrame:(CGRect)frame{
    CGFloat inset=5;
    frame.size.height -= inset;
    [super setFrame:frame];
}
- (IBAction)clickButton {
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *save=[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *report=[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:cancel];
    [alertController addAction:save];
    [alertController addAction:report];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)clickComment {
    NSDictionary *dictionary=[NSDictionary dictionaryWithObject:self.topicFrame forKey:@"topicFrame"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"commentClick" object:nil userInfo:dictionary];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (ContentPictureView *)pictureView{
    if (!_pictureView) {
        _pictureView=[ContentPictureView pictureView];
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}
- (ContentVideoView *)videoView{
    if (!_videoView) {
        _videoView=[ContentVideoView VideoView];
        [self.contentView addSubview:_videoView];
    }
    return _videoView;
}
- (ContentVoiceView *)voiceView{
    if (!_voiceView) {
        _voiceView=[ContentVoiceView voiceView];
        [self.contentView addSubview:_voiceView];
    }
    return _voiceView;
}
@end
