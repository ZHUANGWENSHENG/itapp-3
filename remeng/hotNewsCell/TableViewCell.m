//
//  TableViewCell.m
//  ItApp1
//
//  Created by DMT on 2017/11/22.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _guanZhu.layer.masksToBounds=YES;
    _guanZhu.layer.cornerRadius=3;
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
