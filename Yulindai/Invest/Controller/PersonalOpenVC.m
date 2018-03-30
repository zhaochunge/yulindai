//
//  PersonalOpenVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "PersonalOpenVC.h"
#import "CustomAlertView.h"

@interface PersonalOpenVC ()<CustomAlertViewDelegate>
@property(nonatomic,strong)UITextField *pwd;
@property(nonatomic,strong)UITextField *pwdAgain;
@property(nonatomic,strong)UITextField *code;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *ICcard;
@property(nonatomic,strong)UILabel *phone;
@property(nonatomic,strong)UIView *bacView;
@end

@implementation PersonalOpenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title =@"个人开通";
    self.view.backgroundColor = LINECOLOR;
    [self createView];
}
-(void)createView{
    UIImageView *logoImg = [UIImageView new];
    [self.view addSubview:logoImg];
    [logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(SafeAreaTopHeight+8);
        make.left.mas_offset(WIDTH/2-111);
        make.width.mas_equalTo(@70);
        make.height.mas_equalTo(@25);
    }];
    logoImg.image = [UIImage imageNamed:@"誉霖贷-ICON"];
    UIView *line = [UIView new];
    line.backgroundColor = NAVCOLOR;
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(logoImg.mas_right).mas_offset(@5);
        make.height.mas_equalTo(@18);
        make.width.mas_equalTo(@2);
        make.top.mas_offset(SafeAreaTopHeight+12);
    }];
    UILabel *lab = [UILabel new];
    lab.text = @"正在为您存管资金";
    lab.textColor = NAVCOLOR;
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_right).mas_offset(@5);
        make.width.mas_equalTo(@140);
        make.height.mas_equalTo(@30);
        make.top.mas_offset(SafeAreaTopHeight+5);
    }];
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@0);
        make.right.mas_offset(@0);
        make.top.mas_equalTo(logoImg.mas_bottom).mas_offset(@10);
        make.height.mas_equalTo(@120);
    }];
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 70, 30)];
    nameLab.text = @"姓    名";
    [backView addSubview:nameLab];
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-150, 5, 130, 30)];
    _name.textColor = [UIColor lightGrayColor];
    _name.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_name];
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(20, nameLab.bottom+5, WIDTH-40, 1)];
    line1.backgroundColor = LINECOLOR;
    [backView addSubview:line1];
    UILabel *cardLab = [[UILabel alloc] initWithFrame:CGRectMake(20, line1.bottom+5, 100, 30)];
    cardLab.text = @"身份证";
    [backView addSubview:cardLab];
    self.ICcard = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-250, line1.bottom+5, 230, 30)];
    self.ICcard.textColor = [UIColor lightGrayColor];
    [backView addSubview:_ICcard];
    _ICcard.textAlignment = NSTextAlignmentRight;
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(20, _ICcard.bottom+5, WIDTH-40, 1)];
    line2.backgroundColor = LINECOLOR;
    [backView addSubview:line2];
    UILabel *phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(20, line2.bottom+5, WIDTH-40, 30)];
    phoneLab.text = @"手机号码";
    [backView addSubview:phoneLab];
    self.phone = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-250, line2.bottom+5, 230, 30)];
    self.phone.textColor = [UIColor lightGrayColor];
    [backView addSubview:_phone];
    _phone.textAlignment =NSTextAlignmentRight;
    ///////////////////////
    _name.text = @"王红";
    _phone.text = @"134*****1234";
    _ICcard.text = @"232448*********3111";
    
    //
    UIView *back2view =[UIView new];
    back2view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:back2view];
    [back2view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.top.mas_equalTo(backView.mas_bottom).mas_offset(@10);
        make.height.mas_equalTo(80);
    }];
    UILabel *pwdLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 120, 30)];
    pwdLab.text = @"设置交易密码";
    [back2view addSubview:pwdLab];
    self.pwd = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH-250, 5, 230, 30)];
    _pwd.textAlignment = NSTextAlignmentRight;
    _pwd.placeholder = @"至少六位数字和字母组合";
    [back2view addSubview:_pwd];
    UIView *lineTwo1 = [[UIView alloc] initWithFrame:CGRectMake(20, pwdLab.bottom+5, WIDTH-40, 1)];
    lineTwo1.backgroundColor = LINECOLOR;
    [back2view addSubview:lineTwo1];
    UILabel *pwdAgainLab = [[UILabel alloc] initWithFrame:CGRectMake(20, lineTwo1.bottom+5, 100, 30)];
    pwdAgainLab.text = @"确认密码";
    [back2view addSubview:pwdAgainLab];
    self.pwdAgain = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH-250, lineTwo1.bottom+5, 230, 30)];
    self.pwdAgain.textColor = [UIColor lightGrayColor];
    [back2view addSubview:_pwdAgain];
    _pwdAgain.placeholder = @"请再次确认";
    _pwdAgain.textAlignment = NSTextAlignmentRight;
    
    ///
    UIView *back3View = [UIView new];
    back3View.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:back3View];
    [back3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.top.mas_equalTo(back2view.mas_bottom).mas_offset(@10);
        make.height.mas_equalTo(@40);
    }];
    UILabel *codeLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 30)];
    codeLab.text = @"短信验证";
    [back3View addSubview:codeLab];
    self.code = [[UITextField alloc] initWithFrame:CGRectMake(120, 5, 150, 30)];
    _code.placeholder = @"请输入验证码";
    [back3View addSubview:_code];
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    codeBtn.frame = CGRectMake(WIDTH-120, 5, 100, 30);
    [codeBtn setTitle:@"发送验证码" forState:(UIControlStateNormal)];
    [codeBtn setBackgroundColor:NAVCOLOR];
    codeBtn.layer.cornerRadius = 10;
    codeBtn.layer.masksToBounds = YES;
    [codeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [codeBtn addTarget:self action:@selector(codeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [back3View addSubview:codeBtn];
    
    //
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:agreeBtn];
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.right.mas_offset(@-20);
        make.height.mas_equalTo(@40);
        make.top.mas_equalTo(back3View.mas_bottom).mas_offset(@30);
    }];
    [agreeBtn setTitle:@"已阅读并同意协议" forState:(UIControlStateNormal)];
    [agreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [agreeBtn setBackgroundColor:NAVCOLOR];
    [agreeBtn addTarget:self action:@selector(agree:) forControlEvents:(UIControlEventTouchUpInside)];
    agreeBtn.layer.cornerRadius = 10;
    agreeBtn.layer.masksToBounds = YES;
    
    //
    UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [self btnWithFrame:CGRectMake(20, agreeBtn.bottom, 20, 20) title:@"" color:nil image:@"选中" size:1 action:nil];
    [checkBtn setImage:[UIImage imageNamed:@"选中"] forState:(UIControlStateNormal)];
    [self.view addSubview:checkBtn];
    [checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.top.mas_equalTo(agreeBtn.mas_bottom).mas_offset(@25);
        make.width.mas_equalTo(@20);
        make.height.mas_equalTo(@20);
    }];
    
    NSString *linkStr = @"http://www.baidu.com";
    NSDictionary *dict = @{NSLinkAttributeName:[NSURL URLWithString:linkStr]};
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"已阅读并同意《誉霖贷服务条款》"];
    [attribute addAttributes:dict range:NSMakeRange(6, 9)];
    UITextView *textView = [UITextView new];
    [self.view addSubview:textView];
    textView.backgroundColor = LINECOLOR;
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(checkBtn.mas_right).mas_offset(@10);
        make.top.mas_equalTo(agreeBtn.mas_bottom).mas_offset(@20);
        make.right.mas_offset(@-20);
        make.height.mas_equalTo(@30);
    }];
//    [[UITextView alloc] initWithFrame:CGRectMake(60, _rePwdTF.frame.origin.y+75, 200, 25)];
    textView.attributedText = attribute;
    
}
#pragma mark 获取验证码
-(void)codeAction:(UIButton *)btn{
    
}
#pragma mark 同意开通点击
-(void)agree:(UIButton*)btn{
    [self showMessage];
}

-(void)showMessage{
    self.bacView = [[UIView alloc] initWithFrame:self.view.bounds];
    _bacView.backgroundColor = [UIColor colorWithRed:62/255.0 green:62/255.0 blue:62/255.0 alpha:0.5];
    [[[UIApplication sharedApplication] keyWindow]addSubview:_bacView];
    
    UIButton *sure = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bacView addSubview:sure];
    sure.frame = CGRectMake(40, HEIGHT/4, WIDTH-80, HEIGHT/3);
    [sure setImage:[UIImage imageNamed:@"开通成功-icon"] forState:(UIControlStateNormal)];
    [sure addTarget:self action:@selector(sure:) forControlEvents:(UIControlEventTouchUpInside)];
    sure.adjustsImageWhenHighlighted = NO;
    
}
#pragma mark 确定点击
-(void)sure:(UIButton *)btn{
    [self.bacView removeFromSuperview];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
