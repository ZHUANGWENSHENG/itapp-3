//
//  myView.m
//  ItApp1
//
//  Created by QUAQUA on 2017/11/18.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "myView.h"

#import "chongwuview.h"

@interface myView ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *arr,*img;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *head;

@end

@implementation myView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.separatorStyle=UITableViewStyleGrouped;
    self.tableView.tableFooterView=[[UIView alloc]init];
    arr=[[NSMutableArray alloc]initWithObjects:@"个人资料",@"爱宠",@"收藏",@"提醒",@"相册",@"足迹",nil];
    img=[[NSMutableArray alloc]initWithObjects:@"m1",@"m2",@"m3",@"tixing",@"m5",@"m6",@"m7", nil];
    _head.layer.masksToBounds=YES;
    _head.layer.cornerRadius=_head.bounds.size.width/2;
     [self.navigationController setNavigationBarHidden:YES];
    self.tableView.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(indexPath.section==1){
        chongwuview *pet=[[chongwuview alloc]init];
        [self.navigationController pushViewController:pet animated:YES];
     [self.navigationController setNavigationBarHidden:NO];
//    }
//
    
}

-(void)viewWillAppear:(BOOL)animated{
   
    [self viewDidLoad];
}
@end
