//
//  BaseModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/7.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


/**
 *替换掉数据中与关键字冲突的键，用前者替换后者，后者是数据中实际的键，前者是模型中对应的键
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id",@"SIGNED" : @"signed"};
}

@end
