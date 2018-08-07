//
//  LTYHomeNetManager.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/29.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeNetManager.h"
#import "LTYHomeModel.h"
#import "LTYHomeListModel.h"


#define kHomeDataURL @"https://api.ecook.cn/public/getHomeData.shtml"
#define kHomeDataListURL @"https://api.ecook.cn/public/getHomeList.shtml"
#define kterminal @"terminal" : @"3"
#define kURLVersion @"version":@"13.9.6"

@implementation LTYHomeNetManager

+ (id)postHomeDataCompletionHandle:(void (^)(id, NSError *))completed{
    return [self POST:kHomeDataURL parameters:@{kterminal,kURLVersion} completionHandle:^(id responseObject, NSError *error) {
        completed([LTYHomeModel mj_objectWithKeyValues:responseObject],error);
    }];
}

+(id)postHomeListDataWithParameter:(NSString *)parameter completionHandle:(void (^)(id, NSError *))completed{
    if (!parameter) {
        return [self POST:kHomeDataListURL parameters:@{kterminal,kURLVersion} completionHandle:^(id responseObject, NSError *error) {
            completed([LTYHomeListModel mj_objectWithKeyValues:responseObject],error);
        }];
    } else{
        return [self POST:kHomeDataListURL parameters:@{@"id" : parameter, kterminal,kURLVersion} completionHandle:^(id responseObject, NSError *error) {
            completed([LTYHomeListModel mj_objectWithKeyValues:responseObject],error);
        }];
    }
    
    
}


@end
