//
//  LTYDynamicViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYDynamicViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LTYDynamicViewController ()


@end

@implementation LTYDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kHomeGoTopNotification object:nil];
    //先判断 如果未登录，需要先登录。
    
   
    
    //[self presentViewController:loginVC animated:YES completion:nil];
}


- (void)viewWillAppear:(BOOL)animated{
    //先判断 如果未登录，需要先登录。
    
    LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"LoginView" bundle:nil] instantiateViewControllerWithIdentifier:@"Login"];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [delegate.window.rootViewController presentViewController:loginVC animated:YES completion:nil];
    
    //[self presentViewController:loginVC animated:YES completion:nil];
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
