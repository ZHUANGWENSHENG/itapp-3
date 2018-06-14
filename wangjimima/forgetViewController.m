//
//  forgetViewController.m
//  denglu
//
//  Created by 楼可欣 on 2017/11/22.
//  Copyright © 2017年 Big Nerd Ranch. All rights reserved.
//

#import "forgetViewController.h"
#import "load.h"

@interface forgetViewController ()
<UITextFieldDelegate,UITextViewDelegate>
{
    UITextField *phone;
    UITextField *code;
    UITextField *password;
    UITextField *password2;
    
}
@end

@implementation forgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"忘记密码";
    _finish.layer.borderColor=[UIColor colorWithRed:0.318 green:0.722 blue:0.549 alpha:1].CGColor;
    _finish.layer.borderWidth=1;
    _finish.layer.cornerRadius=25;
    _finish.layer.masksToBounds=YES;
    
    _password.secureTextEntry=YES;
    _password2.secureTextEntry=YES;
    
    _phone.delegate=self;
    _code.delegate=self;
    _password.delegate=self;
    _password2.delegate=self;
[self.navigationController setNavigationBarHidden:NO];
    
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Back"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toLoad) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)toLoad{
    load *dL=[[load alloc]init];
    [self.navigationController pushViewController:dL animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    收起键盘
    [_phone resignFirstResponder];
    [_code resignFirstResponder];
    [_password resignFirstResponder];
    [_password2 resignFirstResponder];
    
}
@end
