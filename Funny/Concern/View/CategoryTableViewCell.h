//
//  CategoryTableViewCell.h
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CategoryTableViewCell : UITableViewCell
@property (strong, nonatomic)CategoryModel *model;
@end

NS_ASSUME_NONNULL_END
