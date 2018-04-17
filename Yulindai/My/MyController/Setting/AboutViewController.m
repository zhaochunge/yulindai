//
//  AboutViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"誉霖贷";
    self.view.backgroundColor=[UIColor colorWithRed:239/255.0 green:240/255.0 blue:241/255.0 alpha:1];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0-65, 80, 100, 130)];
    imgView.image=[UIImage imageNamed:@"关于誉霖贷版本V1.0"];
    [self.view addSubview:imgView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT-50, WIDTH, 30)];
    label.textColor=[UIColor lightGrayColor];
    label.text=@"大连誉霖聚信科技发展有限公司";
    label.font=[UIFont systemFontOfSize:14];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
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
