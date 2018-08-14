//
//  LTYTabBarViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/6.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTabBarViewController.h"
#import "LTYHomeViewController.h"
#import "LTYSortViewController.h"
#import "LTYTeachViewController.h"
#import "LTYTalkViewController.h"
#import "LTYPersonalViewController.h"


@interface LTYTabBarViewController ()

@end

@implementation LTYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildController:[[LTYHomeViewController alloc] init] imageName:@"tab_home_n" selectedImage:@"tab_home_s" iconName:@"首页"];
    
    [self setupChildController:[[LTYSortViewController alloc] init] imageName:@"tab_sort_n" selectedImage:@"tab_sort_s" iconName:@"分类"];
    
    [self setupChildController:[[LTYTeachViewController alloc] init] imageName:@"tab_teach_n" selectedImage:@"tab_teach_s" iconName:@"课堂"];
    
    [self setupChildController:[[LTYTalkViewController alloc] init] imageName:@"tab_talk_n" selectedImage:@"tab_talk_s" iconName:@"食话"];
    
    UINavigationController *meVC = [[UIStoryboard storyboardWithName:@"PersonalSetting" bundle:nil] instantiateViewControllerWithIdentifier:@"ME"];
    //LTYPersonalViewController *meVC = [[UIStoryboard storyboardWithName:@"PersonalSetting" bundle:nil] instantiateViewControllerWithIdentifier:@"ME"];
    
    [self setupChildController:meVC imageName:@"tab_personal_n" selectedImage:@"tab_personal_s" iconName:@"我的"];
    
}

/**
 设置标签栏视图控制器的子控制器

 @param vc 子控制器
 @param imageName 子控制器的图标
 @param selectedImgaeName 子控制器被选中后的图标
 */
- (void)setupChildController:(UIViewController *)vc imageName:(NSString *)imageName selectedImage:(NSString *) selectedImgaeName iconName:(NSString *)iconName{
    //设置图片间距
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    //设置选中后的图片不渲染,
    UIImage *image = [[UIImage imageNamed:selectedImgaeName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = image;
    //设置图标名称
    vc.tabBarItem.title = iconName;
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil]forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:253/255.0 green:192/255.0 blue:51/255.0 alpha:1.0],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [self addChildViewController:vc];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"Group"]];
    [self.tabBar setShadowImage:[UIImage new]];//去除标签栏上方横线
    //NSLog(@"%f",self.tabBar.bounds.size.height);
}


@end
