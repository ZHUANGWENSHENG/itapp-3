//
//  questionCell.m
//  ItApp1
//
//  Created by 楼可欣 on 2017/12/8.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "questionCell.h"

@implementation questionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
