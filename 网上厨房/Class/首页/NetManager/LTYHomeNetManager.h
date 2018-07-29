//
//  LTYHomeNetManager.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/29.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseNetManager.h"

@interface LTYHomeNetManager : BaseNetManager

//URL    https://api.ecook.cn/public/getHomeData.shtml
//获得主页数据
+ (id)postHomeDataCompletionHandle:(void(^)(id responseObject,NSError *error))completed;

@end
