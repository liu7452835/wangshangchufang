//
//  LTYHomeListViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/5.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeListViewModel.h"
#import "LTYHomeListModel.h"
#import "LTYHomeNetManager.h"


@interface LTYHomeListViewModel()

@property(nonatomic,strong) LTYHomeListModel *homeListModel;
@property(nonatomic,strong) NSMutableArray<LTYHomeListModel *> *homeListModelArray;
@end


@implementation LTYHomeListViewModel


- (void)getMoreDateCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYHomeNetManager postHomeListDataWithParameter:[self.homeListModelArray lastObject].data.ID completionHandle:^(id responseObject, NSError *error) {
        self.homeListModel = responseObject;
        [self.homeListModelArray addObject:self.homeListModel];
        completed(error);
    }];
}

- (NSInteger)typeSetting:(NSIndexPath *)indexPath{
    if ((indexPath.section >=7)) {
        return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.typesetting;
    }
    return 1;
}

- (void)reset{
    [self.homeListModelArray removeAllObjects];
}


- (BOOL)hasVideo:(NSIndexPath *)indexPath{
    if (indexPath.section>=7) {
        return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.hasVideo;
    }
    return nil;
}

- (NSInteger)countOfHomeListModelArray{
    return self.homeListModelArray.count;
}

#pragma mark - collectionsort

//获得collectionsort中背景图片url地址
- (NSURL *)collectionSortViewImageURLForIndexPath:(NSIndexPath *)indexPath{
    NSString *imageString = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].collectionsort.imageid;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得collectionsort中标题
- (NSString *)titleForIndexPath:(NSIndexPath *)indexPath{
    return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].collectionsort.name;
}

//获得collectionsort中有多少道菜
- (NSString *)recipeCountForIndexPath:(NSIndexPath *)indexPath{
    NSInteger count = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].collectionsort.recipeCount;
    return [NSString stringWithFormat:@"-共%ld道菜-",count];
}

//获得collectionsort中作者图片url地址
- (NSURL *)userViewImageURLForIndexPath:(NSIndexPath *)indexPath{
    NSString *imageString = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].collectionsort.user.imageid;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得collectionsort中作者昵称
- (NSString *)nickNameForIndexPath:(NSIndexPath *)indexPath{
    return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].collectionsort.user.nickname;
}


#pragma mark - question

//获得question中问题
- (NSString *)questionForIndexPath:(NSIndexPath *)indexPath{
    return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].question.text;
}

//获得question提问者图片url地址
- (NSURL *)userImageURLOfQuestionForIndexPath:(NSIndexPath *)indexPath{
    NSString *imageString = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].question.user.imageid;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得question中提问者昵称
- (NSString *)nickNameOfQuestionForIndexPath:(NSIndexPath *)indexPath{
    return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].question.user.nickname;
}

//获得question中悬赏金额
- (NSString *)rewardOfQuestionForIndexPath:(NSIndexPath *)indexPath{
    NSInteger reward = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].question.reward;
   
    if ([self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].question.rewardtype isEqualToString: @"cny"]) {
        return [NSString stringWithFormat:@"悬赏:%ld元",reward];
    } else {
        return [NSString stringWithFormat:@"悬赏:%ld厨币",reward];
    }
}

//获得question中答题人数
- (NSString *)answerCountOfQuestionForIndexPath:(NSIndexPath *)indexPath{
    NSInteger answerCount = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].question.answerCount;
    return [NSString stringWithFormat:@"%ld人回答",answerCount];
}


#pragma mark - ArticleTwo

//获得articleTwo中背景图片url地址
- (NSURL *)articleTwoViewImageURLForIndexPath:(NSIndexPath *)indexPath{
    NSString *imageString = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.imageids;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得articleTwo中标题
- (NSString *)titleOfArticleTwoForIndexPath:(NSIndexPath *)indexPath{
    return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.title;
}

//获得articleTwo中作者图片url地址
- (NSURL *)userViewImageURLOfArticleTwoForIndexPath:(NSIndexPath *)indexPath{
    NSString *imageString = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.user.imageid;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得articleTwo中作者昵称
- (NSString *)nickNameOfArticleTwoForIndexPath:(NSIndexPath *)indexPath{
    return self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.user.nickname;
}

//获得articleTwo中星级图片
- (UIImage *)starImageOfArticleTwoForIndexPath:(NSIndexPath *)indexPath{
    NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    NSInteger starNumber = self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.user.star;
    return [UIImage imageNamed:starArray[starNumber]];
}

#pragma mark - ArticleOne

- (NSArray *) imageidsForArticleOne:(NSIndexPath *) indexPath{
    NSArray *array = [self.homeListModelArray[indexPath.section -7+indexPath.row / 10].data.list[indexPath.row % 10].article.imageids componentsSeparatedByString:@","];
    return array;
}

//获得articleOne中背景图片url地址1
- (NSURL *)articleOneFirstViewImageURLForIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = [self imageidsForArticleOne:indexPath];
    NSString *imageString = array[0];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得articleOne中背景图片url地址2
- (NSURL *)articleOneSecondViewImageURLForIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = [self imageidsForArticleOne:indexPath];
    NSString *imageString = array[1];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得articleOne中背景图片url地址3
- (NSURL *)articleOneThreeViewImageURLForIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = [self imageidsForArticleOne:indexPath];
    NSString *imageString = array[2];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}


#pragma mark - 懒加载

- (LTYHomeListModel *)homeListModel{
    if (!_homeListModel) {
        _homeListModel = [[LTYHomeListModel alloc] init];
    }
    return _homeListModel;
}

- (NSMutableArray<LTYHomeListModel *> *)homeListModelArray{
    if (!_homeListModelArray) {
        _homeListModelArray = [[NSMutableArray alloc] init];
    }
    return _homeListModelArray;
}

@end
