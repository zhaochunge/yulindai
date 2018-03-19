//
//  ZhuCeViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "RegisterSuccessViewController.h"

@interface ZhuCeViewController ()

@property(nonatomic,strong)UITextField *accountTF;
@property(nonatomic,strong)UITextField *telephoneTF;
@property(nonatomic,strong)UITextField *verCodeTF;
@property(nonatomic,strong)UITextField *pwdTF;
@property(nonatomic,strong)UITextField *rePwdTF;

@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];

    self.navLab.text = @"手机注册";
//    self.title=@"手机注册";
//    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    backBtn.frame=CGRectMake(0, 0, 40, 40);
////    backBtn.backgroundColor=[UIColor blueColor];
//    [backBtn setTitle:@"<" forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem=leftItem;
    [self setBackBtn];
    [self createUI];

}

-(void)createUI{
    _accountTF=[self setTFWithFrame:CGRectMake(40, 80, WIDTH-80, 40) placeholder:@"  请输入用户名"];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"  请输入用户名" attributes:
                                      @{NSForegroundColorAttributeName:NAVCOLOR,
                                        NSFontAttributeName:_accountTF.font
                                        }];
    _accountTF.attributedPlaceholder = attrString;
    _accountTF.textColor = NAVCOLOR;
    [self.view addSubview:_accountTF];
    _telephoneTF=[self setTFWithFrame:CGRectMake(40, _accountTF.frame.origin.y+50, WIDTH-80, 40) placeholder:@"  请输入手机号"];
    [self.view addSubview:_telephoneTF];
    _verCodeTF=[self setTFWithFrame:CGRectMake(40, _telephoneTF.frame.origin.y+50, WIDTH-200, 40) placeholder:@"  请输入验证码"];
    [self.view addSubview:_verCodeTF];
    _pwdTF=[self setTFWithFrame:CGRectMake(40, _verCodeTF.frame.origin.y+50, WIDTH-80, 40) placeholder:@"  请输入登录密码"];
    [self.view addSubview:_pwdTF];
    _rePwdTF=[self setTFWithFrame:CGRectMake(40, _pwdTF.frame.origin.y+50, WIDTH-80, 40) placeholder:@"  请确认登录密码"];
    [self.view addSubview:_rePwdTF];
    
    UIButton *verBtn=[self btnWithFrame:CGRectMake(WIDTH-150, _verCodeTF.frame.origin.y+10, 110, 20) title:@"获取验证码" color:NAVCOLOR image:@"" size:14 action:@selector(verBtnClick:)];
    [self.view addSubview:verBtn];
    
    UIButton *checkBtn=[self btnWithFrame:CGRectMake(40, _rePwdTF.frame.origin.y+80, 20, 20) title:@"" color:nil image:@"选中" size:1 action:nil];
    [self.view addSubview:checkBtn];
    
    NSString *linkStr = @"http://www.baidu.com";
    NSDictionary *dict = @{NSLinkAttributeName:[NSURL URLWithString:linkStr]};
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"已阅读并同意《誉霖贷服务条款》"];
    [attribute addAttributes:dict range:NSMakeRange(6, 9)];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(60, _rePwdTF.frame.origin.y+75, 200, 25)];
    textView.attributedText = attribute;
    [self.view addSubview:textView];
    textView.editable = NO;
    
    UIButton *nextBtn=[self btnWithFrame:CGRectMake(40, checkBtn.frame.origin.y+40, WIDTH-80, 40) title:@"下一步" color:[UIColor darkGrayColor] image:@"" size:16 action:@selector(nextBtnClick)];
    nextBtn.layer.borderColor=[UIColor darkGrayColor].CGColor;
    nextBtn.layer.borderWidth=1;
    [self.view addSubview:nextBtn];
    
}

-(void)nextBtnClick{
    RegisterSuccessViewController *vc = [RegisterSuccessViewController new];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

-(void)verBtnClick:(UIButton *)button{
    NSLog(@"获取验证码");
}

-(UIButton *)btnWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor*)color image:(NSString *)image size:(CGFloat)size action:(SEL)action{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:size];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius=20;
    return btn;
}

-(UITextField *)setTFWithFrame:(CGRect)frame placeholder:(NSString *)placeholder{
    
    UITextField *tf=[[UITextField alloc]initWithFrame:frame];
    [tf setBorderStyle:UITextBorderStyleNone];
    [tf setClearButtonMode:UITextFieldViewModeWhileEditing];
    tf.placeholder=placeholder;
    [tf setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_accountTF];
    [self lineWithTF:tf];
    return tf;
}

-(void)lineWithTF:(UITextField*)tf{
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(40, tf.frame.origin.y+37, WIDTH-80, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
}

-(void)backClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
