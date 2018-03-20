//
//  ForgetPwdViewController.m
//  Yulindai
//
//  Created by zcg on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ForgetPwdViewController.h"
#import "ReviewPwdViewController.h"

@interface ForgetPwdViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *phoneField;
@property(nonatomic,strong)UITextField *codeField;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UIButton *codeBtn;
@end

@implementation ForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    self.navLab.text = @"找回密码";
    [self setBackBtn];

}

-(void)createView{
    self.phoneField = [UITextField new];
    [self.view addSubview:_phoneField];
    //    _PwdField.placeholder = @"请输入新登录密码(6-16位数字,字母组合)";
    _phoneField.adjustsFontSizeToFitWidth = YES;
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:
                                      @{NSForegroundColorAttributeName:NAVCOLOR,
                                        NSFontAttributeName:_phoneField.font
                                        }];
    _phoneField.attributedPlaceholder = attrString;
    _phoneField.textColor = NAVCOLOR;
    _phoneField.delegate = self;
    [_phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@30);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(SafeAreaTopHeight+30);
        make.right.mas_offset(@-30);
        
    }];
    UIView *line1 = [UIView new];
    line1.backgroundColor = NAVCOLOR;
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_phoneField.mas_left);
        make.height.mas_equalTo(@1);
        make.right.mas_offset(@-30);
        make.top.mas_equalTo(_phoneField.mas_bottom).mas_offset(@10);
    }];
    
    self.codeField = [UITextField new];
    [self.view addSubview:_codeField];
    _codeField.placeholder = @"请输入验证码";
    _codeField.adjustsFontSizeToFitWidth = YES;
    _codeField.delegate = self;
    [_codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_phoneField.mas_left);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(line1.mas_bottom).mas_offset(@20);
        make.right.mas_offset(@-130);
        
    }];
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [self.view addSubview:_codeBtn];
    [_codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-30);
        make.width.mas_equalTo(@100);
    make.top.mas_equalTo(line1.mas_bottom).mas_offset(@20);
        make.height.mas_equalTo(@30);
    }];
    [_codeBtn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
    [_codeBtn addTarget:self action:@selector(CodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_phoneField.mas_left);
        make.height.mas_equalTo(@1);
        make.right.mas_offset(@-30);
        make.top.mas_equalTo(_codeField.mas_bottom).mas_offset(@10);
    }];
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [ self.sureBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:_sureBtn];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 20;
    self.sureBtn.layer.borderWidth = 1;
    self.sureBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_sureBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@30);
        make.top.mas_equalTo(line2.mas_bottom).mas_offset(@40);
        make.height.mas_equalTo(@40);
        make.right.mas_equalTo(@-30);
    }];
    [self.sureBtn addTarget:self action:@selector(makeSure:) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn.userInteractionEnabled=NO;
}
#pragma mark 回收键盘
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.phoneField.text.length>0 && self.codeField.text.length>0) {
        [_sureBtn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
        self.sureBtn.userInteractionEnabled=YES;
    }else{
        [_sureBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        self.sureBtn.userInteractionEnabled=NO;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _phoneField) {
        [_phoneField resignFirstResponder];
    }else{
        [_codeField resignFirstResponder];
    }
    
    return YES;
}
#pragma mark 获取验证码
-(void)CodeAction:(UIButton *)btn{
    [self openCountdown];
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
                [self.codeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.codeBtn setTitleColor:NAVCOLOR forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.codeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.codeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark 下一步
-(void)makeSure:(UIButton *)btn{
    ReviewPwdViewController *vc = [ReviewPwdViewController new];
    [self presentModalViewController:vc animated:YES]; 
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
