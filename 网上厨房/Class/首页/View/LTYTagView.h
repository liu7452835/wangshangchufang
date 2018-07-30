//
//  LTYTagView.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/28.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LTYTagViewClickDelegate <NSObject>

-(void)tagViewDidClick:(NSInteger)tag;

@end

@interface LTYTagView : UIView

@property(nonatomic,strong) UIImageView *imageView;

@property(nonatomic,strong) UILabel *label;

@property(nonatomic,weak) id<LTYTagViewClickDelegate> delegate;
@end
