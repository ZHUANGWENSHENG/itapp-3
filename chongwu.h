//
//  chongwu.h
//  ItApp1
//
//  Created by QUAQUA on 2017/12/26.
//  Copyright © 2017年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chongwu : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *sex;
@property (weak, nonatomic) IBOutlet UITextField *age;

@end
