//
//  LTYHomeListViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/5.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeListViewModel.h"
#import "LTYHomeListModel.h"
#import "LTYHomeNetManager.h"


@interface LTYHomeListViewModel()

@property(nonatomic,strong) LTYHomeListModel *homeListModel;
@property(nonatomic,strong) NSMutableArray<LTYHomeListModel *> *homeListModelArray;
@end


@implementation LTYHomeListViewModel


- (void)getMoreDateCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYHomeNetManager postHomeListDataWithParameter:[self.homeListModelArray lastObject].data.ID completionHandle:^(id responseObject, NSError *error) {
        self.homeListModel = responseObject;
        [self.homeListModelArray addObject:self.homeListModel];
        completed(error);
    }];
}


- (void)reset{
    [self.homeListModelArray removeAllObjects];
}


#pragma mark - 懒加载

- (LTYHomeListModel *)homeListModel{
    if (!_homeListModel) {
        _homeListModel = [[LTYHomeListModel alloc] init];
    }
    return _homeListModel;
}

- (NSMutableArray<LTYHomeListModel *> *)homeListModelArray{
    if (!_homeListModelArray) {
        _homeListModelArray = [[NSMutableArray alloc] init];
    }
    return _homeListModelArray;
}

@end
