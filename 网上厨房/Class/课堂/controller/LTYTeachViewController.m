//
//  LTYTeachViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/7.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTeachViewController.h"
#import "LTYTeachViewModel.h"
#import "LTYTagColumnCell.h"
#import "LTYTeachTagModel.h"
#import "LTYTeachRecommendModel.h"
#import "LTYRecommendViewCell.h"
#import "LTYFreeViewCell.h"
#import "LTYTeachBannerViewModel.h"
#import "LTYBannerListModel.h"


static NSString * const tagColumnId = @"TagColumnCell";
static NSString * const recommendColumnID = @"RecommendViewCell";
static NSString * const freeViewID = @"FreeViewCell";
static NSString * const defaultId = @"CollectionViewCell";
static NSString * const allListViewID = @"AllListViewCell";

#define ksectionHeadId @"SectionHeadCell"
#define ksectionFootId @"SectionFootCell"

@interface LTYTeachViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) LTYTeachViewModel *teachVC;
@property(nonatomic,strong) LTYTeachBannerViewModel *bannerListVC;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,assign) __block int count;
@end

@implementation LTYTeachViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registeCell];
    
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    
    [self getData];
    
    [self loadData];
    
    //NSLog(@"5");
    /*
     [self.teachVC getDataCompletionHandle:^(NSError *error) {
     [MBProgressHUD hideHUD];
     [self.collectionView reloadData];
     }];
     [self.teachVC getMoreDateCompletionHandle:^(NSError *error) {
     [MBProgressHUD hideHUD];
     [self.collectionView reloadData];
     }];
     
     [self.teachVC getTeachFreeDateCompletionHandle:^(NSError *error) {
     [MBProgressHUD hideHUD];
     [self.collectionView reloadData];
     // NSLog(@"2");
     }];
     */
}

- (void) loadData{
    //添加上拉刷新
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //添加下拉刷新
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
}


- (void) refreshData{
    [self.teachVC.teachListData removeObjectsInRange:NSMakeRange(1, self.teachVC.teachListData.count-1)];
    self.teachVC.page = 0;
    [self getData];
    //[self.collectionView reloadData];
    
}




- (void) loadMoreData{
    //发起请求
    [self.teachVC getMoreTeachLatestAllCompletionHandle:^(NSError *error) {
        [self.collectionView reloadData];
        [self.collectionView.mj_footer endRefreshing];
    }];
}

- (void) getData{
    
    self.count = 5;
    
    [self.teachVC getDataCompletionHandle:^(NSError *error) {
        //NSLog(@"0");
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    [self.teachVC getMoreDateCompletionHandle:^(NSError *error) {
        // NSLog(@"1");
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    [self.teachVC getTeachFreeDateCompletionHandle:^(NSError *error) {
        // NSLog(@"2");
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    /*
    [self.teachVC getTeachLatestAllCompletionHandle:^(NSError *error) {
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    */
    
    [self.teachVC getMoreTeachLatestAllCompletionHandle:^(NSError *error) {
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    [self.bannerListVC getDataCompletionHandle:^(NSError *error) {
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    //NSLog(@"4");
}

- (void)updateUI{
    if (!self.count) {
        [MBProgressHUD hideHUD];
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        // NSLog(@"3");
    }
}


- (NSString *)convertStarNumber:(NSNumber *)starNum{
    NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    return starArray[starNum.intValue];
}

- (NSString *)timestampSwitchTime:(NSNumber *)timestamp{
    
    //NSString *string = @"1532160000000,";
    NSInteger timestampNumber = [timestamp integerValue];
    NSLog(@"%ld",timestampNumber);
    NSTimeInterval second = timestampNumber / 1000.0;
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //NSLog(@"%@", date);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"M月dd日"];
    
    NSString *stringDate = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *stringTime = [formatter stringFromDate:date];
    
    //NSLog(@"%@",stringDate);
    
    //NSLog(@"%@",stringTime);
    
    NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    NSInteger weekday = [components weekday];
    
    //NSLog(@"%ld",weekday);
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    //NSLog(@"%@",weekdays[weekday]);
    
    NSString *timeDate = [stringDate stringByAppendingFormat:@" %@ %@开始",weekdays[weekday],stringTime];
    
    //NSLog(@"%@",timeDate);
    
    return timeDate;
    
}

- (BOOL) isWaitToPlayWithIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.teachVC.freeTeachModel.list;
    NSInteger plyaTimeStamp = [[array[indexPath.row] valueForKey:@"startTime"] integerValue]/1000;
    
    NSInteger nowTimeStamp = [[NSDate date] timeIntervalSince1970];
    
    // NSLog(@"%ld",plyaTimeStamp);
    //  NSLog(@"%ld",nowTimeStamp);
    //  NSLog(@"%ld",plyaTimeStamp - nowTimeStamp);
    if ((plyaTimeStamp - nowTimeStamp) > 0) {
        return YES;
    } else{
        return NO;
    }
}


#pragma mark - 初始化方法

-(void)registeCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LTYTagColumnCell class]) bundle:nil] forCellWithReuseIdentifier:tagColumnId];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LTYRecommendViewCell" bundle:nil] forCellWithReuseIdentifier:recommendColumnID];
    [self.collectionView registerClass:[LTYFreeViewCell class] forCellWithReuseIdentifier:freeViewID];
    [self.collectionView registerClass:[UICollectionViewCell class]     forCellWithReuseIdentifier:defaultId];
     [self.collectionView registerNib:[UINib nibWithNibName:@"LTYRecommendViewCell" bundle:nil] forCellWithReuseIdentifier:allListViewID];
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ksectionHeadId];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ksectionFootId];
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (section == 0 || section >3) ? CGSizeMake(0, 0) : CGSizeMake(kScreenWidth, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return (section <3 || section>7) ? CGSizeMake(0, 0) : CGSizeMake(kScreenWidth, 100);
}


#pragma mark - dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3+self.teachVC.teachListData.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    } else if(section == 1){
        return 1;
    } else if(section == 2){
        return 2;
    } else{
        return 10;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LTYTagColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tagColumnId forIndexPath:indexPath];
        
        NSURL *picURL = [NSURL URLWithString:[NSString stringWithFormat: @"http://pic.ecook.cn/web/%@.jpg!s4",[self.teachVC.tagModel.data[indexPath.row] valueForKey: @"imageid"]]];
        
        [cell.contentPic setImageWithURL:picURL];
        
        cell.contentLabel.text = [self.teachVC.tagModel.data[indexPath.row] valueForKey:@"title"];
        
        //NSLog(@"1");
        return cell;
    } else if(indexPath.section == 2){
        
        LTYFreeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:freeViewID forIndexPath:indexPath];
        
        NSArray *array = self.teachVC.freeTeachModel.list;
        
        NSString *backgroudImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[indexPath.row] valueForKey:@"himg"]];
        NSURL *backgroundURL = [NSURL URLWithString:backgroudImagePath];
        [cell.freeView.recommendBackgroundImageView setImageWithURL:backgroundURL];
        //[recommendView.recommendBackgroundImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:backgroundURL]]];
        //NSLog(@"%@",backgroundURL);
        
        cell.freeView.title.text = [array[indexPath.row] valueForKey:@"title"];
        // NSLog(@"%@",recommendView.title.text);
        
        NSString *idImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[indexPath.row] valueForKeyPath:@"teacher.imageid"]];
        NSURL *idIamgeURL = [NSURL URLWithString:idImagePath];
        [cell.freeView.idImageView setImageWithURL:idIamgeURL];
        //[recommendView.idImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:idIamgeURL]]];
        // NSLog(@"%@",idIamgeURL);
        
        cell.freeView.nickName.text = [array[indexPath.row] valueForKeyPath:@"teacher.nickname"];
        //NSLog(@"%@",recommendView.nickName.text);
        
        [cell.freeView.starImageView setImage:[UIImage imageNamed:[self convertStarNumber:[array[indexPath.row] valueForKeyPath:@"teacher.star"]]]];
        // NSLog(@"%@",[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]);
        
        [cell.freeView.timeLabel setText: [array[indexPath.row] valueForKey:@"startTime"] ? [self timestampSwitchTime:[array[indexPath.row] valueForKey:@"startTime"]] : nil];
        //NSLog(@"%@",[array[itemRow] valueForKey:@"startTime"]);
        
        
        
        if ([array[indexPath.row] valueForKey:@"startTime"]) {
            
            if ([self isWaitToPlayWithIndexPath:indexPath]) {
                [cell.freeView.timeImageView setImage:[UIImage imageNamed:@"begin"]];
                NSLog(@"777");
                
                for (CAReplicatorLayer *layer in cell.freeView.timeImageView.layer.sublayers)
                {
                    [layer removeFromSuperlayer];
                }//去除添加的复制层（播放动画）
                
                return cell;
            } else {
                NSLog(@"888");
                [cell.freeView.timeImageView setImage:[UIImage imageNamed:@"live"]];
                
                
                
                CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
                replicatorLayer.frame = CGRectMake(0, 0, cell.freeView.timeImageView.image.size.width, cell.freeView.timeImageView.image.size.height *3/5);
                replicatorLayer.instanceCount = 5;
                replicatorLayer.instanceTransform  = CATransform3DMakeTranslation(10, 0, 0);
                replicatorLayer.instanceDelay = 0.2;
                replicatorLayer.masksToBounds = YES;
                // replicatorLayer.backgroundColor = [UIColor blackColor].CGColor;
                
                CALayer *layer = [CALayer layer];
                layer.frame = CGRectMake(5, replicatorLayer.bounds.size.height/2, 5, cell.freeView.timeImageView.image.size.height/2);
                layer.backgroundColor = [UIColor yellowColor].CGColor;
                
                [replicatorLayer addSublayer:layer];
                
                [cell.freeView.timeImageView.layer addSublayer:replicatorLayer];
                
                
                layer.anchorPoint = CGPointMake(0, 1);
                
                CABasicAnimation *animation = [CABasicAnimation animation];
                animation.duration = 0.5;
                /*animation.keyPath = @"position.y";
                 
                 animation.fromValue = @200;
                 animation.toValue = @150;
                */
                animation.keyPath = @"transform.scale.y";
                animation.toValue = @0.1;
                
                animation.autoreverses = YES;
                animation.repeatCount = MAXFLOAT;
                [layer addAnimation:animation forKey:nil];
                NSLog(@"666");
                
                
                
                
                return cell;
            }
        }
        return cell;
        
    } else if(indexPath.section == 1){
        LTYRecommendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendColumnID forIndexPath:indexPath];
        
        [cell.scrollView setFrame:CGRectMake(cell.scrollView.frame.origin.x, cell.scrollView.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
        
        NSArray *array = self.teachVC.recommendModel.list;
        
        CGFloat xbase = 10;
        CGFloat width = (kScreenWidth - 30)/2;
        
        for (int i = 0; i < krecommendCount; i++) {
            
            LTYRecommendView *recommendView = [[LTYRecommendView alloc] init];
            
            NSString *backgroudImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[i] valueForKey:@"himg"]];
            NSURL *backgroundURL = [NSURL URLWithString:backgroudImagePath];
            [recommendView.recommendBackgroundImageView setImageWithURL:backgroundURL];
            //[recommendView.recommendBackgroundImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:backgroundURL]]];
            //NSLog(@"%@",backgroundURL);
            
            recommendView.title.text = [array[i] valueForKey:@"title"];
            // NSLog(@"%@",recommendView.title.text);
            
            NSString *idImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[i] valueForKeyPath:@"teacher.imageid"]];
            NSURL *idIamgeURL = [NSURL URLWithString:idImagePath];
            [recommendView.idImageView setImageWithURL:idIamgeURL];
            //[recommendView.idImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:idIamgeURL]]];
            // NSLog(@"%@",idIamgeURL);
            
            recommendView.nickName.text = [array[i] valueForKeyPath:@"teacher.nickname"];
            //NSLog(@"%@",recommendView.nickName.text);
            
            [recommendView.starImageView setImage:[UIImage imageNamed:[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]]];
            // NSLog(@"%@",[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]);
            
            [cell.scrollView addSubview:recommendView];
            
            [recommendView setFrame:CGRectMake(xbase, 5, width, kScreenWidth *5/6)];
            
            // NSLog(@"%f",xbase);
            
            xbase = xbase + 10 +width;
            
        }
        [cell.scrollView setContentSize:CGSizeMake(xbase, cell.scrollView.frame.size.height)];
        
        
        
        return cell;
    } else{
        LTYRecommendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:allListViewID forIndexPath:indexPath];
       
        NSArray *array = self.teachVC.teachListData[indexPath.section - 3].list;
        
        NSString *backgroudImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[indexPath.row] valueForKey:@"himg"]];
        NSURL *backgroundURL = [NSURL URLWithString:backgroudImagePath];
        [cell.allListView.recommendBackgroundImageView setImageWithURL:backgroundURL];
        //[recommendView.recommendBackgroundImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:backgroundURL]]];
        //NSLog(@"%@",backgroundURL);
        
        cell.allListView.title.text = [array[indexPath.row] valueForKey:@"title"];
        // NSLog(@"%@",recommendView.title.text);
        
        NSString *idImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[indexPath.row] valueForKeyPath:@"teacher.imageid"]];
        NSURL *idIamgeURL = [NSURL URLWithString:idImagePath];
        [cell.allListView.idImageView setImageWithURL:idIamgeURL];
        //[recommendView.idImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:idIamgeURL]]];
        // NSLog(@"%@",idIamgeURL);
        
        cell.allListView.nickName.text = [array[indexPath.row] valueForKeyPath:@"teacher.nickname"];
        //NSLog(@"%@",recommendView.nickName.text);
        
        [cell.allListView.starImageView setImage:[UIImage imageNamed:[self convertStarNumber:[array[indexPath.row] valueForKeyPath:@"teacher.star"]]]];
        // NSLog(@"%@",[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]);
        
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section >=1 && indexPath.section<=3) {
            UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ksectionHeadId forIndexPath:indexPath];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, kScreenWidth, 20)];
            label.font = [UIFont systemFontOfSize:17];
            label.textAlignment = NSTextAlignmentLeft;
            
            for (UIView *view in headView.subviews) {
                [view removeFromSuperview];
            }// 解决复用bug
            
            [headView addSubview:label];
            
            if (indexPath.section == 1) {
                
                label.text = @"推荐课程";
                // NSLog(@"1111");
                // NSLog(@"%@",label.text);
                
            } else if(indexPath.section == 2){
                
                label.text = @"免费课程";
                //  NSLog(@"1111");
                //  NSLog(@"%@",label.text);
                
            } else{
                label.text = @"全部课程";
            }
            return headView;
            
        } else{
            UICollectionReusableView *emptyView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
            return emptyView;
        }
        
        
        
        /*
         
         // UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ksectiontHeadId forIndexPath:indexPath];
         UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, kScreenWidth, 20)];
         label.font = [UIFont systemFontOfSize:17];
         label.textAlignment = NSTextAlignmentLeft;
         [headView addSubview:label];
         
         if (indexPath.section == 1) {
         
         label.text = @"推荐课程";
         NSLog(@"1111");
         NSLog(@"%@",label.text);
         return headView;
         } else if(indexPath.section == 2){
         label.text = @"免费课程";
         NSLog(@"2222");
         NSLog(@"%@",label.text);
         return headView;
         } else{
         UICollectionReusableView *emptyView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
         return emptyView;
         }
         */
    } else{
        if (indexPath.section >=3 && indexPath.section<=7) {
            UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ksectionFootId forIndexPath:indexPath];
            
            UIImageView *imageView = [[UIImageView alloc] init];
            
            NSString *imageURL = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",[self.bannerListVC.bannerListModle.list[indexPath.section -3] valueForKey:@"imageId"]];
            
            [imageView setImageWithURL:[NSURL URLWithString:imageURL]];
            
            for (UIView *view in footView.subviews) {
                [view removeFromSuperview];
            }// 解决复用bug
            footView.contentMode = UIViewContentModeScaleAspectFit;
            [footView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
            
            return footView;
        }
        return nil;
    }
    
}


#pragma mark - UICollectionView布局


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    CGFloat W = 0;
    
    if (indexPath.section == 0) {
        W = kCCSWidth;
        size = CGSizeMake(W, W);
        return size;
    } else if(indexPath.section == 1){
        W = kScreenWidth;
        size = CGSizeMake(kScreenWidth, kScreenWidth*5/6);
    } else if(indexPath.section == 2){
        size = CGSizeMake((kScreenWidth-30)/2, (kScreenWidth-30)*2/3);
    } else{
        size = CGSizeMake((kScreenWidth-30)/2, (kScreenWidth-30)/2);
    }
    return size;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        return UIEdgeInsetsMake(5, 0, -5, 0);
    } else {
        return UIEdgeInsetsMake(5, 10, -5, 10);
    }
    
}

#pragma mark - 懒加载

- (LTYTeachViewModel *)teachVC{
    if (!_teachVC) {
        _teachVC = [[LTYTeachViewModel alloc]init];
    }
    return _teachVC;
}

- (LTYTeachBannerViewModel *)bannerListVC{
    if (!_bannerListVC) {
        _bannerListVC = [[LTYTeachBannerViewModel alloc] init];
    }
    return _bannerListVC;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        //layout.headerReferenceSize = CGSizeMake(kScreenWidth, 30);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.top.mas_equalTo(20);
        }];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);//滚动视图的尺寸
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //NSLog(@"ceshi");
        
    }
    return _collectionView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

@end
