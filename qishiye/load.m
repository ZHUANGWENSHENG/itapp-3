//
//  load.m
//  ItApp1
//
//  Created by QUAQUA on 2017/10/27.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "load.h"
#import "registerView.h"
#import "ViewController.h"
#import "News.h"
#import "IndexView.h"
#import "forgetViewController.h"


@interface load ()

@end

@implementation load

- (void)viewDidLoad {
    [super viewDidLoad];

    _btn1.layer.masksToBounds=YES;
    _btn1.layer.cornerRadius=7.0;
    _btn1.layer.borderWidth=1.0;
    _btn1.layer.borderColor=[UIColor whiteColor].CGColor;
    _btn2.layer.masksToBounds=YES;
    _btn2.layer.cornerRadius=7.0;
    _btn2.layer.borderWidth=1.0;
    _btn2.layer.borderColor=[UIColor whiteColor].CGColor;
     [self.navigationController setNavigationBarHidden:YES];
    [_btn2 addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchDown];
    [_btn1 addTarget:self action:@selector(jump2) forControlEvents:UIControlEventTouchDown];
    [_btn3 addTarget:self action:@selector(toForget) forControlEvents:UIControlEventTouchDown];
//    UITabBarItem *tbi=self.tabBarItem;
//    tbi.title=@"d";
    // Do any additional setup after loading the view from its nib.
}
-(void)toForget{
    forgetViewController *forget=[[forgetViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
}
-(void)jump{
    registerView *ind=[[registerView alloc]init];
    [self.navigationController pushViewController:ind animated:YES];
}
-(void)jump2{
 
    ViewController *dengLu=[[ViewController alloc]init];
    [self.navigationController pushViewController:dengLu animated:YES];
    
}
    

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
