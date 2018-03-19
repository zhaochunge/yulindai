//
//  ViewController.m
//  Yulindai
//
//  Created by zcg on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ViewController.h"
#import "ZhuCeViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *accountTF;
@property(nonatomic,strong)UITextField *pwdTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createUI];
    
    
}
/**
 *登录
 */
-(void)loginBtnClick:(UIButton *)button{
    
    
    
}
/**
 *忘记密码
 */
-(void)fpwdBtnClick:(UIButton *)button{
    
    
    
}
/**
 *注册
 */
-(void)zhuceBtnClick:(UIButton *)button{
    NSLog(@"注册");
    ZhuCeViewController *zhuceVC=[[ZhuCeViewController alloc]init];
    UINavigationController *zhuceNav=[[UINavigationController alloc]initWithRootViewController:zhuceVC];
    [self presentViewController:zhuceNav animated:YES completion:nil];
    
}

-(void)createUI{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0-65,100, 130, 55)];
    imageView.image=[UIImage imageNamed:@"启动页LOGO-654s"];
    [self.view addSubview:imageView];
    
    _accountTF=[self setTFWithFrame:CGRectMake(40, HEIGHT/2.0-40, WIDTH-80, 40) image:@"登录-icon" placeholder:@"  请输入手机号或邮箱登录"];
    _accountTF.delegate=self;
    [self.view addSubview:_accountTF];
    
    _pwdTF=[self setTFWithFrame:CGRectMake(40, HEIGHT/2.0+10, WIDTH-80, 40) image:@"输入密码-icon" placeholder:@"  请输入密码"];
    _pwdTF.delegate=self;
    [self.view addSubview:_pwdTF];
    
    UIButton *loginBtn=[self btnWithFrame:CGRectMake(40, _pwdTF.frame.origin.y+60, WIDTH-80, 40) title:@"登录" color:@"" size:19];
    loginBtn.backgroundColor=[UIColor cyanColor];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *fpwdBtn=[self btnWithFrame:CGRectMake(WIDTH/2.0-80, loginBtn.frame.origin.y+50, 160, 30) title:@"忘记密码?" color:@"" size:15];
    [fpwdBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [fpwdBtn addTarget:self action:@selector(fpwdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fpwdBtn];
    
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(40, HEIGHT-50, WIDTH-80, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
    
    UIButton *zhuceBtn=[self btnWithFrame:CGRectMake(WIDTH/2.0-100, HEIGHT-45, 200, 30) title:@"没有账号?立即注册" color:@"" size:16];
    [zhuceBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [zhuceBtn addTarget:self action:@selector(zhuceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhuceBtn];
    
}

-(UIButton *)btnWithFrame:(CGRect)frame title:(NSString *)title color:(NSString *)color size:(CGFloat)size{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=frame;
//    btn.backgroundColor=[UIColor ];
    [btn setTitle:title forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:size];
    btn.layer.cornerRadius=5;
    return btn;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"Animation" context:nil];
    [UIView setAnimationDuration:0.20];
    [UIView setAnimationBeginsFromCurrentState: YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"Animation" context:nil];
    [UIView setAnimationDuration:0.20];
    [UIView setAnimationBeginsFromCurrentState: YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

-(UITextField *)setTFWithFrame:(CGRect)frame image:(NSString *)image placeholder:(NSString *)placeholder{
    
    UITextField *tf=[[UITextField alloc]initWithFrame:frame];
    [tf setBorderStyle:UITextBorderStyleNone];
    [tf setClearButtonMode:UITextFieldViewModeWhileEditing];
    tf.leftView=[self TFImageWithImage:image];
    tf.placeholder=placeholder;
    [tf setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_accountTF];
    [tf setLeftViewMode:UITextFieldViewModeAlways];
    [self lineWithTF:tf];
    return tf;
}

-(UIImageView *)TFImageWithImage:(NSString *)image{
    UIImageView *acImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    acImg.image=[UIImage
                 imageNamed:image];
    return acImg;
}

-(void)lineWithTF:(UITextField*)tf{
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(40, tf.frame.origin.y+40, WIDTH-80, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
