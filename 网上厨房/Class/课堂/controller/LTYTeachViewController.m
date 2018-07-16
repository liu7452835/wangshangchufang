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

static NSString * const tagColumnId = @"TagColumnCell";
static NSString * const recommendColumnID = @"RecommendViewCell";
static NSString * const defaultId = @"CollectionViewCell";

@interface LTYTeachViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) LTYTeachViewModel *teachVC;
@property(nonatomic,strong) UICollectionView *collectionView;

@end

@implementation LTYTeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registeCell];
    
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    [self.teachVC getDataCompletionHandle:^(NSError *error) {
        
    }];
    
    [self.teachVC getMoreDateCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.collectionView reloadData];
       // NSLog(@"2");
    }];
   
}

#pragma mark - 初始化方法

-(void)registeCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LTYTagColumnCell class]) bundle:nil] forCellWithReuseIdentifier:tagColumnId];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LTYRecommendViewCell" bundle:nil] forCellWithReuseIdentifier:recommendColumnID];
    
    [self.collectionView registerClass:[UICollectionViewCell class]     forCellWithReuseIdentifier:defaultId];
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
}

#pragma mark - dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    } else{
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LTYTagColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tagColumnId forIndexPath:indexPath];
        
        NSURL *picURL = [NSURL URLWithString:[NSString stringWithFormat: @"http://pic.ecook.cn/web/%@.jpg!s4",self.teachVC.tagModel.data[indexPath.row].imageid]];
        
        [cell.contentPic setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:picURL]]];
        
        cell.contentLabel.text = [self.teachVC titleForTag:indexPath.row];
        //NSLog(@"1");
        return cell;
    } else if(indexPath.section == 1){
        LTYRecommendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendColumnID forIndexPath:indexPath];
        
        
        [cell setUpCellWithArray:self.teachVC.recommendModel.list];
        
        [cell.scrollView setFrame:CGRectMake(cell.scrollView.frame.origin.x, cell.scrollView.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
        return cell;
    } else{
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:defaultId forIndexPath:indexPath];
        UILabel *label = [UILabel new];
        label.text = @"ok";
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        return cell;
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
        size = CGSizeMake(kScreenWidth, 300);
    } else{
        size = CGSizeMake(kScreenWidth, 10);
    }
    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 0, 5, 0);
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
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.contentInset = UIEdgeInsetsMake(20, 0, 80, 0);//滚动视图的尺寸
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //NSLog(@"ceshi");
        
    }
    return _collectionView;
}

@end
