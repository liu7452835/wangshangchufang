//
//  LTYTopicViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTopicViewController.h"
#import "RecommendViewController.h"
#import "NewestViewController.h"
#import "HottestViewController.h"

@interface LTYTopicViewController ()

@property (nonatomic, strong) WMPageController *pageController;

@end

@implementation LTYTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pageController.view];
    self.pageController.viewFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-70);
    
    
    
}


- (WMPageController *)pageController {
    if (!_pageController) {
        _pageController = [[WMPageController alloc] initWithViewControllerClasses:@[[RecommendViewController class],[NewestViewController class],[HottestViewController class]] andTheirTitles:@[@"推荐",@"最新",@"最热"]];
        _pageController.menuViewStyle      = WMMenuViewStyleLine;
        _pageController.menuBGColor        = [UIColor whiteColor];
        _pageController.menuHeight         = 44;
        _pageController.progressWidth      = 20;
        _pageController.titleSizeNormal    = 15;
        _pageController.titleSizeSelected  = 15;
        _pageController.titleColorNormal   = [UIColor blackColor];
        _pageController.titleColorSelected = [UIColor orangeColor];
        _pageController.bounces = NO;
    }
    return _pageController;
}




@end
