//
//  CashVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/12.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "CashVC.h"

@interface CashVC ()

@end

@implementation CashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    self.navigationItem.title = @"会员提现";
    self.view.backgroundColor = LINECOLOR;
    [self createUI];
    [self bottomLab];
}
-(void)createUI{
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(10, SafeAreaTopHeight+10, WIDTH-20, 280)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    UILabel *bankLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 30)];
    bankLab.text = @"第三方资金提现";
    bankLab.font = [UIFont systemFontOfSize:18];
    [whiteView addSubview:bankLab];
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(10, bankLab.bottom+5, WIDTH-40, 1)];
    line1.backgroundColor = LINECOLOR;
    [whiteView addSubview:line1];
    //
    UILabel *wayLab = [[UILabel alloc] initWithFrame:CGRectMake(10, line1.bottom+10, 200, 30)];
    wayLab.text = @"可用资金: 10000元";
    [whiteView addSubview:wayLab];
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(10, wayLab.bottom+5, WIDTH-40, 1)];
    line2.backgroundColor = LINECOLOR;
    [whiteView addSubview:line2];
    //
    UILabel *moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, line2.bottom+10, 80, 30)];
    moneyLab.text = @"提取金额:";
    [whiteView addSubview:moneyLab];
    UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(moneyLab.right, line2.bottom+10, 200, 30)];
    money.text = @"100000元";
    money.textColor = [UIColor lightGrayColor];
    [whiteView addSubview:money];
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(10, moneyLab.bottom+5, WIDTH-40, 1)];
    line3.backgroundColor = LINECOLOR;
    [whiteView addSubview:line3];
    
    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(10, line3.bottom+10, 80, 30)];
    countLab.text = @"提取费用:";
    [whiteView addSubview:countLab];
    UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(countLab.right, line3.bottom+10, 200, 30)];
    count.text = @"0.00元";
//    count.textColor = [UIColor lightGrayColor];
    [whiteView addSubview:count];
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(10, countLab.bottom+5, WIDTH-40, 1)];
    line4.backgroundColor = LINECOLOR;
    [whiteView addSubview:line4];
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, line4.bottom+30, WIDTH-40, 40);
    btn.backgroundColor = NAVCOLOR;
    [btn setTitle:@"申请提现" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    [whiteView addSubview:btn];
    [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    
}
#pragma mark 点击方法
-(void)action:(UIButton *)btn{
    
}
-(void)bottomLab{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, HEIGHT-100-SafeAreaBottomHeight, WIDTH, 30)];
    title.text = @"警告:";
    [self.view addSubview:title];
    UILabel *tips1 = [[UILabel alloc] initWithFrame:CGRectMake(20, title.bottom, WIDTH-40, 60)];
    tips1.textColor = [UIColor lightGrayColor];
    tips1.font = [UIFont systemFontOfSize:15];
    tips1.text = @"禁止信用卡套现,虚假交易等行为,一经确认,将终止该账户的使用权利.";
    tips1.numberOfLines = 0;
    [self.view addSubview:tips1];

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
