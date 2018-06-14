//
//  faBu.m
//  ItApp1
//
//  Created by DMT on 2017/11/30.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "faBu.h"
#import "IndexView.h"
#import "AdoptCenter.h"
#import "hotNews.h"
#import "myView.h"
#import "AFNetworking.h"
#import "ViewController.h"

@interface faBu ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,chuanZhiDelegate>{
    NSMutableArray *arr;
    NSMutableArray *img;
    UIAlertController *act;
    UIAlertController *alt;
}


@property (weak, nonatomic) IBOutlet UIButton *tianJiaShiPin3;
@property (weak, nonatomic) IBOutlet UIButton *tianJiaShiPin2;
@property (weak, nonatomic) IBOutlet UIButton *tianJiaShiPin1;
@property (weak, nonatomic) IBOutlet UIButton *tianJiaZhaoPian3;
@property (weak, nonatomic) IBOutlet UIButton *tianJiaZhaoPian2;
@property (weak, nonatomic) IBOutlet UIButton *tianJiaZhaoPian1;
@property (weak, nonatomic) IBOutlet UITextView *contentLable;
@property (weak, nonatomic) IBOutlet UIButton *riChang;
@property (weak, nonatomic) IBOutlet UIButton *linYang;

@property (weak, nonatomic) IBOutlet UIButton *jiCun;
@property (weak, nonatomic) IBOutlet UIButton *tiWen;

@end

@implementation faBu

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_idd);
    ViewController *haha=[[ViewController alloc]init];
    haha.chuanZhiDelegate=self;
     arr=[[NSMutableArray alloc]initWithObjects:@"所在位置",@"对谁可见",nil];
    img=[[NSMutableArray alloc]initWithObjects:@"Fill 17",@"yanjing",nil];
    UIButton *back=[[UIButton alloc]init];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
    
    UIButton *fabu=[[UIButton alloc]init];
    [fabu setTitle:@"发布" forState:UIControlStateNormal];
    [fabu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fabu addTarget:self action:@selector(tishi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:fabu];
    self.navigationItem.rightBarButtonItem=right;
    
    _tianJiaShiPin1.backgroundColor=[UIColor whiteColor];
    _tianJiaShiPin1.layer.borderColor=[UIColor grayColor].CGColor;
    _tianJiaShiPin1.layer.borderWidth=1;
    _tianJiaShiPin1.layer.masksToBounds=YES;
    _tianJiaShiPin1.layer.cornerRadius=11;
    _tianJiaZhaoPian1.backgroundColor=[UIColor whiteColor];
    _tianJiaZhaoPian1.layer.borderColor=[UIColor grayColor].CGColor;
    _tianJiaZhaoPian1.layer.borderWidth=1;
    _tianJiaZhaoPian1.layer.masksToBounds=YES;
    _tianJiaZhaoPian1.layer.cornerRadius=11;
    _riChang.backgroundColor=[UIColor whiteColor];
    _linYang.backgroundColor=[UIColor whiteColor];
    _jiCun.backgroundColor=[UIColor whiteColor];
    _tiWen.backgroundColor=[UIColor whiteColor];
    _riChang.layer.borderColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1].CGColor;
    _riChang.layer.borderWidth=1;
    _riChang.layer.masksToBounds=YES;
    _riChang.layer.cornerRadius=11;
    _linYang.layer.borderColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1].CGColor;
    _linYang.layer.borderWidth=1;
    _linYang.layer.masksToBounds=YES;
    _linYang.layer.cornerRadius=11;
    _jiCun.layer.borderColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1].CGColor;
    _jiCun.layer.borderWidth=1;
    _jiCun.layer.masksToBounds=YES;
    _jiCun.layer.cornerRadius=11;
    _tiWen.layer.borderColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1].CGColor;
    _tiWen.layer.borderWidth=1;
    _tiWen.layer.masksToBounds=YES;
    _tiWen.layer.cornerRadius=11;
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    self.title=@"发布动态";
    [_riChang addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchDown];
    [_linYang addTarget:self action:@selector(changeColor2) forControlEvents:UIControlEventTouchDown];
    [_jiCun addTarget:self action:@selector(changeColor3) forControlEvents:UIControlEventTouchDown];
    [_tiWen addTarget:self action:@selector(changeColor4) forControlEvents:UIControlEventTouchDown];
    
    [_tianJiaZhaoPian1 addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
    [_tianJiaZhaoPian2 addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
    [_tianJiaZhaoPian3 addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
//    [_riChang setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//    _riChang.enabled=NO;
      self.table.delegate=self;
    self.table.dataSource=self;
    
    
    // Do any additional setup after loading the view from its nib.
    
}
-(void)touch{
    
    act = [UIAlertController alertControllerWithTitle:nil message:@"请选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [self presentViewController:act animated:YES completion:nil];
    
    //  定义图片选择器
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    [act addAction:[UIAlertAction actionWithTitle:@"选择相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"选择相册");
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            //图片选择是相册（图片来源自相册）
            
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            //设置代理
            
            picker.delegate=self;
            
            //模态显示界面
            
            [self presentViewController:picker animated:YES completion:nil];
            
        }
        
        
    }]];
    
    
    
    [act addAction:[UIAlertAction actionWithTitle:@"选择相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"选择相机");
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            //图片选择是相册（图片来源自相册）
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            //设置代理
            
            picker.delegate=self;
            
            //模态显示界面
            
            [self presentViewController:picker animated:YES completion:nil];
            
        }
        
        else {
            
            NSLog(@"不支持相机");
            
        }
    }]];
    
    
    [act addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }]];
}
-(void)chuanZhi:(NSString *)str{
    NSLog(@"123123123%@",str);
}
-(void)changeColor{
    _riChang.backgroundColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    [_riChang setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _linYang.backgroundColor=[UIColor whiteColor];
    [_linYang setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _tiWen.backgroundColor=[UIColor whiteColor];
    [_tiWen setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _jiCun.backgroundColor=[UIColor whiteColor];
    [_jiCun setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
}
-(void)changeColor2{
    _linYang.backgroundColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    [_linYang setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _riChang.backgroundColor=[UIColor whiteColor];
    [_riChang setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _tiWen.backgroundColor=[UIColor whiteColor];
    [_tiWen setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _jiCun.backgroundColor=[UIColor whiteColor];
    [_jiCun setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
}
-(void)changeColor3{
    _jiCun.backgroundColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    [_jiCun setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _riChang.backgroundColor=[UIColor whiteColor];
    [_riChang setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _tiWen.backgroundColor=[UIColor whiteColor];
    [_tiWen setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _linYang.backgroundColor=[UIColor whiteColor];
    [_linYang setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
}
-(void)changeColor4{
    _tiWen.backgroundColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    [_tiWen setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _riChang.backgroundColor=[UIColor whiteColor];
    [_riChang setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _linYang.backgroundColor=[UIColor whiteColor];
    [_linYang setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
    _jiCun.backgroundColor=[UIColor whiteColor];
    [_jiCun setTitleColor:[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1] forState:UIControlStateNormal];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image=info[UIImagePickerControllerOriginalImage];
    _zhaopian.image=image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)toIndexView{

    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//    [self presentViewController:tab animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
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
    int a=arc4random()%99;
    
   // NSString *str1=[[NSString alloc] initWithString:@"arc4random()%9"];
   NSString *str1 = [NSString stringWithFormat:@"%d",a];
    NSLog(@"%d",a);
    NSString *str2=[[NSString alloc]init];
  
    str2=_contentLable.text;
    NSString *str3 = [[NSString alloc] initWithString:[NSString stringWithFormat:@"小可爱001"]];
    
    NSDictionary *parameters = @{@"id":str1,@"zhengwen":str2,@"img":@"",@"name":str3,@"head":@"mao"};
    NSLog(@"%@",parameters);
    [session POST:@"http://127.0.0.1:3000/t" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        
        // NSData *data =    [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        // [responseObject appendPartWithFormData:data name:];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 42.5;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text=arr[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.imageView.image=[UIImage imageNamed:img[indexPath.row]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(void)tishi{
    //UIView *haha=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self AFNetMonitor];
    [self AFGetData];
    
    UIAlertController *alt=[UIAlertController alertControllerWithTitle:@"" message:@"发布成功" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alt animated:YES completion:nil];
    UIAlertAction *guan=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
  
    
    [alt addAction:guan];

}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 30;
//}
//
//- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
