//
//  LTYTalkViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/7.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTalkViewController.h"
#import "LTYDynamicViewController.h"
#import "LTYSquareViewController.h"
#import "LTYTopicViewController.h"
#import "LTYInterlocutionViewController.h"
#import "ArtScrollView.h"

@interface LTYTalkViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) ArtScrollView *scrollView;
@property(nonatomic,strong) WMPageController *takeViewController;

@end

@implementation LTYTalkViewController
{
    BOOL _canScroll;//因为不需要懒加载，所以不需要时属性
}



- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.scrollView addSubview:self.takeViewController.view];
    _canScroll = YES;
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight + 80);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptedMsg:) name:kHomeLeaveTopNotification object:nil];
}


- (void)viewWillAppear:(BOOL)animated{
    self.takeViewController.selectIndex = 1;
    [super viewWillAppear:animated];
}


#pragma mark - notification

- (void)acceptedMsg:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
    NSString *canScroll = userInfo[@"canScroll"];
    if ([canScroll isEqualToString:@"1"]) {
        _canScroll = YES;
    }
}


//存响应的控制器
- (NSArray *)viewControllerClass{
    return @[[LTYDynamicViewController class],[LTYSquareViewController class],[LTYTopicViewController class],[LTYInterlocutionViewController class]];
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y >= 80) {
        //NSLog(@"滑动到顶端了");
        scrollView.contentOffset = CGPointMake(0, 80);// 固定头
        _canScroll = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:kHomeGoTopNotification object:nil userInfo:@{@"canScroll" : @"1"}];//发通知已到顶端
        
    } else{
       // NSLog(@"离开顶端了");
        //此时若tableview还没有滚动完，需要保持scrollview.contentoffset不变
        if (!_canScroll) {
            scrollView.contentOffset = CGPointMake(0, 80);
        }
    }
}


#pragma mark - 懒加载

- (WMPageController *)takeViewController{
    
    if (!_takeViewController) {
        _takeViewController = [[WMPageController alloc] initWithViewControllerClasses:[self viewControllerClass] andTheirTitles:@[@"动态",@"广场",@"话题",@"问答"]];
        
        //WMPageController的设置
        _takeViewController.menuViewStyle = WMMenuViewStyleLine;
        //设置背景色
        _takeViewController.menuBGColor = [UIColor grayColor];
        //选中时颜色
        _takeViewController.titleColorSelected = [UIColor orangeColor];
        //设置每个item的宽
        _takeViewController.itemsWidths = @[@(kScreenWidth/4),@(kScreenWidth/4),@(kScreenWidth/4),@(kScreenWidth/4)];
        //进度条高度
        _takeViewController.progressHeight = 4;
        //菜单栏高度
        _takeViewController.menuHeight = 50;
        _takeViewController.viewFrame = CGRectMake(0, 80, kScreenWidth, kScreenHeight-20);
        
        _takeViewController.selectIndex = 1;
        
        
    }
    return _takeViewController;
}



- (ArtScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[ArtScrollView alloc] init];
        [self.view addSubview:_scrollView];
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.leading.trailing.mas_equalTo(0);
            make.top.mas_equalTo(20);
        }];
    
    }
    return _scrollView;
}


@end
