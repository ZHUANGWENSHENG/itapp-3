//
//  ViewController.m
//  denglu
//
//  Created by 楼可欣 on 2017/11/20.
//  Copyright © 2017年 Big Nerd Ranch. All rights reserved.
//

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
#import "tabBarController.h"
#import "AFNetworking.h"
#import "faBu.h"

@interface ViewController ()
<UITextFieldDelegate>
{
    //UITextField *password;
   // UITextField *phone;
    UITabBarController *tab;
    UIViewController *vc;
    NSMutableArray *idnum;
    NSMutableArray *pw;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _phone.delegate=self;

//  _password.textAlignment = NSTextAlignmentCenter;
    _password.clearButtonMode=UITextFieldViewModeAlways;
    _phone.clearButtonMode=UITextFieldViewModeAlways;
        _password.secureTextEntry=YES;
    _password.returnKeyType=UIReturnKeyGo;
//    _phone.textAlignment = NSTextAlignmentCenter;
    _password.delegate=self;
    _load.layer.borderColor=[UIColor whiteColor].CGColor;
    _zhuCe.layer.borderColor=[UIColor colorWithRed:0.318 green:0.722 blue:0.549 alpha:1].CGColor;
    _zhuCe.layer.borderWidth=1;
    _zhuCe.layer.cornerRadius=25;
    _zhuCe.layer.masksToBounds=YES;
    _load.layer.borderWidth=1;
    _load.layer.cornerRadius=25;
    _load.layer.masksToBounds=YES;
    [_load addTarget:self action:@selector(toIndex) forControlEvents:UIControlEventTouchDown];
    [_zhuCe addTarget:self action:@selector(toRegister) forControlEvents:UIControlEventTouchDown];
    [_forget addTarget:self action:@selector(toForget) forControlEvents:UIControlEventTouchDown];
    [self.navigationController setNavigationBarHidden:NO];
    self.title=@"登录";
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Back"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toLoad) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;


    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    
//    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,64, [UIScreen mainScreen].bounds.size.width, 1)];
//    line.backgroundColor=[UIColor whiteColor];
//    [self.navigationController.view addSubview:line];
}
-(void)AFNetMonitor{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]
     setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
         switch(status){
             case AFNetworkReachabilityStatusNotReachable:
                 NSLog(@"无网络连接！");
                 break;
                 
             case AFNetworkReachabilityStatusReachableViaWiFi:
                 NSLog(@"通过wifi连接的网络");
             case AFNetworkReachabilityStatusReachableViaWWAN:
             {
                 NSLog(@"通过4g");
             }
                 default:
                 break;
         }
     }];
}
-(void)AFGetData{
    
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
    [session GET:@"http://127.0.0.1:3000/a" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功");
       

            NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
          //  NSLog(@"res=%@",jsonObject);
    
        idnum=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"id"]];
        pw=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"password"]];
        for(int i=0;i<idnum.count;i++){
            if(_phone.text==idnum[i]){
                if(_password.text==pw[i])
                {tabBarController *tab=[[tabBarController alloc]init];

                UIWindow *win=self.view.window;
                win.rootViewController=tab;
                }
                else{
                    UIAlertController *alt=[UIAlertController alertControllerWithTitle:@"" message:@"密码错误" preferredStyle:UIAlertControllerStyleAlert];
                    [self presentViewController:alt animated:YES completion:nil];
                    UIAlertAction *guan=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }];
                    
                    
                    [alt addAction:guan];
                }
            }
            else{
               
                
               
             
            }
           
        }
   
        
        
    
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
    }];
}
-(void)toRegister{
    registerView *reg=[[registerView alloc]init];
    [self.navigationController pushViewController:reg animated:YES];
}
-(void)toLoad{
    load *dL=[[load alloc]init];
    [self.navigationController pushViewController:dL animated:YES];

}
-(void)toForget{
    forgetViewController *forget=[[forgetViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
}
-(void)toIndex{

    tabBarController *tab=[[tabBarController alloc]init];
    
    UIWindow *win=self.view.window;
    win.rootViewController=tab;
    
    [self AFNetMonitor];
    [self AFGetData];
  
 
    
   
}

//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
////    if(tab.viewControllers[3]){
////        return NO;
////    }else{
//        return YES;
////    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    收起键盘
    [_password resignFirstResponder];
    [_phone resignFirstResponder];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
