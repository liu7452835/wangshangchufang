//
//  LTYHomeListModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/5.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@class LTYHomeListModel_Data,LTYHomeListModel_Data_List,LTYHomeListModel_Data_List_Collectionsort,LTYHomeListModel_Data_List_Collectionsort_RecipeList,LTYHomeListModel_Data_List_Collectionsort_User,LTYHomeListModel_Data_List_Article,LTYHomeListModel_Data_List_Question;

@interface LTYHomeListModel : BaseModel

@property(nonatomic,copy) NSString *state;
@property(nonatomic,copy) NSString *message;
@property(nonatomic,strong) LTYHomeListModel_Data *data;

@end


@interface LTYHomeListModel_Data : BaseModel

@property(nonatomic,copy) NSString *ID;
@property(nonatomic,strong) NSArray<LTYHomeListModel_Data_List *> *list;

@end


@interface LTYHomeListModel_Data_List : BaseModel

@property(nonatomic,assign) NSInteger type;
@property(nonatomic,strong) LTYHomeListModel_Data_List_Collectionsort * collectionsort;
@property(nonatomic,strong) LTYHomeListModel_Data_List_Article *article;
@property(nonatomic,strong) LTYHomeListModel_Data_List_Question *question;

@end


@interface LTYHomeListModel_Data_List_Collectionsort : BaseModel

@property(nonatomic,copy) NSString *imageid;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *DESCRIPTION;
@property(nonatomic,assign) NSInteger recipeCount;
@property(nonatomic,copy) NSString *ID;
@property(nonatomic,strong) NSArray<LTYHomeListModel_Data_List_Collectionsort_RecipeList *> *recipeList;
@property(nonatomic,strong) LTYHomeListModel_Data_List_Collectionsort_User *user;

@end


@interface LTYHomeListModel_Data_List_Article :BaseModel

@property(nonatomic,assign) BOOL hasVideo;
@property(nonatomic,assign) NSInteger pv;
@property(nonatomic,assign) NSInteger ID;
@property(nonatomic,copy) NSString *typesetting;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *imageids;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,strong) LTYHomeListModel_Data_List_Collectionsort_User *user;

@end


@interface LTYHomeListModel_Data_List_Question : BaseModel

@property(nonatomic,assign) NSInteger reward;
@property(nonatomic,copy) NSString *createtime;
@property(nonatomic,copy) NSString *displaytime;
@property(nonatomic,assign) NSInteger answerCount;
@property(nonatomic,copy) NSString *rewardtype;
@property(nonatomic,copy) NSString *endtime;
@property(nonatomic,copy) NSString *ID;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,strong) LTYHomeListModel_Data_List_Collectionsort_User *user;
@property(nonatomic,copy) NSString *imageids;
@property(nonatomic,assign) NSInteger status;

@end


@interface LTYHomeListModel_Data_List_Collectionsort_RecipeList : BaseModel

@property(nonatomic,copy) NSString *imageid;
@property(nonatomic,copy) NSString *ID;

@end


@interface LTYHomeListModel_Data_List_Collectionsort_User :BaseModel

@property(nonatomic,copy) NSString *imageid;
@property(nonatomic,copy) NSString *profile;
@property(nonatomic,assign) NSInteger star;
@property(nonatomic,copy) NSString *nickname;
@property(nonatomic,assign) NSInteger SIGNED;
@property(nonatomic,copy) NSString *ID;
@property(nonatomic,copy) NSString *type;

@end


