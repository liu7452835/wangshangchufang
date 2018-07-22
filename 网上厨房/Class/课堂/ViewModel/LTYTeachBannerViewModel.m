//
//  LTYTeachBannerViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/22.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTeachBannerViewModel.h"
#import "LTYBannerListModel.h"
#import "LTYTeachNetManager.h"

@implementation LTYTeachBannerViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYTeachNetManager postTeachBannerListCompletionHandle:^(id responseObject, NSError *error) {
        self.bannerListModle = responseObject;
        completed(error);
    }];
}


- (LTYBannerListModel *)bannerListModle{
    if (!_bannerListModle) {
        _bannerListModle = [[LTYBannerListModel alloc] init];
    }
    return _bannerListModle;
}


@end
