//
//  IndexView.m
//  ItApp1
//
//  Created by DMT on 2017/11/14.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "IndexView.h"
#import "News.h"
#import "load.h"
#import "ViewController.h"
#import "faBu.h"
#import "questionCell.h"
#import "AdoptCenter.h"
#import "questionController.h"
#import "Activity.h"


@interface IndexView ()
{
    UITextField *_input;
    UISearchBar *customSearchBar;
    UIImageView *bnm;
    UIImageView *bnm2;
    UIImageView *bnm3;
    UIScrollView *banner;
}
@property (nonatomic, retain)UIPageControl *myPageControl;
@end

@implementation IndexView

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 1)];
//    line.backgroundColor=[UIColor colorWithRed:0.976 green:0.976 blue:0.976 alpha:1];
//    [self.tabBarController.view addSubview:line];
    CGRect rec =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1);
    UIGraphicsBeginImageContext(rec.size);
    CGContextRef con= UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(con,[UIColor colorWithRed:0.9765 green:0.9765 blue:0.9765 alpha:1].CGColor);
    CGContextFillRect(con, rec);
    UIImage *im =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBarController.tabBar setShadowImage:im];
    [self.tabBarController.tabBar setBackgroundImage:[[UIImage alloc] init]];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.frame=[UIScreen mainScreen].bounds;
    
    
    banner=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 190)];
    banner.pagingEnabled=YES;
    UIImage *bannerImage=[UIImage imageNamed:@"banner"];
    bnm=[[UIImageView alloc]initWithImage:bannerImage];
    bnm.frame=CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 190);
    [banner addSubview:bnm];
    UIImage *bannerImage2=[UIImage imageNamed:@"banner"];
    bnm2=[[UIImageView alloc]initWithImage:bannerImage2];
    bnm2.frame=CGRectMake(banner.bounds.size.width, 0,[UIScreen mainScreen].bounds.size.width, 190);
    [banner addSubview:bnm2];
    UIImage *bannerImage3=[UIImage imageNamed:@"banner"];
    bnm3=[[UIImageView alloc]initWithImage:bannerImage3];
    bnm3.frame=CGRectMake(banner.bounds.size.width*2, 0,[UIScreen mainScreen].bounds.size.width, 190);
    [banner addSubview:bnm3];
    CGRect bnr=banner.bounds;
    CGRect bnr2=bnr;
    bnr2.size.width*=3.0;
    banner.contentSize=bnr2.size;
    banner.bounces=NO;
    banner.showsVerticalScrollIndicator=NO;
    banner.showsHorizontalScrollIndicator=NO;
    
  
//    UIPageControl *ball=[[UIPageControl alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, 240, 200, 40)];
    
    self.myPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 50)];
    self.myPageControl.numberOfPages = 2;
    self.myPageControl.currentPage = 0;
    [self.view addSubview:banner];
    [self.view addSubview:self.myPageControl];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
    banner.tag=1000;
    


    _lingyang.layer.masksToBounds=YES;
    _lingyang.layer.cornerRadius=15;
    _lingyang.adjustsImageWhenHighlighted=NO;
    _huodong.layer.masksToBounds=YES;
    _huodong.adjustsImageWhenHighlighted=NO;
    _huodong.layer.cornerRadius=15;
    _jiaoliu.layer.masksToBounds=YES;
    _jiaoliu.layer.cornerRadius=15;
    _jiaoliu.adjustsImageWhenHighlighted=NO;
    _jiyang.layer.masksToBounds=YES;
    _jiyang.layer.cornerRadius=15;
    [_jiaoliu addTarget:self action:@selector(jiaoliu) forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)huodong:(id)sender {
    Activity *activity=[[Activity alloc]init];
    [self.navigationController pushViewController:activity animated:YES];
}
- (IBAction)lingyang:(id)sender {
    AdoptCenter *adopt=[[AdoptCenter alloc]init];
    [self.navigationController pushViewController:adopt animated:YES];
}
- (IBAction)lingyang2:(id)sender {
    AdoptCenter *adopt=[[AdoptCenter alloc]init];
    [self.navigationController pushViewController:adopt animated:YES];
}
- (IBAction)jiaoliu:(id)sender {
    questionController *jiaoliu=[[questionController alloc]init];
     self.navigationController.navigationBarHidden=YES;
    [self.navigationController pushViewController:jiaoliu animated:YES];
    customSearchBar.hidden=YES;
  
}
- (IBAction)jiaoliu2:(id)sender {
    questionController *jiaoliu=[[questionController alloc]init];
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController pushViewController:jiaoliu animated:YES];
    customSearchBar.hidden=YES;
}
-(void)viewWillAppear:(BOOL)animated{
    
    UIButton *place=[[UIButton alloc]init];
    [place setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    place.frame=CGRectMake(0, 0, 12.5, 21);
    [place setTitle:@"杭州" forState:UIControlStateNormal];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:place];
    self.navigationItem.leftBarButtonItem=left;
    
    
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-115, 25, 230, 28)];
       // customSearchBar.delegate = self;
    customSearchBar.showsCancelButton = NO;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    customSearchBar.placeholder=@"搜索活动、热门话题等";
    //    [_input setValue:[UIColor blueColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _input=[customSearchBar valueForKey:@"_searchField"];
    [_input setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    //     [customSearchBar setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    //    [customSearchBar setValue:[UIFont boldSystemFontOfSize:12] forKey:@"_placeholderLabel.font"];
    //    customSearchBar.showsCancelButton=YES;
    customSearchBar.backgroundColor=[UIColor whiteColor];
    customSearchBar.layer.masksToBounds=YES;
    customSearchBar.layer.cornerRadius=5;
    customSearchBar.searchBarStyle=UISearchBarStyleMinimal;
    //    customSearchBar.tintColor=[UIColor whiteColor];
    //    customSearchBar.barTintColor=[UIColor whiteColor];
    self.tabBarController.tabBar.tintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    //    _input=[[UITextField alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-115, 25, 231, 28)];
    //    _input.backgroundColor=[UIColor colorWithRed:0.576 green:0.878 blue:0.745 alpha:1];
    //    _input.layer.masksToBounds=YES;
    //    _input.layer.cornerRadius=3.0;
    //    _input.placeholder=@"搜索活动、热门话题等";
    //    [self.navigationController.view addSubview:_input];
    
    UIButton *xiaoxi=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"news"];
    [xiaoxi setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [xiaoxi addTarget:self action:@selector(toxiaoxi) forControlEvents:UIControlEventTouchDown];
    //    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:xiaoxi];
    _haha=[[UIBarButtonItem alloc]initWithCustomView:xiaoxi];
    self.navigationItem.rightBarButtonItem=_haha;
    
    
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.view addSubview: customSearchBar];
    [super viewWillAppear:animated];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"正在拖拽视图，所以需要将自动播放暂停掉");
    //setFireDate：设置定时器在什么时间启动
    //[NSDate distantFuture]:将来的某一时刻
    [self.timer setFireDate:[NSDate distantFuture]];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //视图静止之后，过1.5秒在开启定时器
    //[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]  返回值为从现在时刻开始 再过1.5秒的时刻。
    NSLog(@"开启定时器");
    [self.timer setFireDate:[NSDate dateWithTimeInterval:1 sinceDate:[NSDate date]]];
}
- (void)changeView{
    UIScrollView *scrollView = [self.view viewWithTag:1000];
    //通过改变contentOffset来切换滚动视图的子界面
    float offset_X = scrollView.contentOffset.x;
    //每次切换一个屏幕
    offset_X += CGRectGetWidth(self.view.frame);
    
    //说明要从最右边的多余视图开始滚动了，最右边的多余视图实际上就是第一个视图。所以偏移量需要更改为第一个视图的偏移量。
    if (offset_X > CGRectGetWidth(self.view.frame)*2) {
        scrollView.contentOffset = CGPointMake(0, 0);
        
    }
    //说明正在显示的就是最右边的多余视图，最右边的多余视图实际上就是第一个视图。所以pageControl的小白点需要在第一个视图的位置。
    if (offset_X == CGRectGetWidth(self.view.frame)*2) {
        self.myPageControl.currentPage = 0;
    }else{
        self.myPageControl.currentPage = offset_X/CGRectGetWidth(self.view.frame);
    }

    //得到最终的偏移量
    CGPoint resultPoint = CGPointMake(offset_X, 0);
    //切换视图时带动画效果
    //最右边的多余视图实际上就是第一个视图，现在是要从第一个视图向第二个视图偏移，所以偏移量为一个屏幕宽度
    if (offset_X >CGRectGetWidth(self.view.frame)*2) {
        self.myPageControl.currentPage = 1;
        [scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.view.frame), 0) animated:YES];
    }else{
        [scrollView setContentOffset:resultPoint animated:YES];
    }
    
}
//-(void)changeView2{
//    bnm.frame=CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 186);
//    bnm2.frame=CGRectMake(banner.bounds.size.width, 0,[UIScreen mainScreen].bounds.size.width, 186);
//    self.timer2=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
//}
- (IBAction)fabu:(id)sender {

    faBu *haha=[[faBu alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:haha];
//    [haha setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)toxiaoxi{
    News *xiaoXi=[[News alloc]init];
    [self.navigationController pushViewController:xiaoXi animated:YES];

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [customSearchBar resignFirstResponder];
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

@end
