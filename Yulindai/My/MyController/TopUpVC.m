//
//  TopUpVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/12.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "TopUpVC.h"

@interface TopUpVC ()

@end

@implementation TopUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    self.navigationItem.title = @"会员充值";
    self.view.backgroundColor = LINECOLOR;
    [self createUI];
    [self rightItem];
    [self bottomLab];
}
-(void)bottomLab{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, HEIGHT-130-SafeAreaBottomHeight, WIDTH, 30)];
    title.text = @"温馨提示:";
    [self.view addSubview:title];
    UILabel *tips1 = [[UILabel alloc] initWithFrame:CGRectMake(20, title.bottom, WIDTH-40, 30)];
    tips1.textColor = [UIColor lightGrayColor];
    tips1.font = [UIFont systemFontOfSize:15];
    tips1.text = @"即时充值所产生的转账费用,有第三方平台收取,充值费用视平台而定";
    [self.view addSubview:tips1];
    UILabel *tips2 = [[UILabel alloc] initWithFrame:CGRectMake(20, tips1.bottom, WIDTH-40, 30)];
    tips2.textColor = [UIColor lightGrayColor];
    tips2.text = @"请您注意您的银行卡充值限制,以免造成不便.";
    tips2.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:tips2];
    UILabel *tips3 = [[UILabel alloc] initWithFrame:CGRectMake(20, tips2.bottom, WIDTH-40, 30)];
    tips3.textColor = [UIColor lightGrayColor];
    tips3.text = @"如果充值金额没有及时到账,请和客服联系.";
    [self.view addSubview:tips3];
    tips3.font = [UIFont systemFontOfSize:15];
}
-(void)rightItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"充值日志-icon"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =item;
}
-(void)rightBtn:(UIButton *)btn{
    
}
-(void)createUI{
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(10, SafeAreaTopHeight+10, WIDTH-20, 260)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    UILabel *bankLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
    bankLab.text = @"选择银行";
    [whiteView addSubview:bankLab];
    UILabel *bank = [[UILabel alloc] initWithFrame:CGRectMake(bankLab.right, 5, 200, 30)];
    bank.textColor = [UIColor lightGrayColor];
    [whiteView addSubview:bank];
    bank.text = @"中国工商银行";
    UIButton *sprbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sprbtn.frame = CGRectMake(WIDTH-40, 10, 20, 20);
    [whiteView addSubview:sprbtn];
    [sprbtn setImage:[UIImage imageNamed:@"更多_ICON"] forState:(UIControlStateNormal)];
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(10, bankLab.bottom+5, WIDTH-40, 1)];
    line1.backgroundColor = LINECOLOR;
    [whiteView addSubview:line1];
    //
    UILabel *wayLab = [[UILabel alloc] initWithFrame:CGRectMake(10, line1.bottom+10, 100, 30)];
    wayLab.text = @"充值方式:";
    [whiteView addSubview:wayLab];
    UILabel *way = [[UILabel alloc] initWithFrame:CGRectMake(wayLab.right, line1.bottom+10, 150, 30)];
    way.text = @"资金托管";
    way.textColor = [UIColor lightGrayColor];
    [whiteView addSubview:way];
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(10, wayLab.bottom+5, WIDTH-40, 1)];
    line2.backgroundColor = LINECOLOR;
    [whiteView addSubview:line2];
    //
    UILabel *moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, line2.bottom+10, 100, 30)];
    moneyLab.text = @"充值金额:";
    [whiteView addSubview:moneyLab];
    UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(moneyLab.right, line2.bottom+10, 200, 30)];
    money.text = @"100000元";
    money.textColor = [UIColor lightGrayColor];
    [whiteView addSubview:money];
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(10, moneyLab.bottom+5, WIDTH-40, 1)];
    line3.backgroundColor = LINECOLOR;
    [whiteView addSubview:line3];
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, line3.bottom+30, WIDTH-40, 40);
    btn.backgroundColor = NAVCOLOR;
    [btn setTitle:@"充值" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    [whiteView addSubview:btn];
    [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    
}
#pragma mark 充值点击方法
-(void)action:(UIButton *)btn{
    
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
