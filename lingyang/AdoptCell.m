//
//  AdoptCell.m
//  ItApp1
//
//  Created by QUAQUA on 2017/11/28.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "AdoptCell.h"
#import "News.h"
@implementation AdoptCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
    _guanZhu.layer.masksToBounds=YES;
    _guanZhu.layer.cornerRadius=2;
    _adopt.layer.masksToBounds=YES;
    _adopt.layer.cornerRadius=_adopt.bounds.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
