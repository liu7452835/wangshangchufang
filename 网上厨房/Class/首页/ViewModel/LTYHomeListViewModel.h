//
//  LTYHomeListViewModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/5.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseViewModel.h"
#import "BaseNetManager.h"

@interface LTYHomeListViewModel : BaseViewModel

- (void)reset;

- (BOOL)hasVideo:(NSIndexPath *)indexPath;

- (NSInteger)countOfHomeListModelArray;

- (NSInteger)typeSetting:(NSIndexPath *)indexPath;

//获得collectionsort中背景图片url地址
- (NSURL *) collectionSortViewImageURLForIndexPath :(NSIndexPath *)indexPath;
//获得collectionsort中标题
- (NSString *) titleForIndexPath :(NSIndexPath *)indexPath;
//获得collectionsort中有多少道菜
- (NSString *) recipeCountForIndexPath :(NSIndexPath *)indexPath;
//获得collectionsort中作者图片url地址
- (NSURL *) userViewImageURLForIndexPath :(NSIndexPath *)indexPath;
//获得collectionsort中作者昵称
- (NSString *) nickNameForIndexPath :(NSIndexPath *)indexPath;


//获得question中问题
- (NSString *) questionForIndexPath :(NSIndexPath *)indexPath;
//获得question提问者图片url地址
- (NSURL *) userImageURLOfQuestionForIndexPath :(NSIndexPath *)indexPath;
//获得question中提问者昵称
- (NSString *) nickNameOfQuestionForIndexPath :(NSIndexPath *)indexPath;
//获得question中悬赏金额
- (NSString *) rewardOfQuestionForIndexPath :(NSIndexPath *)indexPath;
//获得question中答题人数
- (NSString *) answerCountOfQuestionForIndexPath :(NSIndexPath *)indexPath;


//获得articleTwo中背景图片url地址
- (NSURL *) articleTwoViewImageURLForIndexPath :(NSIndexPath *)indexPath;
//获得articleTwo中标题
- (NSString *) titleOfArticleTwoForIndexPath :(NSIndexPath *)indexPath;
//获得articleTwo中作者图片url地址
- (NSURL *) userViewImageURLOfArticleTwoForIndexPath :(NSIndexPath *)indexPath;
//获得articleTwo中作者昵称
- (NSString *) nickNameOfArticleTwoForIndexPath :(NSIndexPath *)indexPath;
//获得articleTwo中星级图片
-(UIImage *) starImageOfArticleTwoForIndexPath :(NSIndexPath *)indexPath;


//获得articleOne中背景图片url地址1
- (NSURL *) articleOneFirstViewImageURLForIndexPath :(NSIndexPath *)indexPath;
//获得articleOne中背景图片url地址2
- (NSURL *) articleOneSecondViewImageURLForIndexPath :(NSIndexPath *)indexPath;
//获得articleOne中背景图片url地址3
- (NSURL *) articleOneThreeViewImageURLForIndexPath :(NSIndexPath *)indexPath;
//获得articleOne中标题
//- (NSString *) titleOfArticleOneForIndexPath :(NSIndexPath *)indexPath;
//获得articleOne中作者图片url地址
//- (NSURL *) userViewImageURLOfArticleOneForIndexPath :(NSIndexPath *)indexPath;
//获得articleOne中作者昵称
//- (NSString *) nickNameOfArticleOneForIndexPath :(NSIndexPath *)indexPath;
//复用articletwo的方法

@end
