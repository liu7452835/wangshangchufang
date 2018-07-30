//
//  LTYHomeViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/7.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeViewController.h"
#import "LTYTagView.h"
#import "LTYHomeViewModel.h"


#define kHomeTag @"homeTagCell"

@interface LTYHomeViewController ()<UITableViewDelegate,UITableViewDataSource,LTYTagViewClickDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LTYHomeViewModel *homeVC;

@end


@implementation LTYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    
    //获取数据（回调中隐藏message，reloaddata）
    [self.homeVC getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"defaultCell" forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.text = @"ceshi";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    [cell.contentView addSubview:label];
    
    return cell;
}

#pragma mark - 设置表头视图

- (UIView *) setTableViewHeadView{
    NSInteger tagBaseSize = (kScreenWidth - 20)/4;
    
    UIView *headView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MIN, tagBaseSize)];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [headView addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    scrollView.showsHorizontalScrollIndicator = NO;
    
    NSInteger tagWidth = tagBaseSize-10;//-10是为了让人知道这是一个滚动视图，漏出一些tag
    NSInteger tagHeight = tagBaseSize-20;//-20是为了补偿上下各空的10个间距
    NSInteger xBase = 10;
    for (int i = 0; i < self.homeVC.tagCount; i++) {
        LTYTagView *tagView = [[LTYTagView alloc] initWithFrame:CGRectMake(xBase, 10, tagWidth, tagHeight)];
        tagView.delegate = self;
        tagView.tag = i;
        [scrollView addSubview:tagView];
        
        [tagView.label setText:[self.homeVC headViewTagLabelForIndex:i]];
        [tagView.imageView setImageWithURL:[self.homeVC headViewTagImageViewForIndex:i]];
        
        xBase  = xBase + tagWidth;
    }
    scrollView.contentSize = CGSizeMake(xBase +10, tagHeight);
    
    return headView;
}

#pragma mark - tagViewDelegate

- (void)tagViewDidClick:(NSInteger)tag{
     NSLog(@"点击%ld",tag);
}


#pragma mark - 懒加载

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(20);
        }];
        _tableView.backgroundColor = [UIColor whiteColor];

        UIView * headView = [self setTableViewHeadView];
        _tableView.tableHeaderView = headView;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册类
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"defaultCell"];
        
        
    }
    return _tableView;
}

- (LTYHomeViewModel *)homeVC{
    if (!_homeVC) {
        _homeVC = [[LTYHomeViewModel alloc] init];
    }
    return _homeVC;
}

@end
