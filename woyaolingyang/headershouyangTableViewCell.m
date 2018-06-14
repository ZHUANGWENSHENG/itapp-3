//
//  headershouyangTableViewCell.m
//  ItApp1
//
//  Created by 楼可欣 on 2017/12/20.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "headershouyangTableViewCell.h"

@implementation headershouyangTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _ima.layer.masksToBounds=YES;
    _ima.layer.cornerRadius=_ima.bounds.size.width/2;
    _but1.layer.masksToBounds=YES;
    _but1.layer.cornerRadius=3;
    _but2.layer.masksToBounds=YES;
    _but2.layer.cornerRadius=10;
    self.backgroundColor=[UIColor whiteColor];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
