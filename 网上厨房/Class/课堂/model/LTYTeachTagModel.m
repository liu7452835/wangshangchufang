//
//  LTYTeachModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/25.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTeachTagModel.h"

@implementation LTYTeachTagModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"data" : [TeachModel_data class] };
}

@end

@implementation TeachModel_data

+(NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [Data_list class]};
}

@end

@implementation Data_list

@end
