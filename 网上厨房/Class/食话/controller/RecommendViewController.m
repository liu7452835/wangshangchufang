//
//  RecommendViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation RecommendViewController

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicCell"];
    
    UILabel *label = [[UILabel alloc] init];
    [cell.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    label.text = @"不要bug";
    
    return cell;
}



#pragma mark - tableViewDelegate



#pragma mark - lazeLoad

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-163) style:UITableViewStylePlain];//163包括顶部的20间距，wmpagecontroller的50+44间距，以及底部标签栏的49间距
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TopicCell"];
        
    }
    return _tableView;
}




@end
