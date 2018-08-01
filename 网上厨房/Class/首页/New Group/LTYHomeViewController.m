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
#import "LTYScrollView.h"
#import "LTYBreakfastViewCell.h"


#define kBreakfast @"breakfastCell"

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
    UIImageView *useImageView = nil;
    UILabel *nickName = nil;
    UIImageView *starImageView = nil;
    UILabel *cookTitle = nil;
    
    if (!view) {
        view = [[LTYScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-50, kScreenWidth / 2)];
    }
    imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.homeVC scrollViewImageURLForIndex:index]];
    
    useImageView = (UIImageView *)[view viewWithTag:200];
    [useImageView setImageWithURL:[self.homeVC scrollViewUserImageURLForIndex:index]];
    
    nickName = (UILabel *) [view viewWithTag:300];
    [nickName setText:[self.homeVC nickNameForIndex:index]];
    
    starImageView = (UIImageView *) [view viewWithTag:400];
    [starImageView setImage:[self.homeVC starImageForIndex:index]];
    
    
    cookTitle = (UILabel *) [view viewWithTag:500];
    [cookTitle setText:[self.homeVC cookTitleForIndex:index]];
    
    return view;
}

#pragma mark -iCarouselDelegate

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform{
    static CGFloat max_sacle = 1.0f;
    static CGFloat min_scale = 0.9f;
    if (offset <= 1 && offset >= -1) {
        float tempScale = offset < 0 ? 1+offset : 1-offset;
        float slope = (max_sacle - min_scale) / 1;
        
        CGFloat scale = min_scale + slope*tempScale;
        transform = CATransform3DScale(transform, scale, scale, 1);
    }else{
        transform = CATransform3DScale(transform, min_scale, min_scale, 1);
    }
    
    return CATransform3DTranslate(transform, offset * self.scrollView.ic.itemWidth * 1.1, 0.0, 0.0);
}




#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenWidth/2;
    } else{
        return (kScreenWidth-30)/2+20;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else{
        return 2;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"scrollView" forIndexPath:indexPath];
        
        [cell.contentView addSubview:self.scrollView];
        
        return cell;
    } else {
        LTYBreakfastViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kBreakfast];
        NSInteger index0 = 2*indexPath.row;
        NSInteger index1 = index0+1;
        
        [cell.baseView0.backgroundImageView setImageWithURL:[self.homeVC breakfastViewBackgroundImageURLForIndex:index0]];
      //  [cell.baseView0.title setText:<#(NSString * _Nullable)#>];
      //  [cell.baseView0.userImageView setImageWithURL:<#(nonnull NSURL *)#>];
     //   [cell.baseView0.nickName setText:<#(NSString * _Nullable)#>];
     //   [cell.baseView0.starImageView setImageWithURL:<#(nonnull NSURL *)#>];
        
        [cell.baseView1.backgroundImageView setImageWithURL:[self.homeVC breakfastViewBackgroundImageURLForIndex:index1]];
     //   [cell.baseView1.title setText:<#(NSString * _Nullable)#>];
     //   [cell.baseView1.userImageView setImageWithURL:<#(nonnull NSURL *)#>];
     //   [cell.baseView1.nickName setText:<#(NSString * _Nullable)#>];
    //    [cell.baseView1.starImageView setImageWithURL:<#(nonnull NSURL *)#>];
        
        return cell;
    }
    
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
    
    NSInteger tagWidth = tagBaseSize;
    NSInteger tagHeight = tagBaseSize-30;//-20是为了补偿上下各空的10个间距
    NSInteger xBase = 10;
    for (int i = 0; i < self.homeVC.tagCount; i++) {
        LTYTagView *tagView = [[LTYTagView alloc] initWithFrame:CGRectMake(xBase, 15, tagWidth, tagHeight)];
        tagView.delegate = self;
        tagView.tag = i;
        [scrollView addSubview:tagView];
        
        [tagView.label setText:[self.homeVC headViewTagLabelForIndex:i]];
        [tagView.imageView setImageWithURL:[self.homeVC headViewTagImageViewForIndex:i]];
        
        xBase  = xBase + tagWidth-10;//-10是为了让人知道这是一个滚动视图，漏出一些tag
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
        [_tableView registerClass:[LTYBreakfastViewCell class] forCellReuseIdentifier:kBreakfast];
        
        
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
