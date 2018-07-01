//
//  LTYSortViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/7.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYSortViewController.h"
#import "LTYSortViewModel.h"
#import "SortFistViewCell.h"
#import "SortSecondViewCell.h"
#import "CommonViewCell.h"


@interface LTYSortViewController ()<UITableViewDelegate,UITableViewDataSource,sortFirstVeiwDelegate,RecommendContentShowDelegate,CommonContentShowDelegate>

@property(nonatomic,strong)LTYSortViewModel *sortViewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation LTYSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    
    [self.sortViewModel getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.sortViewModel tempImage];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 138;
    }
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] init];
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    if (section > 1) {
        label.text = [self.sortViewModel titleForSection:section - 2];
    } else {
        if (section == 0) {
            label.text = @"视频菜谱";
        } else {
            label.text = @"推荐菜谱";
        }
    }
    
    
    [headView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.bottom.mas_equalTo(-10);
    }];
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   // NSLog(@"%ld",(long)self.sortViewModel.sectionCount);
    return self.sortViewModel.sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section <= 1) {
        return 1;
    }else{
        return [self.sortViewModel numberOfRowsForSection:(section - 2)];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        SortFistViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFCell"];
        cell.firstViewShow.tag = indexPath.section * 100;
        cell.firstViewShow.delegate =self;
        return cell;
    }else if(indexPath.section == 1){
        SortSecondViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SSCell"];
        cell.hotMenu.tag = indexPath.section *100;
        cell.hotMenu.delegate = self;
        
        cell.latestMenu.tag = indexPath.section *100 +1;
        cell.latestMenu.delegate = self;
        
        return cell;
    } else{
        CommonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CCell"];
        
         NSUInteger index = [[self.sortViewModel.sortDetailArray[indexPath.section-2] valueForKey:@"list"] count] - 1 ;//每个分区展示的个数
       
        cell.contentShow0.delegate = self;
        cell.contentShow1.delegate = self;
        cell.contentShow2.delegate = self;
        cell.contentShow3.delegate = self;
        
        for (int i = 0 ; i<4; i++) {
            if (indexPath.row * 4+i <= index) {
                UIView *view = [cell valueForKey:[NSString stringWithFormat:@"contentShow%d",i]];
                UILabel *label = [view valueForKey:@"label"];
                label.text = [self.sortViewModel detailTitleForSection:(indexPath.section- 2) index:indexPath.row * 4+i];
                
                UIImageView *imageView = [view valueForKey:@"imageView"];
                imageView.image = [UIImage  imageWithContentsOfFile:[self.sortViewModel detailImageURLForSection:indexPath.section-2 index:indexPath.row *4+i]];
                
                view.tag = indexPath.section *100 +indexPath.row * 4 + i;
                
               
                
                
            } else {
                [[[cell valueForKey:[NSString stringWithFormat:@"contentShow%d",i]] valueForKey:@"label"] setText:@""];
                [[[cell valueForKey:[NSString stringWithFormat:@"contentShow%d",i]] valueForKey:@"imageView"] setImage:[UIImage imageNamed:@"white"]];
            }
        }
        return cell;
    }
}

#pragma mark - 懒加载

- (LTYSortViewModel *)sortViewModel{
    if (!_sortViewModel) {
        _sortViewModel = [[LTYSortViewModel alloc] init];
    }
    return _sortViewModel;
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = [UIColor whiteColor];
        
        //_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];//去除头部视图留下的空白
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(20);
            make.left.bottom.right.mas_equalTo(0);
        }];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去除分割线
        _tableView.bounces = NO;
        
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[SortFistViewCell class] forCellReuseIdentifier:@"SFCell"];
        [_tableView registerClass:[SortSecondViewCell class] forCellReuseIdentifier:@"SSCell"];
        [_tableView registerClass:[CommonViewCell class] forCellReuseIdentifier:@"CCell"];
        
    }
    return _tableView;
}


#pragma delegateMethods

- (void)contentShowViewClick:(NSInteger)tag {
    NSLog(@"点击%ld",(long)tag);
}

@end
