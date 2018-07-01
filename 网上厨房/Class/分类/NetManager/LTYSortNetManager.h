//
//  LTYSortNetManager.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseNetManager.h"

@interface LTYSortNetManager : BaseNetManager

/** 从网络上获得分类页信息 */
//URL https://api.ecook.cn/public/getRecipeHomeData.shtml
+(id) postSortPageCompletionHandle:(void(^)(id responseObject, NSError *error))completed;


@end
