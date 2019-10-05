//
//  VideoTableViewController.m
//  Funny
//
//  Created by 黎铭轩 on 21/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "VideoTableViewController.h"
#import "TopicTableViewCell.h"
#import <MJRefresh/MJRefresh.h>
#import "KRVideoPlayerController.h"
#import "ModuleDataTool.h"
#import "LatestViewController.h"
@interface VideoTableViewController ()
@property (strong, nonatomic)NSMutableArray *topicFrames;
@property (strong, nonatomic)KRVideoPlayerController *videoController;
@property (assign, nonatomic)NSInteger page;
@property (strong, nonatomic)ModuleDataTool *tool;
@property (strong, nonatomic)NSString *maxtime;
@end

@implementation VideoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setRefresh];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setupTableView{
    self.view.backgroundColor=BackgroundColor;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:nil] forCellReuseIdentifier:@"TopicTableViewCell"];
}
-(void)setRefresh{
    self.tableView.mj_header=[MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha=YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}
-(void)getNewData{
    self.page=0;
    [self.topicFrames removeAllObjects];
    __weak typeof(self)WeakSelf=self;
    [self.tool getDataWithArrayType:TopicTypeVideo parameter:[self parameterA] block:^(id json, NSString *maxtime) {
        for (TopicModel *topic in json) {
            TopicFrame *topicFrame=[[TopicFrame alloc]init];
            topicFrame.topic=topic;
            [WeakSelf.topicFrames addObject:topicFrame];
        }
        WeakSelf.maxtime=maxtime;
        [WeakSelf.tableView reloadData];
        [WeakSelf.tableView.mj_header endRefreshing];
    }];
}
-(void)getMoreData{
    NSInteger page=self.page++;
    __weak typeof(self)WeakSelf=self;
    [self.tool getDataWithMaxtime:self.maxtime page:[NSNumber numberWithInteger:page] topicType:TopicTypeVideo parameter:[WeakSelf parameterA] block:^(id json, NSString *maxtime) {
        for (TopicModel *topic in json) {
            TopicFrame *topicFrame=[[TopicFrame alloc]init];
            topicFrame.topic=topic;
            [WeakSelf.topicFrames addObject:topicFrame];
        };
        [WeakSelf.tableView reloadData];
        WeakSelf.page=page;
        WeakSelf.maxtime=maxtime;
        [WeakSelf.tableView.mj_footer endRefreshing];
    }];
}
-(void)playVideoWithURL:(NSURL *)url{
    self.videoController.contentURL=url;
}
-(NSString *)parameterA{
    return [self.parentViewController isKindOfClass:[LatestViewController class]] ? @"newlist":@"list";
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
    TopicFrame *topicFrame=self.topicFrames[indexPath.row];
    return topicFrame.cellHeight;
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
- (KRVideoPlayerController *)videoController{
    if (!_videoController) {
        CGFloat width=[UIScreen mainScreen].bounds.size.width;
        _videoController=[[KRVideoPlayerController alloc]initWithFrame:CGRectMake(0, 0, width, width*9/16)];
        __weak typeof(self)WeakSelf=self;
        [_videoController setDimissCompleteBlock:^{
            WeakSelf.videoController=nil;
        }];
        [_videoController showInWindow];
    }
    return _videoController;
}
- (ModuleDataTool *)tool{
    if (!_tool) {
        _tool=[[ModuleDataTool alloc]init];
    }
    return _tool;
}
@end
