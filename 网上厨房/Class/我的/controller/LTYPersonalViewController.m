//
//  LTYPersonalViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/18.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYPersonalViewController.h"

@interface LTYPersonalViewController ()

@end

@implementation LTYPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
   // self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
   // self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_back"] style:UIBarButtonItemStylePlain target:nil action:nil];
   // self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Group"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (IBAction)logInButton:(UIButton *)sender {
    NSLog(@"登陆按钮点击");
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"Click: %ld",indexPath.row);
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
}
*/
- (IBAction)buttonsClick:(UIButton *)sender {
    NSLog(@"%ld",sender.tag);
}



@end
