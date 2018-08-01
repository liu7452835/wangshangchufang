//
//  LTYScrollView.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/31.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 滚动视图中重复利用的view
 */
@interface LTYScrollView : UIView

@property(nonatomic,strong) UIImageView *backgroundImageView;

@property(nonatomic,strong) UIImageView *userImageView;
@property(nonatomic,strong) UIImageView *idImageView;
@property(nonatomic,strong) UILabel *nickName;
@property(nonatomic,strong) UIImageView *starImageView;
@property(nonatomic,strong) UILabel *cookTitle;
@property(nonatomic,strong) UIImageView *vipTagView;
@end
