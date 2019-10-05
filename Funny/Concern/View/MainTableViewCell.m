//
//  MainTableViewCell.m
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "MainTableViewCell.h"
#import <Masonry/Masonry.h>
#import <UIImageView+WebCache.h>
@interface MainTableViewCell()
@property (strong, nonatomic)UIImageView *avatar;
@property (strong, nonatomic)UILabel *name;
@property (strong, nonatomic)UILabel *concernCount;
@property (strong, nonatomic)UIView *separator;
@property (strong, nonatomic)UIButton *follow;
@property (strong, nonatomic)UIView *line;
@end
@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.contentView addSubview:self.avatar];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.concernCount];
    [self.contentView addSubview:self.separator];
    [self.contentView addSubview:self.follow];
    [self.contentView addSubview:self.line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews{
    [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(14);
        make.left.mas_offset(12);
        make.bottom.mas_offset(-13.5);
        make.width.mas_equalTo(42);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatar.mas_right).mas_equalTo(17);
        make.top.equalTo(self.avatar.mas_top);
        make.width.mas_equalTo(161);
        make.height.mas_equalTo(19.5);
    }];
    [self.concernCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatar.mas_right).offset(17);
        make.bottom.mas_equalTo(self.avatar.mas_bottom);
        make.width.mas_equalTo(161);
        make.height.mas_equalTo(14.5);
    }];
    [self.follow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(-10);
        make.width.mas_equalTo(56);
        make.height.mas_equalTo(25);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(0.5);
    }];
}
- (void)setModel:(MainTableModel *)model{
    if (model.is_vip) {
        self.name.textColor=[UIColor redColor];
    }
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:model.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.name.text=model.screen_name;
    self.concernCount.text=[NSString stringWithFormat: @"%ld人关注",model.fans_count];
}
- (UIImageView *)avatar{
    if (!_avatar) {
        _avatar=[[UIImageView alloc]init];
        _avatar.layer.cornerRadius=21;
        _avatar.layer.masksToBounds=YES;
    }
    return _avatar;
}
- (UILabel *)name{
    if (!_name) {
        _name=[[UILabel alloc]init];
        _name.font=[UIFont systemFontOfSize:15];
    }
    return _name;
}
- (UILabel *)concernCount{
    if (!_concernCount) {
        _concernCount=[[UILabel alloc]init];
        _concernCount.textColor=[UIColor grayColor];
        _concernCount.font=[UIFont systemFontOfSize:12];
    }
    return _concernCount;
}
- (UIButton *)follow{
    if (!_follow) {
        _follow=[UIButton buttonWithType:UIButtonTypeSystem];
        [_follow setTitle:@"+ 关注" forState:UIControlStateNormal];
        [_follow setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_follow.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_follow setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    }
    return _follow;
}
- (UIView *)line{
    if (!_line) {
        _line=[[UIView alloc]initWithFrame:CGRectMake(0, self.contentView.frame.size.height-0.5, self.contentView.frame.size.width, 0.5)];
        _line.backgroundColor=[UIColor lightGrayColor];
    }
    return _line;
}
@end
