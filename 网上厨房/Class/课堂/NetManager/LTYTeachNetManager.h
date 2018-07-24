//
//  LTYTeachNetManager.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/26.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseNetManager.h"

@interface LTYTeachNetManager : BaseNetManager


/** 从网络上获得课堂页tag信息  */
//URL https://api.ecook.cn/public/getOnlineTeachTags.shtml
+(id) postTeachTagCompletionHandle:(void(^)(id responseObject,NSError *error))completed;

/** 从网络上获得课堂页推荐栏信息  */
//URL https://api.ecook.cn/public/getOnlineTeachList.shtml
+(id) postTeachRecommendCompletionHandle:(void(^)(id responseObject,NSError *error))completed;

/** 从网络上获得课堂页免费课堂信息  */
//URL https://api.ecook.cn/public/getOnlineTeachList.shtml
+(id) postTeachFreeCompletionHandle:(void (^)(id responseObject,NSError *error))completed;

/** 从网络上获得课堂页全部（最新）课堂信息  */
//URL https://api.ecook.cn/public/getOnlineTeachList.shtml
//+(id) postTeachLatestAllCompletionHandle:(void (^)(id responseObject,NSError *error))completed;

/** 从网络上获得课堂页横幅列表信息 */
//URL https://api.ecook.cn/public/getOnlineTeachBannerList.shtml
+(id) postTeachBannerListCompletionHandle:(void(^) (id responseObject,NSError *error))completed;


@end
