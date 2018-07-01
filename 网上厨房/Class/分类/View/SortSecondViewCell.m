//
//  SortSecondViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "SortSecondViewCell.h"

@interface SortSecondViewCell()


@property(nonatomic,strong) UIButton *button;
@end


@implementation SortSecondViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.hotMenu.hidden = NO;
        self.latestMenu.hidden = NO;
    }
    return self;
}


- (RecommendContentShow *)hotMenu{
    if (!_hotMenu) {
        _hotMenu = [RecommendContentShow new];
        [_hotMenu.imgaeView0 setImage: [UIImage imageNamed:@"pic_hotest"]];
        [_hotMenu.imgaeView1 setImage:[UIImage imageNamed:@"sort_hotest"]];
        [_hotMenu.label0 setText:@"热门菜谱"];
        [_hotMenu.label1 setText:@"本周最流行菜谱"];
        
        [self.contentView addSubview:_hotMenu];
        [_hotMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
    }
    return _hotMenu;
}

- (RecommendContentShow *)latestMenu{
    if (!_latestMenu) {
        _latestMenu = [RecommendContentShow new];
        [_latestMenu.imgaeView0 setImage: [UIImage imageNamed:@"pic_newes"]];
        [_latestMenu.imgaeView1 setImage:[UIImage imageNamed:@"sort_newest"]];
        [_latestMenu.label0 setText:@"最新菜谱"];
        [_latestMenu.label1 setText:@"24小时实时推荐"];
        
        [self.contentView addSubview:_latestMenu];
        [_latestMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(self.hotMenu.mas_right).mas_equalTo(7);
            make.width.mas_equalTo(self.hotMenu.mas_width);
        }];
    }
    return _latestMenu;
}



@end
