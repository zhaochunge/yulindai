//
//  ReviewPwdViewController.m
//  Yulindai
//
//  Created by zcg on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ReviewPwdViewController.h"
#import "ReviewPwdSuccessVC.h"

@interface ReviewPwdViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *PwdField;
@property(nonatomic,strong)UITextField *PwdAgain;
@property(nonatomic,strong)UIButton *sureBtn;
@end

@implementation ReviewPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view .backgroundColor = [UIColor whiteColor];
    [self initView];
    self.navLab.text = @"重置登录密码";
    [self setBackBtn];
}
-(void)initView{
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"请您重新设置新密码";
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@30);
        make.top.mas_equalTo(SafeAreaTopHeight+30);
        make.right.mas_equalTo(@-30);
        make.height.mas_equalTo(@30);
    }];
    self.PwdField = [UITextField new];
    [self.view addSubview:_PwdField];
//    _PwdField.placeholder = @"请输入新登录密码(6-16位数字,字母组合)";
    _PwdField.adjustsFontSizeToFitWidth = YES;
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入新登录密码(6-16位数字,字母组合)" attributes:
                                      @{NSForegroundColorAttributeName:NAVCOLOR,
                                        NSFontAttributeName:_PwdField.font
                                        }];
    _PwdField.attributedPlaceholder = attrString;
    _PwdField.textColor = NAVCOLOR;
    _PwdField.delegate = self;
    [_PwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLab.mas_left);
        make.height.mas_equalTo(@30);
    make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(@15);
        make.right.mas_offset(@-30);

    }];
    UIView *line1 = [UIView new];
    line1.backgroundColor = NAVCOLOR;
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLab.mas_left);
        make.height.mas_equalTo(@1);
        make.right.mas_offset(@-30);
    make.top.mas_equalTo(_PwdField.mas_bottom).mas_offset(@10);
    }];
    
    self.PwdAgain = [UITextField new];
    [self.view addSubview:_PwdAgain];
    _PwdAgain.placeholder = @"请再次输入密码";
    _PwdAgain.adjustsFontSizeToFitWidth = YES;
    _PwdAgain.delegate = self;
    [_PwdAgain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLab.mas_left);
        make.height.mas_equalTo(@30);
    make.top.mas_equalTo(line1.mas_bottom).mas_offset(@20);
        make.right.mas_offset(@-30);
        
    }];
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLab.mas_left);
        make.height.mas_equalTo(@1);
        make.right.mas_offset(@-30);
    make.top.mas_equalTo(_PwdAgain.mas_bottom).mas_offset(@10);
    }];
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [ self.sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.view addSubview:_sureBtn];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 20;
    self.sureBtn.layer.borderWidth = 1;
    self.sureBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_sureBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@30);
    make.top.mas_equalTo(line2.mas_bottom).mas_offset(@50);
        make.height.mas_equalTo(@40);
        make.right.mas_equalTo(@-30);
    }];
    [self.sureBtn addTarget:self action:@selector(makeSure:) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn.userInteractionEnabled=NO;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _PwdField) {
        [_PwdField resignFirstResponder];

    }else{
        [_PwdAgain resignFirstResponder];
    }

    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.PwdField.text.length>0 && self.PwdAgain.text.length>0) {
        [_sureBtn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
        self.sureBtn.userInteractionEnabled=YES;
    }else{
        [_sureBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        self.sureBtn.userInteractionEnabled=NO;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_PwdAgain resignFirstResponder];
    [_PwdField resignFirstResponder];
}
#pragma mark 确定点击
-(void)makeSure:(UIButton *)btn{
    if ([self.PwdField.text isEqualToString:self.PwdAgain.text]) {
        [self getData];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"两次输入密码不一致" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert show];
        [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:1.0];
    }
    
    

}
#pragma mark 跳转
-(void)push{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        ReviewPwdSuccessVC *vc = [ReviewPwdSuccessVC new];
        [self presentViewController:vc animated:YES completion:^{
            
        }];
        
        
    });
    
}
-(void)getData{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:nil status:@"密码重置中"];
    NSString *url = [NSString stringWithFormat:@"%@act=save_reset_pwd",BASE_URL];
    NSString *phoneBase= [Base64Verb JiaMiBase64:self.phoneStr];
    NSString *codeBase= [Base64Verb JiaMiBase64:self.codeStr];
    NSString *pwdBase= [Base64Verb JiaMiBase64:self.PwdField.text];
    NSString *reviewPwdBase= [Base64Verb JiaMiBase64:self.PwdAgain.text];
    NSDictionary *dic = @{@"mobile" : phoneBase,@"mobile_code":codeBase,@"user_pwd":pwdBase,@"user_pwd_confirm":reviewPwdBase};
    [NetTools post:url parameters:dic success:^(id responseObject) {
        
        NSDictionary *dic = [Base64Verb JieMiBase64:responseObject];
        if ([dic[@"response_code"] isEqualToString:@"1"]) {
            [MMProgressHUD dismiss];
            [self push];
        }else{
//            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:nil message:@"密码更新失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
//            [alert show];
//            [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:1.0];
            [MMProgressHUD dismissWithError:@"密码更新失败"];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [MMProgressHUD dismissWithError:@"密码更新失败"];
    }];
    
}
- (void)dismissAlert:(UIAlertView*)alert {
    if ( alert.visible ) {
        [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
    }
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
