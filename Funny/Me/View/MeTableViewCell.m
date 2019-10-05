//
//  MeTableViewCell.m
//  Funny
//
//  Created by 黎铭轩 on 1/10/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "MeTableViewCell.h"
#import "Header.h"
@implementation MeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor=[UIColor darkGrayColor];
        self.textLabel.font=[UIFont systemFontOfSize:14];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (!self.imageView.image) {
        return;
    }
    self.imageView.width=26;
    self.imageView.height=26;
    self.textLabel.x=CGRectGetMaxX(self.imageView.frame) + 10;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
