//
//  LTYHomeTagViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/28.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeModel.h"

@implementation LTYHomeModel

@end


@implementation LTYHomeModelData

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"teachalbums" : [LTYHomeModelData_Teachalbums class],@"interests" : [LTYHomeModelData_Interests class],@"items" : [LTYHomeViewModelData_Items class],@"users" : [LTYHomeModelData_Users class],@"onlineteaches" : [LTYHomeModelData_Onlineteaches class], @"banners" : [LTYHomeViewModelData_Banners class]};
}

@end


@implementation LTYHomeModelData_Teachalbums

@end


@implementation LTYHomeModelData_Interests

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [LTYHomeModelData_Interests_List class]};
}

@end


@implementation LTYHomeModelData_Interests_List

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"user" : [ LTYHomeModelData_Interests_List_User class], @"infos" : [LTYHomeModelData_Interests_List_Infos class]};
}

@end


@implementation LTYHomeModelData_Interests_List_User

@end


@implementation LTYHomeModelData_Interests_List_Infos

@end


@implementation LTYHomeViewModelData_Items

@end;


@implementation LTYHomeViewModelData_Banners

@end


@implementation LTYHomeModelData_Users

+(NSDictionary *)mj_objectClassInArray{
    return @{@"specialities" : [NSString class]};
}

@end


@implementation LTYHomeModelData_Onlineteaches

+(NSDictionary *)mj_objectClassInArray{
    return @{@"teacher" : [LTYHomeModelData_Onlineteaches_Teacher class]};
}
@end


@implementation LTYHomeModelData_Onlineteaches_Teacher

@end

