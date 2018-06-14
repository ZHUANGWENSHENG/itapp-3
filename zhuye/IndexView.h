//
//  IndexView.h
//  ItApp1
//
//  Created by DMT on 2017/11/14.
//  Copyright © 2017年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexView : UIViewController
@property(strong,nonatomic)NSTimer  * timer;
@property(strong,nonatomic)NSTimer  * timer2;
@property (weak, nonatomic) IBOutlet UIButton *lingyang;
@property (weak, nonatomic) IBOutlet UIView *a1;
@property (weak, nonatomic) IBOutlet UIButton *huodong;
@property (weak, nonatomic) IBOutlet UIButton *jiaoliu;
@property (weak, nonatomic) IBOutlet UIButton *jiyang;

@property(strong,nonatomic)UIBarButtonItem *haha;
@end
