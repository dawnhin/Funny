//
//  ContentVoiceView.m
//  Funny
//
//  Created by 黎铭轩 on 24/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "ContentVoiceView.h"
#import "XFVociePlayerController.h"
#import <UIImageView+WebCache.h>
@interface ContentVoiceView()
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *playTime;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)XFVociePlayerController *voicePlayer;
@end
@implementation ContentVoiceView
+ (instancetype)voiceView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask=UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled=YES;
    [self.imageView addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
}
-(void)showPicture{
}
- (void)setTopic:(TopicModel *)topic{
    self.playCount.text=[NSString stringWithFormat: @"%ld播放",topic.playcount];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image1]];
    self.playTime.text=[NSString stringWithFormat: @"%02ld : %02ld",topic.voicetime/60,topic.videotime%60];
}
#pragma mark - 播放按钮
- (IBAction)clickButton {
    self.playButton.hidden=YES;
    self.voicePlayer=[[XFVociePlayerController alloc]initWithNibName:@"XFVociePlayerController" bundle:nil];
    self.voicePlayer.url=self.topic.voiceuri;
    self.voicePlayer.totalTime=self.topic.voicetime;
    self.voicePlayer.view.width=self.imageView.width;
    self.voicePlayer.view.y=self.imageView.height-self.voicePlayer.view.height;
    [self addSubview:self.voicePlayer.view];
}
#pragma mark - 重置
-(void)reset{
//    [self.voicePlayer dismiss];
    [self.voicePlayer.view removeFromSuperview];
    self.voicePlayer=nil;
    self.playButton.hidden=NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
