//
//  ModuleDataTool.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "ModuleDataTool.h"
#import "TopicModel.h"
@implementation ModuleDataTool
-(void)getDataWithArrayType:(TopicType)type parameter:(NSString *)parameter block:(void (^)(id json,id parameter))block{
    NSMutableDictionary *param=[NSMutableDictionary dictionary];
    param[@"a"]=parameter;
    param[@"c"]=@"data";
    param[@"type"]=@(type);
    
    [HttpTool get:BaseURL parameters:param success:^(id json) {
        NSArray *array=[TopicModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        NSString *maxTime=json[@"info"][@"maxtime"];
        block(array,maxTime);
    } failure:^(NSError *error) {
        
    }];
}
- (void)getDataWithMaxtime:(NSString *)maxtime page:(NSNumber *)page topicType:(TopicType)type parameter:(NSString *)parameter block:(void (^)(id, id))block{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=parameter;
    parameters[@"c"]=@"data";
    parameters[@"type"]=@(type);
    parameters[@"page"]=page;
    parameters[@"maxtime"]=maxtime;
    
    [HttpTool get:BaseURL parameters:parameters success:^(id json) {
        NSArray *talkMoreArray=[TopicModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        NSString *maxTime=json[@"info"][@"maxtime"];
        block(talkMoreArray,maxTime);
    } failure:^(NSError *error) {
        
    }];
}
@end
