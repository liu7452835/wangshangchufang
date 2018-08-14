//
//  LTYInterlocutionViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYInterlocutionViewController.h"
#import "WMPageController.h"
#import "SolvedViewController.h"
#import "UnsolvedViewController.h"

@interface LTYInterlocutionViewController ()
@property(nonatomic,strong) WMPageController *pageViewController;

@end

@implementation LTYInterlocutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pageViewController.view];
    self.pageViewController.viewFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 170);
}


- (WMPageController *)pageViewController{
    if (!_pageViewController) {
        _pageViewController = [[WMPageController alloc] initWithViewControllerClasses:@[[UnsolvedViewController class],[SolvedViewController class]] andTheirTitles:@[@"未解决",@"已解决"]];
        _pageViewController.menuViewStyle = WMMenuViewStyleLine;
        _pageViewController.menuBGColor        = [UIColor whiteColor];
        _pageViewController.menuHeight         = 44;
        _pageViewController.progressWidth      = 20;
        _pageViewController.titleSizeNormal    = 15;
        _pageViewController.titleSizeSelected  = 15;
        _pageViewController.titleColorNormal   = [UIColor blackColor];
        _pageViewController.titleColorSelected = [UIColor orangeColor];
    }
    return _pageViewController;
}


@end
