//
//  AllTableViewController.m
//  Funny
//
//  Created by 黎铭轩 on 21/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "AllTableViewController.h"
#import "ModuleDataTool.h"
#import "TopicTableViewCell.h"
#import <MJRefreshNormalHeader.h>
#import <MJRefreshAutoNormalFooter.h>
#import "LatestViewController.h"
#import "CommentViewController.h"
@interface AllTableViewController ()
@property (strong, nonatomic)ModuleDataTool *tool;
@property (strong, nonatomic)NSMutableArray *topicFrames;
@property (assign, nonatomic)NSInteger page;
@property (strong, nonatomic)NSString *maxTime;
@end

@implementation AllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupRefresh];
    [self enterComment];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)enterComment{
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"commentClick" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        TopicFrame *topicFrame=x.userInfo[@"topicFrame"];
        CommentViewController *commentViewController=[[CommentViewController alloc]init];
        commentViewController.topicFrame=topicFrame;
        [self.navigationController pushViewController:commentViewController animated:YES];
    }];
}
-(void)setupTableView{
    self.view.backgroundColor=BackgroundColor;
//    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:nil] forCellReuseIdentifier:@"TopicTableViewCell"];
}
-(void)setupRefresh{
    self.tableView.mj_header=[MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha=YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}
#pragma mark - 获取最新数据
-(void)getNewData{
    self.page=0;
    [self.topicFrames removeAllObjects];
    __weak typeof(self)WeakSelf=self;
    [self.tool getDataWithArrayType:TopicTypeAll parameter:[self parameterA] block:^(id json, id parameter) {
        NSMutableArray *newArray=[NSMutableArray array];
        for (TopicModel *model in json) {
            TopicFrame *topicFrame=[[TopicFrame alloc]init];
            topicFrame.topic=model;
            [newArray addObject:topicFrame];
//            [WeakSelf.topicFrames addObject:topicFrame];
        }
        [WeakSelf.topicFrames addObjectsFromArray:newArray];
        NSString *maxTime=parameter;
        WeakSelf.maxTime=maxTime;
        [WeakSelf.tableView reloadData];
        [WeakSelf.tableView.mj_header endRefreshing];
    }];
}
-(NSString *)parameterA{
    return [self.parentViewController isKindOfClass:[LatestViewController class]] ? @"newlist" : @"list";
}
#pragma mark - 获取更多数据
-(void)getMoreData{
    NSInteger page=self.page+1;
    __weak typeof(self)WeakSelf=self;
    [self.tool getDataWithMaxtime:self.maxTime page:[NSNumber numberWithInteger:page] topicType:TopicTypeAll parameter:[self parameterA] block:^(id json, NSString *maxTime) {
        NSMutableArray *newArray=[NSMutableArray array];
        for (TopicModel *topic in json) {
            TopicFrame *topicFrame=[[TopicFrame alloc]init];
            topicFrame.topic=topic;
            [newArray addObject:topicFrame];
        }
        [WeakSelf.topicFrames addObjectsFromArray:newArray];
        [WeakSelf.tableView reloadData];
        WeakSelf.page=page;
        WeakSelf.maxTime=maxTime;
        [WeakSelf.tableView.mj_footer endRefreshing];
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell" forIndexPath:indexPath];
    cell.topicFrame=self.topicFrames[indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicFrame *frame=self.topicFrames[indexPath.row];
//    return frame.topic.height;
    return frame.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSMutableArray *)topicFrames{
    if (!_topicFrames) {
        _topicFrames=[NSMutableArray array];
    }
    return _topicFrames;
}
- (ModuleDataTool *)tool{
    if (!_tool) {
        _tool=[[ModuleDataTool alloc]init];
    }
    return _tool;
}
@end
