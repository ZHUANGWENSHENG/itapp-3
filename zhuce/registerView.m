//
//  registerView.m
//  denglu
//
//  Created by 楼可欣 on 2017/11/22.
//  Copyright © 2017年 Big Nerd Ranch. All rights reserved.
//

#import "registerView.h"
#import "load.h"
#import "ViewController.h"
#import "AFNetworking.h"

@interface registerView ()<UITextFieldDelegate>
{

    
}

@end

@implementation registerView

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _zhuCe.layer.borderColor=[UIColor colorWithRed:0.318 green:0.722 blue:0.549 alpha:1].CGColor;
    _zhuCe.layer.borderWidth=1;
    _zhuCe.layer.cornerRadius=25;
    _zhuCe.layer.masksToBounds=YES;
    
    _putcode.delegate=self;
    _putpassw.delegate=self;
    _putphone.delegate=self;
    _putpassw.secureTextEntry=YES;
    [_zhuCe addTarget:self action:@selector(toLoad) forControlEvents:UIControlEventTouchDown];

    
    [self.navigationController setNavigationBarHidden:NO];
    self.title=@"注册";
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Back"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toLoad) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
    
}


-(void)toLoad{
    [self AFNetMonitor];
    [self AFGetData];
    load *dL=[[load alloc]init];
    [self.navigationController pushViewController:dL animated:YES];
    UIAlertController *alt=[UIAlertController alertControllerWithTitle:@"" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alt animated:YES completion:nil];
    UIAlertAction *guan=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [alt addAction:guan];
   
}
- (IBAction)aa:(id)sender {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString *str1=[[NSString alloc]init];
    str1=_putphone.text;
    NSString *str2=[[NSString alloc]init];
    str2=_putpassw.text;
    NSString *str3 = [[NSString alloc] initWithString:[NSString stringWithFormat:@"小可爱001"]];
    
    NSDictionary *parameters = @{@"id":str1,@"password":str2,@"name":str3,@"head":@"mao"};
    NSLog(@"%@",parameters);
    [session POST:@"http://127.0.0.1:3000" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"失败");
        
    }];
   

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    收起键盘
    [_putphone resignFirstResponder];
    [_putpassw resignFirstResponder];
    [_putcode resignFirstResponder];
    
}

@end
