//
//  SquareTool.m
//  Funny
//
//  Created by 黎铭轩 on 4/10/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "SquareTool.h"
#import "Header.h"
#import "Square.h"
@implementation SquareTool
- (void)getSquareData:(void (^)(id _Nonnull))block{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"square";
    parameters[@"c"]=@"topic";
    
    [HttpTool get:BaseURL parameters:parameters success:^(id json) {
        NSArray *squareArray=json[@"square_list"];
        block(squareArray);
    } failure:^(NSError *error) {
        
    }];
}
@end
