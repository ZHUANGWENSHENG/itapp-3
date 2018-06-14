//
//  AdoptCenter.m
//  ItApp1
//
//  Created by QUAQUA on 2017/11/28.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "AdoptCenter.h"
#import "AdoptCell.h"
#import "News.h"
#import "shouyang.h"
#import "AFNetworking.h"
@interface AdoptCenter ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    NSMutableArray *arr5;
    NSMutableArray *arr6;

}

@end

@implementation AdoptCenter

- (void)viewDidLoad {
    [super viewDidLoad];
   

    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refresh addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
   // [self.refreshControl beginRefreshing];
    
    
    self.title=@"领养中心";
      [self.tableView registerNib:[UINib nibWithNibName:@"AdoptCell" bundle:nil] forCellReuseIdentifier:@"adopt"];
    UIButton *xiaoxi=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"news"];
    [xiaoxi setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [xiaoxi addTarget:self action:@selector(toxiaoxi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:xiaoxi];
    self.navigationItem.rightBarButtonItem=right;
    
    self.tableView.sectionFooterHeight=10;
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.navigationController.navigationBarHidden=YES;
     [self.navigationController setNavigationBarHidden:NO];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIButton *back=[[UIButton alloc]init];
    UIImage *img1=[UIImage imageNamed:@"Back"];
    [back setImage:img1 forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
}
-(void)viewWillAppear:(BOOL)animated{
    [self AFGetData];
    [self AFNetMonitor];
 
     
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    shouyang *new=[[shouyang alloc]init];
    [self.navigationController pushViewController:new animated:YES];
}
- (void)refresh{
       self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
        [self.tableView reloadData];
       [self AFGetData];
       [self AFNetMonitor];
        [self.refreshControl endRefreshing];
    
}



-(void)toxiaoxi{
    News *xiaoXi=[[News alloc]init];
    [self.navigationController pushViewController:xiaoXi animated:YES];
    self.navigationController.navigationBarHidden=YES;
    ;
}
-(void)toIndexView{

    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 245;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return arr1.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     AdoptCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adopt" forIndexPath:indexPath];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
    [formatter setDateFormat:@"hh:mm:ss"];//定义时间为这种格式： YYYY-MM-dd hh:mm:ss 。
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];//将NSDate  ＊对象 转化为 NSString ＊对象。
    cell.time.text=currentTime;
    cell.head.image=[UIImage imageNamed:arr2[indexPath.section]];
    cell.name.text=arr4[indexPath.section];
    cell.contentLable.text=arr3[indexPath.section];
    return cell;
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
-(void)AFGetData{
    
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
    [session GET:@"http://127.0.0.1:3000/t" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功");
        
        
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        arr1=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"id"]];
        arr2=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"head"]];
        arr3=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"zhengwen"]];
        arr4=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"name"]];

         [self.tableView reloadData];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
    }];
    
  
     
}



@end
