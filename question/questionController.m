//
//  questionController.m
//  ItApp1
//
//  Created by 楼可欣 on 2017/12/8.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "questionController.h"
#import "questionCell.h"

@interface questionController (){
    UIView *button;
}

@end

@implementation questionController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    self.title=@"交流中心";
    [self.tableView registerNib:[UINib nibWithNibName:@"questionCell" bundle:nil] forCellReuseIdentifier:@"question"];
    self.tableView.rowHeight=108;
    self.tableView.sectionHeaderHeight=0.1;
    self.tableView.sectionFooterHeight=5;
    button=[[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30)];
   
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2, 30)];
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 30)];
    btn1.backgroundColor=[UIColor whiteColor];
    btn2.backgroundColor=[UIColor whiteColor];
    [btn1 setTitle:@"回答" forState:UIControlStateNormal];
    [btn2 setTitle:@"提问" forState:UIControlStateNormal];
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, 1, 30)];
    line.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addSubview:btn1];
    [button addSubview:btn2];
    [button addSubview:line];
    [self.navigationController.view addSubview:button];
    
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Back"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
    [self.navigationController setNavigationBarHidden:NO];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)toIndexView{
    button.hidden=YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    questionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"question" forIndexPath:indexPath];
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
