//
//  LTYHomeListModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/5.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeListModel.h"

@implementation LTYHomeListModel

@end


@implementation LTYHomeListModel_Data

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [LTYHomeListModel_Data_List class]};
}

@end


@implementation LTYHomeListModel_Data_List

@end


@implementation LTYHomeListModel_Data_List_Collectionsort

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"recipeList" : [LTYHomeListModel_Data_List_Collectionsort_RecipeList class]};
}

@end


@implementation LTYHomeListModel_Data_List_Article

@end


@implementation LTYHomeListModel_Data_List_Question

@end


@implementation LTYHomeListModel_Data_List_Collectionsort_RecipeList

@end


@implementation LTYHomeListModel_Data_List_Collectionsort_User

@end
