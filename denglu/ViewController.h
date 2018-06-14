//
//  ViewController.h
//  denglu
//
//  Created by 楼可欣 on 2017/11/20.
//  Copyright © 2017年 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol chuanZhiDelegate<NSObject>
-(void)chuanZhi:(NSString*)str;
@end
@interface ViewController : UIViewController
@property(nonatomic,assign)id<chuanZhiDelegate>chuanZhiDelegate;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *forget;
@property (weak, nonatomic) IBOutlet UIButton *load;
@property (weak, nonatomic) IBOutlet UIButton *zhuCe;
@property(strong,nonatomic)UINavigationController *nav1;
@property(strong,nonatomic)UINavigationController *nav2;


@end
