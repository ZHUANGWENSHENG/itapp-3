//
//  AdoptCell.h
//  ItApp1
//
//  Created by QUAQUA on 2017/11/28.
//  Copyright © 2017年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdoptCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UIButton *guanZhu;
@property (weak, nonatomic) IBOutlet UIButton *adopt;

@end
