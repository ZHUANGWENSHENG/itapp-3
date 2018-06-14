//
//  tabBarController.m
//  ItApp1
//
//  Created by DMT on 2017/12/12.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "tabBarController.h"
#import "ViewController.h"
#import "load.h"
#import "IndexView.h"
#import "AppDelegate.h"
#import "hotNews.h"
#import "IndexView.h"
#import "myView.h"
#import "registerView.h"
#import "AdoptCenter.h"
#import "forgetViewController.h"
#import "questionController.h"
#import "fujin.h"
#import "faBu.h"

@interface tabBarController ()<UITabBarControllerDelegate>{
    UIViewController *vc;
      NSMutableArray *arr;
      int t;
}

@end

@implementation tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor=[UIColor colorWithRed:0.976 green:0.976 blue:0.976 alpha:1];
    t=3;
    NSNumber *p=[NSNumber numberWithInt:2];
    NSNumber *q=[NSNumber numberWithInt:18];
    arr=[[NSMutableArray alloc]initWithObjects:p,q,nil];

    self.delegate = self;

    fujin *loadPage=[[fujin alloc]init];
    _nav2=[[UINavigationController alloc]initWithRootViewController:loadPage];
    
    IndexView *ind=[[IndexView alloc]init];
    _nav1=[[UINavigationController alloc]initWithRootViewController:ind];
    
    hotNews *newView=[[hotNews alloc]init];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:newView];
    
    myView *reg=[[myView alloc]init];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:reg];
    
    _nav1.tabBarItem.title=@"首页";
    UIImage *t1=[UIImage imageNamed:@"shouye"];
    _nav1.tabBarItem.image=t1;
    _nav2.tabBarItem.title=@"附近";
    UIImage *t2=[UIImage imageNamed:@"fu"];
    [_nav2.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    _nav2.tabBarItem.image=t2;
    
    vc= [[UIViewController alloc]init];
    UIImage *img=[UIImage imageNamed:@"jia"];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"jia"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)];
    
    nav3.tabBarItem.title=@"热门";
    UIImage *t3=[UIImage imageNamed:@"re"];
    nav3.tabBarItem.image=t3;
    [nav3.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    nav4.tabBarItem.title=@"我的";
    UIImage *t4=[UIImage imageNamed:@"my"];
    nav4.tabBarItem.image=t4;
    
    self.viewControllers=@[_nav1,_nav2,vc,nav3,nav4];
    self.tabBar.translucent=NO;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    int *i;
    i=self.selectedIndex;
    NSNumber *p=[NSNumber numberWithInt:i];
    [arr addObject:p];

    int w;
    if(arr.count>=3){
    w=[arr objectAtIndex:(arr.count-2)];
    }
    else{
        w=[arr objectAtIndex:(arr.count-1)];
    }
    int y=(w-2)/16;
    if(viewController==self.viewControllers[2]){

        faBu *haha=[[faBu alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:haha];
        [self presentViewController:nav animated:YES completion:nil];
        if(arr.count<=3){
            self.selectedViewController=self.viewControllers[0];
        }
        else if(y==2){

            int e=[arr objectAtIndex:(arr.count-t)];
            int r=y=(e-2)/16;
            self.selectedViewController=self.viewControllers[r];
            ++t;
        }
        else{
         self.selectedViewController=self.viewControllers[y];
            if (t>=4) {
                ++t;
            }

        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
