//
//  RecommendViewController.m
//  Funny
//
//  Created by 黎铭轩 on 28/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "RecommendViewController.h"
#import "Header.h"
#import <MJRefreshNormalHeader.h>
#import <MJRefreshAutoNormalFooter.h>
#import "CategoryModel.h"
#import "RcommandDataTool.h"
#import "CategoryTableViewCell.h"
#import "MainTableViewCell.h"
@interface RecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *categoryTable;
@property (weak, nonatomic) IBOutlet UITableView *mainTable;
@property (assign, nonatomic)NSInteger page;
@property (strong, nonatomic)NSMutableArray *mainTableArray;
@property (strong, nonatomic)NSArray<CategoryModel *> *categoryArray;
@property (strong, nonatomic)RcommandDataTool *tool;

@end
static NSString * const category=@"CategoryTableViewCell";
static NSString * const main=@"MainTableViewCell";
@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"推荐关注";
    self.view.backgroundColor=BackgroundColor;
    self.mainTable.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    [self setupTableView];
    [self setupRefresh];
    [self.tool getCategoryData:^(id  _Nonnull json) {
        self.categoryArray=json;
        [self.categoryTable reloadData];
    }];
    
}
-(void)setupTableView{
    self.mainTable.dataSource=self;
    self.mainTable.delegate=self;
    self.categoryTable.dataSource=self;
    self.categoryTable.delegate=self;
    CGFloat navigationBarHeight=self.navigationController.navigationBar.height;
    self.mainTable.contentInset=UIEdgeInsetsMake(navigationBarHeight+statusHeight, 0, 0, 0);
    self.categoryTable.contentInset=UIEdgeInsetsMake(navigationBarHeight+statusHeight, 0, 0, 0);
    self.mainTable.rowHeight=70;
    self.categoryTable.backgroundColor=BackgroundColor;
    self.categoryTable.tableFooterView=[[UIView alloc]init];
    [self.categoryTable registerNib:[UINib nibWithNibName:@"CategoryTableViewCell" bundle:nil] forCellReuseIdentifier: category];
    [self.mainTable registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier: main];
}
-(void)setupRefresh{
    self.mainTable.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    self.mainTable.mj_header.automaticallyChangeAlpha=YES;
    [self.mainTable.mj_header beginRefreshing];
    self.mainTable.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    self.mainTable.mj_footer.hidden=YES;
}
#pragma mark - 加载最新数据
-(void)loadNew{
    self.page=1;
    [self.mainTableArray removeAllObjects];
    CategoryModel *model=self.categoryArray[self.categoryTable.indexPathForSelectedRow.row];
    [self.tool getMainDataWithID:[NSNumber numberWithInteger:model.id] block:^(id  _Nonnull json) {
        self.mainTableArray=json;
        [self.mainTable reloadData];
        [self.mainTable.mj_header endRefreshing];
    }];
}
#pragma mark - 加载更多数据
-(void)loadMore{
    self.page++;
    CategoryModel *model=self.categoryArray[self.mainTable.indexPathForSelectedRow.row];
    [self.tool getMainDataWithID:@(model.id) currentPage:self.page block:^(id  _Nonnull json) {
        [self.mainTableArray addObjectsFromArray:json];
        [self.mainTable reloadData];
        [self.mainTable.mj_footer endRefreshing];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTable) {
        return self.categoryArray.count;
    }
    else{
        return self.mainTableArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categoryTable) {
        CategoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:category forIndexPath:indexPath];
        cell.model=self.categoryArray[indexPath.row];
        return cell;
    }
    else{
        MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:main forIndexPath:indexPath];
        cell.model=self.mainTableArray[indexPath.row];
        return cell;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (RcommandDataTool *)tool{
    if (!_tool) {
        _tool=[[RcommandDataTool alloc]init];
    }
    return _tool;
}
- (NSMutableArray *)mainTableArray{
    if (!_mainTableArray) {
        _mainTableArray=[NSMutableArray array];
    }
    return _mainTableArray;
}
@end
