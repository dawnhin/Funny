//
//  CategoryModel.h
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryModel : NSObject
@property (assign, nonatomic)NSInteger id;
@property (strong, nonatomic)NSString *name;
@property (assign, nonatomic)NSInteger count;
@property (strong, nonatomic)NSMutableArray *users;
@property (assign, nonatomic)NSInteger total;
@property (assign, nonatomic)NSInteger currentPage;
@end

NS_ASSUME_NONNULL_END
