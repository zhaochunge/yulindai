//
//  ResetPWDViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ResetPWDViewController.h"

@interface ResetPWDViewController ()

@property(nonatomic,strong)UITextField *oldPwdTF;
@property(nonatomic,strong)UITextField *NewPwdTF;
@property(nonatomic,strong)UITextField *renewPwdTF;

@end

@implementation ResetPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"重置登录密码";
    self.view.backgroundColor=[UIColor whiteColor];
    [self leftItem];
    [self setupUI];
    
}

-(void)setupUI{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 80, WIDTH-60, 30)];
    label.text=@"请您重新设置密码";
    label.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    _oldPwdTF=[self setTFWithFrame:CGRectMake(30, 130, WIDTH-60, 30) placeholder:@"请输入旧登录密码"];
    [self.view addSubview:_oldPwdTF];
    
    _NewPwdTF=[self setTFWithFrame:CGRectMake(30, 130+50, WIDTH-60, 30) placeholder:@"请输入新登录密码（6-16位数字,字母组合）"];
    [self.view addSubview:_NewPwdTF];
    
    _renewPwdTF=[self setTFWithFrame:CGRectMake(30, 130+50*2, WIDTH-60, 30) placeholder:@"请确认登录密码"];
    [self.view addSubview:_renewPwdTF];
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(30, 130+50*4, WIDTH-60, 40);
    button.layer.borderColor=[UIColor lightGrayColor].CGColor;
    button.layer.borderWidth=1;
    button.layer.cornerRadius=20;
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)buttonClick{
    
    NSLog(@"确认");
    
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
