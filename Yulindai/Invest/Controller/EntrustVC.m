//
//  EntrustVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "EntrustVC.h"
#import "PersonalOpenVC.h"

@interface EntrustVC ()
@property(nonatomic,strong)UITextField *name;
@property(nonatomic,strong)UITextField *icCard;
@end

@implementation EntrustVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"开通资金托管账户";
    [self createView];
}
-(void)createView{
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"实名认证";
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@30);
        make.top.mas_offset(10+SafeAreaTopHeight);
    }];
    UILabel *textLab = [UILabel new];
    textLab.text = @"请如实填写您本人身份信息";
    textLab.textColor = GARYCOLOR;
    [self.view addSubview:textLab];
    textLab.font = [UIFont systemFontOfSize:15];
    [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLab.mas_right).mas_offset(0);
        make.top.mas_offset(10+SafeAreaTopHeight);
        make.right.mas_offset(@-20);
        make.height.mas_equalTo(@30);
    }];
    UIView *line1 = [UIView new];
    line1.backgroundColor = LINECOLOR;
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.right.mas_offset(@-20);
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(@0);
        make.height.mas_equalTo(@1);
    }];
    UIImageView *logo = [UIImageView new];
    [self.view addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(WIDTH/2-80);
        make.width.mas_equalTo(@160);
        make.height.mas_equalTo(@50);
        make.top.mas_equalTo(line1.mas_bottom).mas_offset(@50);
    }];
    logo.image = [UIImage imageNamed:@"誉霖贷-ICON"];
    
    self.name = [UITextField new];
    self.name.placeholder = @"请输入真实姓名";
    [self.view addSubview:_name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.right.mas_offset(@-20);
        make.top.mas_equalTo(logo.mas_bottom).mas_offset(@50);
        make.height.mas_equalTo(@30);
    }];
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@20);
        make.right.mas_equalTo(@-20);
        make.top.mas_equalTo(_name.mas_bottom).mas_offset(@5);
        make.height.mas_equalTo(@1);
    }];
    self.icCard = [UITextField new];
    self.icCard.placeholder = @"请输入身份证号码";
    [self.view addSubview:_icCard];
    [_icCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_name.mas_left);
        make.right.mas_equalTo(_name.mas_right);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(line2.mas_bottom).mas_offset(@30);
    }];
    UIView *line3 = [UIView new];
    line3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_name.mas_left);
        make.right.mas_equalTo(_name.mas_right);
        make.top.mas_equalTo(_icCard.mas_bottom).mas_offset(@5);
        make.height.mas_equalTo(@1);
    }];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"立即开通" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btn setBackgroundColor:NAVCOLOR];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.right.mas_offset(@-20);
        make.top.mas_equalTo(line3.mas_bottom).mas_offset(@50);
        make.height.mas_equalTo(@40);
    }];
}
#pragma mark 立即开通点击
-(void)click:(UIButton *)btn{
    PersonalOpenVC *vc = [PersonalOpenVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
