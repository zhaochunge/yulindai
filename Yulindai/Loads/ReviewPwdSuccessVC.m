//
//  ReviewPwdSuccessVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ReviewPwdSuccessVC.h"
#import "ViewController.h"

@interface ReviewPwdSuccessVC ()

@end

@implementation ReviewPwdSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    self.navLab.text = @"忘记密码";
}
-(void)initView{
    UIImageView *image = [UIImageView new];
    [self.view addSubview:image];
    image.image = [UIImage imageNamed:@"成功"];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@80);
        make.top.mas_offset(SafeAreaTopHeight+30);
    }];
//    image.backgroundColor = NAVCOLOR;
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 40;
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"恭喜您,密码重置成功!";
    titleLab.textColor = NAVCOLOR;
    [self.view addSubview:titleLab];
    titleLab.textAlignment = YES;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@30);
        make.right.mas_offset(@-30);
        make.top.mas_equalTo(image.mas_bottom).mas_offset(50);
        make.height.mas_equalTo(@30);
    }];
    UIButton *loadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:loadBtn];
    [loadBtn setBackgroundColor:NAVCOLOR];
    loadBtn.layer.cornerRadius = 20;
    loadBtn.layer.borderWidth = 1;
    loadBtn.layer.borderColor = NAVCOLOR.CGColor;
    [loadBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [loadBtn setTitle:@"立即登录" forState:(UIControlStateNormal)];
    [loadBtn addTarget:self action:@selector(Load:) forControlEvents:(UIControlEventTouchUpInside)];
    [loadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@30);
        make.right.mas_offset(@-30);
        make.height.mas_equalTo(@40);
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(@50);
    }];
}
#pragma mark 立即登录
-(void)Load:(UIButton *)btn{
    ViewController *vc = [ViewController new];
    [self presentViewController:vc animated:YES completion:^{
        
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

@end
