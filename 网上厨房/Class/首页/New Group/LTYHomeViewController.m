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
#import "FocusImageScrollView.h"

#define kHomeTag @"homeTagCell"

@interface LTYHomeViewController ()<UITableViewDelegate,UITableViewDataSource,LTYTagViewClickDelegate,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LTYHomeViewModel *homeVC;
@property(nonatomic,strong) FocusImageScrollView *scrollView;

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


#pragma mark - iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.homeVC.numberOfItemsInScrollView;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    UIImageView *imageView = nil;
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth- 80, kScreenWidth / 2)];
        UIImageView *imageView = [[UIImageView alloc] init];
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        imageView.tag = 100;
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    imageView = (UIImageView *) [view viewWithTag:100];
    [imageView setImageWithURL:[self.homeVC scrollViewImageURLForIndex:index]];
    
    return view;
}

#pragma mark -iCarouselDelegate

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenWidth/2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"scrollView" forIndexPath:indexPath];
/*
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.text = @"ceshi";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    [cell.contentView addSubview:label];
    */
    [cell.contentView addSubview:self.scrollView];
    
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"scrollView"];
        
        
    }
    return _tableView;
}

- (LTYHomeViewModel *)homeVC{
    if (!_homeVC) {
        _homeVC = [[LTYHomeViewModel alloc] init];
    }
    return _homeVC;
}

- (FocusImageScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[FocusImageScrollView alloc] initWithFocusImgNumber:self.homeVC.numberOfItemsInScrollView];
        _scrollView.ic.delegate = self;
        _scrollView.ic.dataSource = self;
        _scrollView.pageControl.hidden = YES;
    }
    return _scrollView;
}

@end
