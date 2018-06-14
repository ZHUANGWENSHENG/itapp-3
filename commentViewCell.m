//
//  commentViewCell.m
//  ItApp1
//
//  Created by DMT on 2017/12/26.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "commentViewCell.h"

@implementation commentViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
