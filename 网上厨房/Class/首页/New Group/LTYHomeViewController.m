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
#import "HeadView.h"
#import "LTYCourseAlbumView.h"
#import "BaseView.h"//添加面食视图
#import "iCarousel.h"//添加面食视图
#import "LTYLocalDelicaciesViewCell.h"

#define kBreakfast @"breakfastCell"
#define kCourseAlbum @"courseAlbumCell"
#define kPasta @"pastaCell"//面食视图
#define kDelicacies @"delicaciesCell"

@interface LTYHomeViewController ()<UITableViewDelegate,UITableViewDataSource,LTYTagViewClickDelegate,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LTYHomeViewModel *homeVC;
@property(nonatomic,strong) FocusImageScrollView *scrollView;
@property(nonatomic,strong) FocusImageScrollView *linerScrollView;
@property(nonatomic,strong) UIScrollView *slideScrollView;
@property(nonatomic,strong) iCarousel *pastaView;//面食视图
//@property(nonatomic,strong) LTYLocalDelicaciesViewCell *delicaciesView;
@end


@implementation LTYHomeViewController

{
    // 定义完全私有的属性 : 添加成员变量,因为不需要懒加载,所以不需要是属性
    UIPageControl *_pageControl;
}

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
    if (carousel == self.scrollView.ic) {
        return self.homeVC.numberOfItemsInScrollView;
    } else if(carousel == self.linerScrollView.ic){
        return self.homeVC.numberOfItemsInLinerScrollView;
    } else{
        return self.homeVC.numberOfItemsInPastaView;
    }
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    if (carousel == self.scrollView.ic) {
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
    } else if(carousel == self.linerScrollView.ic){
        UIImageView *linerScrollImageView = nil;
        
        if (!view) {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenWidth / 2)];
            UIImageView *imageView = [[UIImageView alloc] init];
            [view addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(1);
                make.right.mas_equalTo(-1);
                make.top.bottom.mas_equalTo(0);
            }];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.tag = 200;
            imageView.layer.cornerRadius = 1;
            imageView.clipsToBounds = YES;
        }
        linerScrollImageView = (UIImageView *)[view viewWithTag:200];
        [linerScrollImageView setImageWithURL:[self.homeVC linearScrollImageViewForIndex:index]];
        
        return view;
    }else{
        
        UIImageView *backgroundImageView = nil;
        UILabel *title = nil;
        UIImageView *userImageView = nil;
        UILabel *nickName = nil;
        UIImageView *starImageView = nil;
        
        if (!view) {
            view = [[BaseView alloc] initWithFrame:CGRectMake(0, 0, (kScreenWidth +20)/2, (kScreenWidth-30)/2)];
        }
        
        backgroundImageView = (UIImageView *)[view viewWithTag:100];
        [backgroundImageView setImageWithURL:[self.homeVC pastaViewImageURLForIndex:index]];
        
        
        title = (UILabel *) [view viewWithTag:200];
        [title setText:[self.homeVC pastaViewTitleForIndex:index]];
        
        userImageView = (UIImageView *) [view viewWithTag:300];
        [userImageView setImageWithURL:[self.homeVC pastaViewUserImageURLForIndex:index]];
        
        nickName = (UILabel *)[view viewWithTag:400];
        [nickName setText:[self.homeVC pastaViewNickNameForIndex:index]];
        
        starImageView = (UIImageView *)[view viewWithTag:500];
        [starImageView setImage:[self.homeVC starImageOfPastaViewForIndex:index]];
        
        return view;
    }
}

#pragma mark -iCarouselDelegate


- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    if (carousel == self.pastaView) {
        if (option == iCarouselOptionSpacing) {
            return value*1.05;
        }
    }
    return value;
}

-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform{
    if (carousel == self.scrollView.ic) {
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
    }else{
        return transform;
    }

}

//监控滚动第几个
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    if (carousel == self.linerScrollView.ic) {
        _pageControl.currentPage = carousel.currentItemIndex;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenWidth/2;
    } else if(indexPath.section == 2 || indexPath.section ==4){
        return kScreenWidth *2/3;
    } else{
        return (kScreenWidth-30)/2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 2 ? kScreenWidth / 2 : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        return 45;
    }
    return 25;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma mark - UITableViewDataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeadView *headView = [[HeadView alloc] init];
    if (section == 0) {
        [headView.leftTitle setText:@"热门兴趣·家常菜"];
        return headView;
    } else if(section == 1){
        [headView.leftTitle setText:@"热门兴趣·早餐"];
        return headView;
    } else if(section == 2){
        [headView.leftTitle setText:@"课程专辑"];
       // headView.rightImage.hidden = YES;
        //headView.rightTitle.hidden = YES;
        return headView;
    } else if(section == 3){
        [headView.leftTitle setText:@"热门兴趣·面食"];
        return headView;
    } else{
        [headView.leftTitle setText:@"热门兴趣·风味小吃"];
        return headView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectZero];
    if (section == 2) {
        footView = self.linerScrollView;
        return footView;
    } else {
        return footView;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 2;
    }else if (section == 4) {
        return 4;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"scrollView" forIndexPath:indexPath];
        
        [cell.contentView addSubview:self.scrollView];
        
        return cell;
    } else if(indexPath.section == 1){
        LTYBreakfastViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kBreakfast];
        NSInteger index0 = 2*indexPath.row;
        NSInteger index1 = index0+1;
        
        [cell.baseView0.backgroundImageView setImageWithURL:[self.homeVC breakfastViewBackgroundImageURLForIndex:index0]];
        [cell.baseView0.title setText:[self.homeVC breakfastTitleForIndex:index0]];
        [cell.baseView0.userImageView setImageWithURL:[self.homeVC breakfastViewUserImageURLForIndex:index0]];
        [cell.baseView0.nickName setText:[self.homeVC breakfastViewNickNameForIndex:index0]];
        [cell.baseView0.starImageView setImage:[self.homeVC starImageOfBreakfastViewForIndex:index0]];
        
        [cell.baseView1.backgroundImageView setImageWithURL:[self.homeVC breakfastViewBackgroundImageURLForIndex:index1]];
        [cell.baseView1.title setText:[self.homeVC breakfastTitleForIndex:index1]];
        [cell.baseView1.userImageView setImageWithURL:[self.homeVC breakfastViewUserImageURLForIndex:index1]];
        [cell.baseView1.nickName setText:[self.homeVC breakfastViewNickNameForIndex:index1]];
        [cell.baseView1.starImageView setImage:[self.homeVC starImageOfBreakfastViewForIndex:index1]];
        
        return cell;
    } else if(indexPath.section == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCourseAlbum];
        
        [cell.contentView addSubview:self.slideScrollView];
        [self.slideScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        for (int i = 0; i < self.homeVC.numberOfItemsInCourseView; i++) {
            LTYCourseAlbumView *courseAlbumView = nil;
            courseAlbumView = (LTYCourseAlbumView *) [self.slideScrollView viewWithTag:1100 + i*100];
            
            [courseAlbumView.backgroundImageView setImageWithURL:[self.homeVC courseAlbumViewImageURLForIndex:i]];
            [courseAlbumView.courseNumberLabel setText:[self.homeVC courseAlbumViewCourseCountsForIndex:i]];
            [courseAlbumView.courseTitleLabel setText:[self.homeVC courseAlbumViewTitleForIndex:i]];

        }
        return cell;
    } else if(indexPath.section == 3){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPasta];
        [cell.contentView addSubview:self.pastaView];
        [self.pastaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        return cell;
    } else{
        LTYLocalDelicaciesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDelicacies];
        
        [cell.snackView.backgroundImageView setImageWithURL:[self.homeVC delicaciesViewImageURLForIndex:indexPath.row]];
        [cell.snackView.title setText:[self.homeVC delicaciesViewTitleForIndex:indexPath.row]];
        [cell.snackView.userImageView setImageWithURL:[self.homeVC delicaciesViewUserImageURLForIndex:indexPath.row]];
        [cell.snackView.nickName setText:[self.homeVC delicaciesViewNickNameForIndex:indexPath.row]];
        [cell.snackView.starImageView setImage:[self.homeVC starImageOfDelicaciesViewForIndex:indexPath.row]];
        
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
        LTYTagView *tagView = [[LTYTagView alloc] initWithFrame:CGRectMake(xBase, 10, tagWidth, tagHeight)];
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
        _tableView.showsVerticalScrollIndicator = NO;
        
        UIView * headView = [self setTableViewHeadView];
        _tableView.tableHeaderView = headView;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册类
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"scrollView"];
        [_tableView registerClass:[LTYBreakfastViewCell class] forCellReuseIdentifier:kBreakfast];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCourseAlbum];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kPasta];
        [_tableView registerClass:[LTYLocalDelicaciesViewCell class] forCellReuseIdentifier:kDelicacies];
        _tableView.estimatedSectionFooterHeight = 0;
        
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

- (FocusImageScrollView *)linerScrollView{
    if (!_linerScrollView) {
        _linerScrollView = [[FocusImageScrollView alloc] initWithFocusImgNumber:self.homeVC.numberOfItemsInLinerScrollView];
        _linerScrollView.ic.delegate = self;
        _linerScrollView.ic.dataSource = self;
        _linerScrollView.ic.type = iCarouselTypeLinear;
        _pageControl = _linerScrollView.pageControl;
    }
    return _linerScrollView;
}

- (UIScrollView *)slideScrollView{
    if (!_slideScrollView) {
        _slideScrollView = [[UIScrollView alloc] init];
        _slideScrollView.tag = 1000;
        NSInteger xBase = 10;
        for (int i = 0; i < self.homeVC.numberOfItemsInCourseView; i++) {
            LTYCourseAlbumView *courseAlbumView = [[LTYCourseAlbumView alloc] initWithFrame:CGRectMake(xBase, 10, (kScreenWidth - 50)/2, kScreenWidth *2/3-20)];
            [_slideScrollView addSubview:courseAlbumView];
            courseAlbumView.tag = 1100+i*100;
            xBase = xBase+(kScreenWidth - 50)/2+10;
        }
        _slideScrollView.contentSize = CGSizeMake(xBase, kScreenWidth *2/3-20);
        _slideScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _slideScrollView;
}

- (iCarousel *)pastaView{
    if (!_pastaView) {
        _pastaView = [[iCarousel alloc] init];
        _pastaView.delegate = self;
        _pastaView.dataSource = self;
        _pastaView.type = iCarouselTypeLinear;
        //如果只有一张图，则不可以滚动
        _pastaView.scrollEnabled = self.homeVC.numberOfItemsInPastaView != 1;
        
        //手动翻页时，让图片一张一张滚，默认为NO,滚一次到尾
        _pastaView.pagingEnabled = YES;
        
        //一开始中心图偏移量
        _pastaView.contentOffset = CGSizeMake(-kScreenWidth/2+(kScreenWidth + 20)/4+5, 0);
        
    }
    return _pastaView;
}

@end
