//
//  EmailViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@property(nonatomic,strong)UITextField *emailTF;
@property(nonatomic,strong)UITextField *emailCodeTF;
@property(nonatomic,strong)UIButton *verBtn;

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"绑定邮箱";
    self.view.backgroundColor=[UIColor whiteColor];
    [self leftItem];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 80, WIDTH-60, 30)];
    label.text=@"请您绑定邮箱";
    label.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    _emailTF=[self setTFWithFrame:CGRectMake(30, 130, WIDTH-160, 30) placeholder:@"请输入邮箱号码"];
    [self.view addSubview:_emailTF];
    
    _verBtn=[self btnWithFrame:CGRectMake(WIDTH-150, 135, 110, 20) title:@"获取验证码" color:NAVCOLOR image:@"" size:14 action:@selector(verBtnClick:)];
    [self.view addSubview:_verBtn];
    
    _emailCodeTF=[self setTFWithFrame:CGRectMake(30, 130+70, WIDTH-60, 30) placeholder:@"请输入邮箱验证码"];
    [self.view addSubview:_emailCodeTF];
    
    UILabel *tipLab=[[UILabel alloc]initWithFrame:CGRectMake(30, 240, WIDTH-60, 20)];
    tipLab.text=@"*请登录邮箱获取验证码";
    tipLab.font=[UIFont systemFontOfSize:12];
    tipLab.textColor=NAVCOLOR;
    [self.view addSubview:tipLab];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(30, 280, WIDTH-60, 40);
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

#pragma mark 获取验证码
-(void)verBtnClick:(UIButton *)button{
    NSLog(@"获取验证码");
    [self getData];
    [self openCountdown];
}

-(void)getData{
    NSLog(@"getData");
}

// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [_verBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [_verBtn setTitleColor:NAVCOLOR forState:UIControlStateNormal];
                _verBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [_verBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [_verBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                _verBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
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
