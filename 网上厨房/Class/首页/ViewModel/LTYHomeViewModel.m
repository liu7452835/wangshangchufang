//
//  LTYHomeViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/29.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeViewModel.h"
#import "LTYHomeModel.h"
#import "LTYHomeNetManager.h"


@interface LTYHomeViewModel()

@property(nonatomic,strong) LTYHomeModel *homeModel;

@end


@implementation LTYHomeViewModel


- (void)getDataCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYHomeNetManager postHomeDataCompletionHandle:^(id responseObject, NSError *error) {
        self.homeModel = responseObject;
        completed(error);
    }];
}

#pragma mark - 表的头视图数据
//获得表头视图中标签文字
- (NSString *)headViewTagLabelForIndex:(NSInteger)index{
    NSString *string = nil;
    string = self.homeModel.data.items[index].title;
    
    return string;
}

//获得表头视图中图片url地址
-(NSURL *)headViewTagImageViewForIndex:(NSInteger)index{
    NSURL *url = nil;
    NSString *string = self.homeModel.data.items[index].imageid;
    url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",string]];
    
    return url;
}

#pragma mark - lazy Load

- (LTYHomeModel *)homeModel{
    if (!_homeModel) {
        _homeModel = [[LTYHomeModel alloc] init];
    }
    return _homeModel;
}

- (NSInteger)tagCount{
    _tagCount = self.homeModel.data.items.count;
    return _tagCount;
    
}

@end
