//
//  LTYTeachViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/7.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTeachViewController.h"
#import "LTYTeachViewModel.h"

@interface LTYTeachViewController ()

@property(nonatomic,strong) LTYTeachViewModel *teachVC;

@end

@implementation LTYTeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [MBProgressHUD showMessage:@"正在努力加载中..."];
    [self.teachVC getMultipleDataCompletionHandle:^(NSError *error0, NSError *error1) {
        [MBProgressHUD hideHUD];
    }];
    
}

- (instancetype)init{
    self = [super init];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    return [self initWithCollectionViewLayout:layout];
}


#pragma mark - 懒加载

- (LTYTeachViewModel *)teachVC{
    if (!_teachVC) {
        _teachVC = [LTYTeachViewModel new];
    }
    return _teachVC;
}


@end
