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
    
    NSLog(@"5");
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
        NSLog(@"0");
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    [self.teachVC getMoreDateCompletionHandle:^(NSError *error) {
        NSLog(@"1");
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    [self.teachVC getTeachFreeDateCompletionHandle:^(NSError *error) {
        NSLog(@"2");
        self.count--;
        [self performSelector:@selector(updateUI) withObject:nil];
    }];
    
    NSLog(@"4");
}

- (void)updateUI{
    if (!self.count) {
        [MBProgressHUD hideHUD];
        [self.collectionView reloadData];
        NSLog(@"3");
    }
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
    return section == 1?CGSizeMake(kScreenWidth, 30):CGSizeMake(0, 0);
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
        
        [cell setUpCellWithArray:self.teachVC.tagModel.data withItemRow:indexPath.row];
        //NSLog(@"1");
        return cell;
    } else if(indexPath.section == 1){
        LTYRecommendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendColumnID forIndexPath:indexPath];
        
        
        [cell setUpCellWithArray:self.teachVC.recommendModel.list];
        
        [cell.scrollView setFrame:CGRectMake(cell.scrollView.frame.origin.x, cell.scrollView.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
        return cell;
    } else{
        //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:defaultId forIndexPath:indexPath];
        LTYFreeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:freeViewID forIndexPath:indexPath];
       
        [cell setUpCellWithArray:self.teachVC.freeTeachModel.list withItemRow:indexPath.row];
        
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ksectiontHeadId forIndexPath:indexPath];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, kScreenWidth, 20)];
        label.text = @"推荐课程";
        label.font = [UIFont systemFontOfSize:17];
        label.textAlignment = NSTextAlignmentLeft;
        [headView addSubview:label];
        return headView;
    } else{
        UICollectionReusableView *emptyView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        return emptyView;
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
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //NSLog(@"ceshi");
        
    }
    return _collectionView;
}

@end
