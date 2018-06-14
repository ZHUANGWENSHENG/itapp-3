//
//  otherpeopleController.m
//  ItApp1
//
//  Created by DMT on 2017/12/13.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "otherpeopleController.h"

@interface otherpeopleController ()
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation otherpeopleController

- (void)viewDidLoad {
    [super viewDidLoad];
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
    _btn1.layer.masksToBounds=YES;
    _btn1.layer.cornerRadius=5;
    _btn2.layer.masksToBounds=YES;
    _btn2.layer.cornerRadius=5;
    self.navigationController.navigationBarHidden=YES;
    
   //[self.navigationController setNavigationBarHidden:YES];
    [self.navigationController setNavigationBarHidden:NO];
       self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:0.5];
   // self.navigationController.=YES;
    // Do any additional setup after loading the view from its nib.
}
//- (void)viewWillAppear:(BOOL)animated{
//
//    //设置导航栏背景图片为一个空的image，这样就透明了
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//
//    //去掉透明后导航栏下边的黑边
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
