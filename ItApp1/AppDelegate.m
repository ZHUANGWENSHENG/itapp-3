//
//  AppDelegate.m
//  ItApp1
//
//  Created by QUAQUA on 2017/10/27.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "AppDelegate.h"
#import "load.h"
#import "hotNews.h"
#import"News.h"
#import "IndexView.h"
#import "forgetViewController.h"
#import "AdoptCenter.h"
#import "tabBarController.h"
#import "registerView.h"


#import "myView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    load *loadPage=[[load alloc]init];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:loadPage];
//    load *loadPage=[[load alloc]init];
//    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:loadPage];
//
//    IndexView *ind=[[IndexView alloc]init];
//    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:ind];
//
//    hotNews *newView=[[hotNews alloc]init];
//    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:newView];
//
//    myView *reg=[[myView alloc]init];
//    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:reg];
//
//    UITabBarController *tab=[[UITabBarController alloc]init];
//
//
//
//    UIButton *sendBtn = [[UIButton alloc] init];
//    [sendBtn setImage:[UIImage imageNamed:@"Add"] forState:UIControlStateNormal];
//    [sendBtn setTitle:@"发布" forState:UIControlStateNormal];
//    sendBtn.titleLabel.font = [UIFont systemFontOfSize:10];
//    sendBtn.adjustsImageWhenHighlighted = NO;
//    sendBtn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-25, 0, 50, 50);
//
//    [tab.tabBar addSubview:sendBtn];
//
//
//
//   tab.viewControllers=@[nav1,nav2,nav3,nav4];
//
//    nav1.tabBarItem.title=@"首页";
//    UIImage *t1=[UIImage imageNamed:@"shouye"];
//    nav1.tabBarItem.image=t1;
//    nav2.tabBarItem.title=@"附近";
//    UIImage *t2=[UIImage imageNamed:@"fu"];
//    nav2.tabBarItem.image=t2;
//    nav3.tabBarItem.title=@"热门";
//    UIImage *t3=[UIImage imageNamed:@"re"];
//    nav3.tabBarItem.image=t3;
//    nav4.tabBarItem.title=@"我的";
//    UIImage *t4=[UIImage imageNamed:@"my"];
//    nav4.tabBarItem.image=t4;
    
//    self.window.rootViewController=tab;
    
    tabBarController *haha=[[tabBarController alloc]init];
    //registerView *re=[[registerView alloc]init];
    self.window.rootViewController=nav2;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
