//
//  chongwu.m
//  ItApp1
//
//  Created by QUAQUA on 2017/12/26.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "chongwu.h"

@implementation chongwu

- (void)awakeFromNib {
    [super awakeFromNib];
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.layer.bounds.size.width/2;
    _name.delegate=self;
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
