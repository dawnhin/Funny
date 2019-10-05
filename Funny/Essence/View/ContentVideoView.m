//
//  ContentVideoView.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "ContentVideoView.h"
#import <UIImageView+WebCache.h>
#import "KRVideoPlayerController.h"
@interface ContentVideoView()
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *playTime;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)KRVideoPlayerController *videoController;

@end
@implementation ContentVideoView
+ (instancetype)VideoView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.imageView.userInteractionEnabled=YES;
    [self.imageView addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
}
-(void)showPicture{
    
}
- (IBAction)clickButton {
    self.videoController.contentURL=[NSURL URLWithString:self.topic.videouri];
    NSLog(@"%@,uri:%@",self.videoController,self.topic.videouri);
    [self addSubview:self.videoController.view];
}
- (void)setTopic:(TopicModel *)topic{
    _topic=topic;
    self.playCount.text=[NSString stringWithFormat: @"%ld播放",topic.playcount];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image1]];
    self.playTime.text=[NSString stringWithFormat: @"%02ld:%02ld",topic.videotime/60,topic.videotime%60];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (KRVideoPlayerController *)videoController{
    if (!_videoController) {
        _videoController=[[KRVideoPlayerController alloc]initWithFrame:self.imageView.bounds];
        __weak typeof(self)WeakSelf=self;
        [self.videoController setDimissCompleteBlock:^{
            WeakSelf.videoController=nil;
        }];
    }
    return _videoController;
}
@end
