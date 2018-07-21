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


static NSString * const tagColumnId = @"TagColumnCell";
static NSString * const recommendColumnID = @"RecommendViewCell";
static NSString * const freeViewID = @"FreeViewCell";
static NSString * const defaultId = @"CollectionViewCell";

#define ksectiontHeadId @"SectionHeadCell"

@interface LTYTeachViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) LTYTeachViewModel *teachVC;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,assign) __block int count;
@end

@implementation LTYTeachViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registeCell];
    
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    
    [self getData];
    
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


- (void) getData{
    
    self.count = 3;
    
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
    
    //NSLog(@"4");
}

- (void)updateUI{
    if (!self.count) {
        [MBProgressHUD hideHUD];
        [self.collectionView reloadData];
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


#pragma mark - 初始化方法

-(void)registeCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LTYTagColumnCell class]) bundle:nil] forCellWithReuseIdentifier:tagColumnId];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LTYRecommendViewCell" bundle:nil] forCellWithReuseIdentifier:recommendColumnID];
    [self.collectionView registerClass:[LTYFreeViewCell class] forCellWithReuseIdentifier:freeViewID];
    [self.collectionView registerClass:[UICollectionViewCell class]     forCellWithReuseIdentifier:defaultId];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ksectiontHeadId];
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return section == 0 ? CGSizeMake(0, 0) : CGSizeMake(kScreenWidth, 30);
}

#pragma mark - dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    } else if(section == 1){
        return 1;
    } else{
        return 2;
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
        [cell.freeView.timeLabel setText:[self timestampSwitchTime:[array[indexPath.row] valueForKey:@"startTime"]]];
        
        return cell;
    } else{
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
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section >=1) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ksectiontHeadId forIndexPath:indexPath];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, kScreenWidth, 20)];
        label.font = [UIFont systemFontOfSize:17];
        label.textAlignment = NSTextAlignmentLeft;
        
        for (UIView *view in headView.subviews) {
            [view removeFromSuperview];
        }// 解决复用bug
        
        [headView addSubview:label];
        
        if (indexPath.section == 1) {
            
            label.text = @"推荐课程";
            NSLog(@"1111");
            NSLog(@"%@",label.text);

        } else{
        
            label.text = @"免费课程";
            NSLog(@"1111");
            NSLog(@"%@",label.text);
            
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
    } else{
        size = CGSizeMake((kScreenWidth-30)/2, (kScreenWidth-30)*2/3);
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
        _teachVC = [LTYTeachViewModel new];
    }
    return _teachVC;
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

@end
