//
//  hotNews.m
//  ItApp1
//
//  Created by DMT on 2017/11/22.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "hotNews.h"
#import "TableViewCell.h"
#import "News.h"
#import "detailsViewController.h"
#import "otherpeopleController.h"
@interface hotNews ()
<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>{
    NSArray *arr;
    NSArray *arr2;
    NSArray* searchData;
    NSArray* searchData2;
}


@end
bool isSearch;
@implementation hotNews

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refresh addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
    // 默认没有开始搜索
    isSearch = NO;
    arr=[[NSArray alloc]initWithObjects:@"aaa",@"bbb",@"ccc", nil];
      //arr2=[[NSArray alloc]initWithObjects:@"sdsh",@"rsadre",@"aads", nil];
    UIButton *place=[[UIButton alloc]init];
    [place setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    place.frame=CGRectMake(0, 0, 12.5, 21);
    [place setTitle:@"杭州" forState:UIControlStateNormal];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:place];
    self.navigationItem.leftBarButtonItem=left;
    
    
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-115, 25, 230, 28)];
    customSearchBar.delegate = self;
    customSearchBar.showsCancelButton = NO;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    customSearchBar.placeholder=@"搜索动态";
 
    _input=[customSearchBar valueForKey:@"_searchField"];
    [_input setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];

    customSearchBar.backgroundColor=[UIColor whiteColor];
    customSearchBar.layer.masksToBounds=YES;
    customSearchBar.layer.cornerRadius=5;
    customSearchBar.barTintColor = [UIColor whiteColor];
    //    customSearchBar.tintColor=[UIColor blueColor];
    

    
    
    [self.navigationController.view addSubview: customSearchBar];
    
    
    
    
    
    
    UIButton *xiaoxi=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"news"];
    [xiaoxi setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [xiaoxi addTarget:self action:@selector(toxiaoxi) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:xiaoxi];
    self.navigationItem.rightBarButtonItem=right;
    
    customSearchBar.showsCancelButton = true;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"hotCell"];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    self.tableView.sectionFooterHeight=10;
}
-(void)toxiaoxi{
    News *xiaoXi=[[News alloc]init];
    [self.navigationController pushViewController:xiaoXi animated:YES];
    self.navigationController.navigationBarHidden=YES;
    ;
}
- (void)refresh{

    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
    //    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:0.5];
    [self viewDidLoad];
}
//-(void)toxiaoxi{
//    News *xiaoXi=[[News alloc]init];
//    [self.navigationController pushViewController:xiaoXi animated:YES];
//    self.navigationController.navigationBarHidden=YES;
//    ;
//}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [customSearchBar resignFirstResponder];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // 如果处于搜索状态
    if(isSearch)
    {

        return searchData.count;

    }
    else
    {

        return arr.count;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotCell" forIndexPath:indexPath];
    NSInteger rowNo = indexPath.section;
    if(isSearch)
    {
        // 使用searchData作为表格显示的数据
        cell.name.text = [searchData objectAtIndex:rowNo];
       // cell.titleLable.text=[searchData2 objectAtIndex:rowNo];
    }
    else{
        // 否则使用原始的tableData作为表格显示的数据
        cell.name.text = [arr objectAtIndex:rowNo];
      //  cell.titleLable.text=[arr2 objectAtIndex:rowNo];
    }
    //cell.name.text=arr[indexPath.section];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
    
       [cell.head setUserInteractionEnabled:YES];
    
        //tap 手势一共两个属性，一个是设置轻拍次数，一个是设置点击手指个数
        //设置轻拍次数
        tap.numberOfTapsRequired = 1;
        //设置手指字数
        tap.numberOfTouchesRequired = 1;
    
        //别忘了添加到testView上
        [cell.head addGestureRecognizer:tap];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
    [formatter setDateFormat:@"hh:mm:ss"];//定义时间为这种格式： YYYY-MM-dd hh:mm:ss 。
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];//将NSDate  ＊对象 转化为 NSString ＊对象。
    cell.time.text=currentTime;
    return cell;
}
//-(void)ChargeEye{
//    otherpeopleController *o=[[otherpeopleController alloc]init];
//   
//    [self.navigationController pushViewController:o animated:YES];
//    
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 225;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText
{
    NSLog(@"----textDidChange------");
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchText];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailsViewController *new=[[detailsViewController alloc]init];
    [self.navigationController pushViewController:new animated:YES];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"----searchBarSearchButtonClicked------");
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchBar.text];
    // 放弃作为第一个响应者，关闭键盘
    [customSearchBar resignFirstResponder];
}
- (void) filterBySubstring:(NSString*) subStr
{
    NSLog(@"----filterBySubstring------");
    // 设置为搜索状态
    isSearch = YES;
    // 定义搜索谓词
    NSPredicate* pred = [NSPredicate predicateWithFormat:
                         @"SELF CONTAINS[c] %@" , subStr];
    // 使用谓词过滤NSArray
    //searchData2 = [arr2 filteredArrayUsingPredicate:pred];
    searchData = [arr filteredArrayUsingPredicate:pred];
    
    // 让表格控件重新加载数据
    [self.tableView reloadData];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"----searchBarCancelButtonClicked------");
    // 取消搜索状态
       [customSearchBar resignFirstResponder];
    isSearch = NO;
    [self.tableView reloadData];
}



@end

