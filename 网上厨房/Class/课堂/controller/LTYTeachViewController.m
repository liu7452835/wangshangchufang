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

static NSString * const tagColumnId = @"TagColumnCell";

@interface LTYTeachViewController ()

@property(nonatomic,strong) LTYTeachViewModel *teachVC;


@end

@implementation LTYTeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registeCell];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);//滚动视图的尺寸
    
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    [self.teachVC getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.collectionView reloadData];
    }];
   
}

- (instancetype)init{
    self = [super init];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    return [self initWithCollectionViewLayout:layout];
}

#pragma mark - 初始化方法

-(void)registeCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LTYTagColumnCell class]) bundle:nil] forCellWithReuseIdentifier:tagColumnId];
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
}

#pragma mark - dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LTYTagColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tagColumnId forIndexPath:indexPath];
    
    NSURL *picURL = [NSURL URLWithString:[NSString stringWithFormat: @"http://pic.ecook.cn/web/%@.jpg!s4",self.teachVC.tagModel.data[indexPath.row].imageid]];
    
    [cell.contentPic setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:picURL]]];
     
    cell.contentLabel.text = [self.teachVC titleForTag:indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionView布局

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    CGFloat W = 0;
    
        W = kCCSWidth;
        size = CGSizeMake(W, W);
    return size;
}

#pragma mark - 懒加载

- (LTYTeachViewModel *)teachVC{
    if (!_teachVC) {
        _teachVC = [LTYTeachViewModel new];
    }
    return _teachVC;
}


@end
