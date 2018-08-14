//
//  BaseViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/13.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIScrollViewDelegate>

@property(nonatomic,assign) BOOL canScroll;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kHomeGoTopNotification object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    self.canScroll = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kHomeLeaveTopNotification object:nil userInfo:@{@"canScroll" : @"1"}];
    [super viewDidAppear:animated];
}



#pragma mark - notification
- (void)acceptMsg:(NSNotification *)notification{
    
    
    NSString *notificationName = notification.name;
    if ([notificationName isEqualToString:kHomeGoTopNotification]) {
        NSDictionary *useInfo = notification.userInfo;
        NSString *canScroll = useInfo[@"canScroll"];
        if ([canScroll isEqualToString:@"1"]) {
            self.canScroll = YES;
        }
    }  
}



#pragma mark - UIscrollViewDelegate
//scroll对象：tableview
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.canScroll) {
        [scrollView setContentOffset:CGPointZero];
        
    }
    if (scrollView.contentOffset.y <0) {
         NSLog(@"要离开顶端");
        self.canScroll = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:kHomeLeaveTopNotification object:nil userInfo:@{@"canScroll" : @"1"}];
    }
}

@end
