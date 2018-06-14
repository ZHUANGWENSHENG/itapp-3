//
//  headerdetailsTableViewCell.m
//  ItApp1
//
//  Created by DMT on 2017/12/14.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "headerdetailsTableViewCell.h"

@implementation headerdetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
    _guanzhu.layer.masksToBounds=YES;
    _guanzhu.layer.cornerRadius=3;
    self.backgroundColor=[UIColor whiteColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
