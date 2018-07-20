//
//  LTYTagColumnCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/3.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTagColumnCell.h"

@interface LTYTagColumnCell()

@end

@implementation LTYTagColumnCell

- (void)awakeFromNib{
    [super awakeFromNib];
}
- (void) setUpCellWithArray:(NSArray *)array withItemRow:(NSUInteger)itemRow{
    
    if (self.contentPic.image) {
        return;
    }
    
    NSURL *picURL = [NSURL URLWithString:[NSString stringWithFormat: @"http://pic.ecook.cn/web/%@.jpg!s4",[array[itemRow] valueForKey: @"imageid"]]];
    
    [self.contentPic setImageWithURL:picURL];
    
    self.contentLabel.text = [array[itemRow] valueForKey:@"title"];
    //NSLog(@"1");
}


@end
