//
//  RcommandDataTool.m
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "RcommandDataTool.h"
#import "Header.h"
#import "CategoryModel.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "MainTableModel.h"
@implementation RcommandDataTool
- (void)getCategoryData:(Block)block{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"category";
    parameters[@"c"]=@"subscribe";
    [HttpTool get:BaseURL parameters:parameters success:^(id json) {
        NSArray *listArray=[CategoryModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        block(listArray);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败..."];
    }];
}
- (void)getMainDataWithID:(NSNumber *)Id block:(Block)block{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"subscribe";
    parameters[@"category_id"]=Id;
    [HttpTool get:BaseURL parameters:parameters success:^(id json) {
        NSMutableArray *mainArray=[MainTableModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        block(mainArray);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败..."];
    }];
}
- (void)getMainDataWithID:(NSNumber *)Id currentPage:(NSInteger)currentPage block:(Block)block{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"subscribe";
    parameters[@"category_id"]=Id;
    parameters[@"page"]=@(currentPage);
    [HttpTool get:BaseURL parameters:parameters success:^(id json) {
        NSMutableArray *mainArray=[MainTableModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        block(mainArray);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败..."];
    }];
}
@end
