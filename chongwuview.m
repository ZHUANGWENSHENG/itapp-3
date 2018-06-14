//
//  chongwuview.m
//  ItApp1
//
//  Created by QUAQUA on 2017/12/26.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "chongwuview.h"
#import "chongwu.h"
#import "AFNetworking.h"

@interface chongwuview (){
    UIButton *tianjia;
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    int i;
    UIButton *fabu1;
    UIBarButtonItem *right1;
    UIBarButtonItem *right;
    NSString *str4;
    NSString *str5;
    NSString *str6;
    NSString *row;
}
@end

@implementation chongwuview

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *fabu=[[UIButton alloc]init];
    [fabu setTitle:@"编辑" forState:UIControlStateNormal];
    [fabu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fabu addTarget:self action:@selector(tishi) forControlEvents:UIControlEventTouchDown];
  right=[[UIBarButtonItem alloc]initWithCustomView:fabu];
    fabu1=[[UIButton alloc]init];
    [fabu1 setTitle:@"完成" forState:UIControlStateNormal];
    [fabu1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fabu1 addTarget:self action:@selector(wangcheng) forControlEvents:UIControlEventTouchDown];
    right1=[[UIBarButtonItem alloc]initWithCustomView:fabu1];
    self.navigationItem.rightBarButtonItem=right;
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refresh addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
    i=arc4random()%99;
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Back"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
    
    
   //self.tabBarController.tabBar.hidden=YES;
      self.tableView.tableFooterView=[[UIView alloc]init];
     [self.tableView registerNib:[UINib nibWithNibName:@"chongwu" bundle:nil] forCellReuseIdentifier:@"pet"];
    self.tableView.rowHeight=100;
    self.title=@"爱宠";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    
    tianjia=[[UIButton alloc]init];
    UIImage *img1=[UIImage imageNamed:@"tianjia"];
    [tianjia setImage:img1 forState:UIControlStateNormal];
    tianjia.frame=CGRectMake(0.1813*[UIScreen mainScreen].bounds.size.width, 564, 240, 36);
   // [tianjia addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchDown];
    [self.navigationController.view addSubview:tianjia];
    [tianjia addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchDown];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)wangcheng{
       self.navigationItem.rightBarButtonItem=right;
    //[self update];
    self.tableView.editing=NO;
    [self viewDidLoad];
    
}
- (void)refresh{
    //    if (self.refreshControl.refreshing){
    // [self.modelArray removeAllObjects];//清除旧数据，每次都加载最新的数据
    //self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"加载中..."];
    // [self addData];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.tableView reloadData];
    [self AFGetData];
    [self AFNetMonitor];
    [self.refreshControl endRefreshing];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    str4=[[NSString alloc]init];
     str5=[[NSString alloc]init];
     str6=[[NSString alloc]init];
    str4=arr1[indexPath.row];
    str5=arr1[indexPath.row];
    str6=arr1[indexPath.row];
}
-(void)post{
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
  
    
    NSString *str1=[[NSString alloc] initWithString:[NSString stringWithFormat:@"爱犬"]];
    NSString *str2=[[NSString alloc] initWithString:[NSString stringWithFormat:@"男"]];
    NSString *str3 = [[NSString alloc] initWithString:[NSString stringWithFormat:@"3"]];
    NSString *str4 = [NSString stringWithFormat:@"%d",i];
    NSDictionary *parameters = @{@"id":str4,@"petname":str1,@"petsex":str2,@"petage":str3};
    //NSLog(@"%@",parameters);
    [session POST:@"http://127.0.0.1:3000/m" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"l");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
    
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        
    }];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self AFNetMonitor];
    [self AFGetData];
}
-(void)tishi{
    self.tableView.editing=YES;
       self.navigationItem.rightBarButtonItem=right1;
    
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
         [self.tableView reloadData];
         
     }];
}
-(void)update{
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
    
  
   
    NSDictionary *parameters = @{@"id":@1,@"petname":str4,@"petsex":str5,@"petage":str6};
    //NSLog(@"%@",parameters);
    [session POST:@"http://127.0.0.1:3000/m" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"l");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
          NSLog(@"%@",str4);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        
    }];
}
-(void)AFGetData{
    
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
    [session GET:@"http://127.0.0.1:3000/m" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功");
        
        
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        // NSLog(@"res=%@",jsonObject);
        
        
        arr1=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"petname"]];
        arr2=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"petsex"]];
        arr3=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"petage"]];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toIndexView{
    
    //     [self.navigationController setNavigationBarHidden:YES];
    tianjia.hidden=YES;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return arr1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    chongwu *cell = [tableView dequeueReusableCellWithIdentifier:@"pet" forIndexPath:indexPath];
    
    // str4=cell.name.text;
    cell.name.text=arr1[indexPath.row];
    cell.age.text=arr3[indexPath.row];
    cell.sex.text=arr2[indexPath.row];

    return cell;
}

-(void)AFDeleteData{
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"id":row};
    [session DELETE:@"http://127.0.0.1:3000/m" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        
        
    }];
      [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    row = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    [self AFDeleteData];
}

@end
