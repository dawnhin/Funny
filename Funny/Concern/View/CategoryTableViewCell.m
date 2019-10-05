//
//  CategoryTableViewCell.m
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "UIView+Extension.h"
#import "Header.h"
@implementation CategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor=[UIColor clearColor];
    self.textLabel.textColor=[UIColor grayColor];
    UIView *selectedView=[[UIView alloc]initWithFrame:self.frame];
    UIView *selectedIndicator=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, self.height+1)];
    selectedIndicator.backgroundColor=GlobalColor(219, 21, 26, 1);
    [selectedView addSubview:selectedIndicator];
    self.selectedBackgroundView=selectedView;
    self.selectedBackgroundView.backgroundColor=GlobalColor(245, 245, 245, 1);
    self.textLabel.highlightedTextColor=GlobalColor(219, 21, 26, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(CategoryModel *)model{
    self.textLabel.text=model.name;
    self.textLabel.font=[UIFont systemFontOfSize:10];
    self.textLabel.textAlignment=NSTextAlignmentCenter;
}
@end
