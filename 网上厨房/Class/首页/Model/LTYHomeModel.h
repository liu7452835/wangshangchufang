//
//  LTYHomeTagViewModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/28.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@class LTYHomeModelData,LTYHomeModelData_Teachalbums,LTYHomeModelData_Interests,LTYHomeModelData_Interests_List,LTYHomeModelData_Interests_List_User,LTYHomeModelData_Interests_List_Infos,LTYHomeViewModelData_Items,LTYHomeViewModelData_Banners,LTYHomeModelData_Users,LTYHomeModelData_Onlineteaches,LTYHomeModelData_Onlineteaches_Teacher;

@interface LTYHomeModel : BaseModel

@property(nonatomic,copy) NSString *message;

@property(nonatomic,copy) NSString *state;

@property(nonatomic,strong) LTYHomeModelData *data;

@end


@interface LTYHomeModelData : BaseModel

@property(nonatomic,strong) NSArray<LTYHomeModelData_Teachalbums *> *teachalbums;

@property(nonatomic,strong) NSArray<LTYHomeModelData_Interests *> *interests;

@property(nonatomic,strong) NSArray<LTYHomeViewModelData_Items *> *items;

@property(nonatomic,strong) NSArray<LTYHomeViewModelData_Banners *> *banners;

@property(nonatomic,strong) NSArray<LTYHomeModelData_Users *> *users;

@property(nonatomic,strong) NSArray<LTYHomeModelData_Onlineteaches *> *onlineteaches;

@end


@interface LTYHomeModelData_Teachalbums : BaseModel

@property(nonatomic,copy) NSString *teachNum;

@property(nonatomic,copy) NSString *vimg;

@property(nonatomic,copy) NSString *ID;

@property(nonatomic,copy) NSString *himg;

@property(nonatomic,copy) NSString *title;

@end


@interface LTYHomeModelData_Interests : BaseModel

@property(nonatomic,strong) NSArray<LTYHomeModelData_Interests_List *> *list;

@property(nonatomic,copy) NSString *ID;

@property(nonatomic,copy) NSString *title;

@end


@interface LTYHomeModelData_Interests_List : BaseModel

@property(nonatomic,copy) NSString *imageid;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *ID;

@property(nonatomic,copy) NSString *DESCRIPTION;

@property(nonatomic,strong) LTYHomeModelData_Interests_List_User *user;

@property(nonatomic,strong) LTYHomeModelData_Interests_List_Infos *infos;

@end


@interface LTYHomeModelData_Interests_List_User : BaseModel

@property(nonatomic,copy) NSString *imageid;

@property(nonatomic,assign) NSInteger star;

@property(nonatomic,copy) NSString *profile;

@property(nonatomic,copy) NSString *nickname;

@property(nonatomic,assign) NSInteger SIGNED;

@property(nonatomic,assign) NSString *ID;

@property(nonatomic,copy) NSString *type;

@end


@interface LTYHomeModelData_Interests_List_Infos : BaseModel

@property(nonatomic,copy) NSString *hasVideo;

@property(nonatomic,copy) NSString *grade;

@property(nonatomic,assign) NSInteger collectionCount;

@property(nonatomic,assign) NSInteger exclusive;

@property(nonatomic,assign) NSInteger likeCount;

@property(nonatomic,assign) NSInteger viewCount;

@end


@interface LTYHomeViewModelData_Items : BaseModel

@property(nonatomic,copy) NSString *imageid;

@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *ID;

@property(nonatomic,copy) NSString *url;

@end;


@interface LTYHomeViewModelData_Banners : BaseModel

@property(nonatomic,copy) NSString *image;

@property(nonatomic,copy) NSString *url;

@end


@interface LTYHomeModelData_Users : BaseModel

@property(nonatomic,copy) NSString *isMember;

@property(nonatomic,copy) NSString *uid;

@property(nonatomic,copy) NSString *imageid;

@property(nonatomic,assign) NSInteger star;

@property(nonatomic,assign) NSInteger SINGED;

@property(nonatomic,copy) NSString *profile;

@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *type;

@property(nonatomic,strong) NSArray<NSString *> *specialities;

@end


@interface LTYHomeModelData_Onlineteaches : BaseModel

@property(nonatomic,assign) NSInteger learnedNum;

@property(nonatomic,assign) NSInteger ecookCoin;

@property(nonatomic,copy) NSString *himg;

@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *score;

@property(nonatomic,copy) NSString *pushUrl;

@property(nonatomic,strong) NSArray<LTYHomeModelData_Onlineteaches_Teacher *> *teacher;

@property(nonatomic,assign) NSInteger price;

@property(nonatomic,assign) NSInteger startTime;

@property(nonatomic,copy) NSString *vimg;

@property(nonatomic,assign) NSInteger endTime;

@property(nonatomic,assign) NSInteger ID;

@property(nonatomic,copy) NSString *paytype;

@property(nonatomic,assign) NSInteger status;

@end


@interface LTYHomeModelData_Onlineteaches_Teacher : BaseModel

@property(nonatomic,copy) NSString *imageid;

@property(nonatomic,assign) NSInteger star;

@property(nonatomic,copy) NSString *profile;

@property(nonatomic,copy) NSString *nickname;

@property(nonatomic,assign) NSInteger SINGED;

@property(nonatomic,assign) NSInteger ID;

@property(nonatomic,copy) NSString *type;

@end
