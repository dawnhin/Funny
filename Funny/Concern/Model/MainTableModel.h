//
//  MainTableModel.h
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableModel : NSObject
@property (assign, nonatomic)NSInteger uid;
@property (strong, nonatomic)NSString *screen_name;
@property (assign, nonatomic)NSInteger fans_count;
@property (assign, nonatomic)NSInteger tiezi_count;
@property (strong, nonatomic)NSString *header;
@property (assign, nonatomic)BOOL is_vip;
@property (strong, nonatomic)NSMutableArray *users;
@property (assign, nonatomic)NSInteger total;
@property (assign, nonatomic)NSInteger currentPage;
@end

NS_ASSUME_NONNULL_END
