//
//  SetPayPWDViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "SetPayPWDViewController.h"

@interface SetPayPWDViewController ()

@property(nonatomic,strong)UITextField *payPWDTF;
@property(nonatomic,strong)UITextField *repayPWDTF;
@property(nonatomic,strong)UITextField *verCodeTF;
@property(nonatomic,strong)UIButton *verBtn;

@end

@implementation SetPayPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"支付密码";
    self.view.backgroundColor=[UIColor whiteColor];
    [self leftItem];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 80, WIDTH-60, 30)];
    label.text=@"请您设置支付密码";
    label.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    _payPWDTF=[self setTFWithFrame:CGRectMake(30, 130, WIDTH-160, 30) placeholder:@"请输入支付密码"];
    [self.view addSubview:_payPWDTF];
    _repayPWDTF=[self setTFWithFrame:CGRectMake(30, 130+60, WIDTH-60, 30) placeholder:@"请确认支付密码"];
    [self.view addSubview:_repayPWDTF];
    _verBtn=[self btnWithFrame:CGRectMake(WIDTH-150, 135+60*2, 110, 20) title:@"获取验证码" color:NAVCOLOR image:@"" size:14 action:@selector(verBtnClick:)];
    [self.view addSubview:_verBtn];
    
    UILabel *pLab=[[UILabel alloc]initWithFrame:CGRectMake(30, 130+60*2, WIDTH-200, 30)];
    pLab.text=@"手机号 188****8888";
    pLab.font=[UIFont systemFontOfSize:14];
    pLab.textColor=[UIColor lightGrayColor];
    [self.view addSubview:pLab];
    
    _verCodeTF=[self setTFWithFrame:CGRectMake(30, 130+60*3, WIDTH-60, 30) placeholder:@"请输入您获取的手机验证码"];
    [self.view addSubview:_verCodeTF];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(30, 130+60*4.5, WIDTH-60, 40);
    button.layer.borderColor=[UIColor lightGrayColor].CGColor;
    button.layer.borderWidth=1;
    button.layer.cornerRadius=20;
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)buttonClick{
    
}

-(void)verBtnClick:(UIButton *)button{
    
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
    tf.font=[UIFont systemFontOfSize:14];
    [self lineWithTF:tf];
    return tf;
}

-(void)lineWithTF:(UITextField*)tf{
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(20, tf.frame.origin.y+30, WIDTH-40, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
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
