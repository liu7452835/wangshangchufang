//
//  LTYDynamicViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYDynamicViewController.h"

@interface LTYDynamicViewController ()


@end

@implementation LTYDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kHomeGoTopNotification object:nil];

}


- (void)acceptMsg:(NSNotification *)notification{

    if ([self.view.window isKeyWindow]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kHomeLeaveTopNotification object:nil userInfo:@{@"canScroll" : @"1"}];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
