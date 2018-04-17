//
//  ResetPayPWDViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ResetPayPWDViewController.h"

@interface ResetPayPWDViewController ()

@property(nonatomic,strong)UITextField *oldPWDTF;
@property(nonatomic,strong)UITextField *NewPWDTF;
@property(nonatomic,strong)UITextField *reNewPWDTF;

@end

@implementation ResetPayPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"重置支付密码";
    self.view.backgroundColor=[UIColor whiteColor];
    [self leftItem];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 80, WIDTH-60, 30)];
    label.text=@"请您重新设置支付密码";
    label.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    _oldPWDTF=[self setTFWithFrame:CGRectMake(30, 130, WIDTH-160, 30) placeholder:@"请输入旧支付密码"];
    [self.view addSubview:_oldPWDTF];
    _NewPWDTF=[self setTFWithFrame:CGRectMake(30, 130+60, WIDTH-60, 30) placeholder:@"请输入新支付密码（6-16位数字，字母组合）"];
    [self.view addSubview:_NewPWDTF];
    _reNewPWDTF=[self setTFWithFrame:CGRectMake(30, 130+60*2, WIDTH-160, 30) placeholder:@"请确认支付密码"];
    [self.view addSubview:_reNewPWDTF];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(30, 130+60*3.5, WIDTH-60, 40);
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
