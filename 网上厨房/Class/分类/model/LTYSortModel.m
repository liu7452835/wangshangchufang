//
//  LTYSortModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYSortModel.h"

@implementation LTYSortModel

+ (NSDictionary *) mj_objectClassInArray{
    return @{@"list" : [SortLists class]};
}

@end

@implementation SortLists

+(NSDictionary *) mj_objectClassInArray{
    return @{@"list" : [SortLists_list class]};
}
@end


@implementation SortLists_list

@end
