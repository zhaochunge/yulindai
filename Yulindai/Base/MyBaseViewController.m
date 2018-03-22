//
//  MyBaseViewController.m
//  Yulindai
//
//  Created by zcg on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "MyBaseViewController.h"

@interface MyBaseViewController ()

@end

@implementation MyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNav];

}
-(void)createNav{
    UIView *view = [UIView new];
    [self.view addSubview:view];
    view.backgroundColor = NAVCOLOR;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@0);
        make.right.mas_offset(@0);
        make.height.mas_equalTo(@SafeAreaTopHeight);
        make.top.mas_offset(@0);
    }];
    self.navLab = [UILabel new];
    self.navLab.textAlignment = YES;
    _navLab.textColor = [UIColor whiteColor];
    [self.view addSubview:_navLab];
    [self.navLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@70);
        make.right.mas_offset(@-70);
        make.top.mas_offset(@(SafeAreaTopHeight-44));
        make.height.mas_equalTo(@44);
    }];
}
-(void)setBackBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
//    btn.backgroundColor = [UIColor whiteColor];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@25);
        make.top.mas_offset(@(SafeAreaTopHeight-35));
        make.width.mas_equalTo(@27);
        make.height.mas_equalTo(@25);
    }];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    
}
-(void)back:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
