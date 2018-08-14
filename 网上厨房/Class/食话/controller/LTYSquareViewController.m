//
//  LTYSquareViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYSquareViewController.h"

@interface LTYSquareViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation LTYSquareViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView reloadData];
    
}


- (void)viewDidAppear:(BOOL)animated{
    self.tableView.contentOffset =CGPointZero;
    
    
    [super viewDidAppear:animated];
}



#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"squareCell"];
    
    UILabel *label = [[UILabel alloc] init];
    [cell.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    label.text = @"测试一下";
    
    return cell;
}

#pragma mark - tableViewDelegate



#pragma mark - lazeLoad

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-119) style:UITableViewStylePlain];//119包括顶部的20间距，wmpagecontroller的50间距，以及底部标签栏的49简介
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"squareCell"];
        
    }
    return _tableView;
}

@end
