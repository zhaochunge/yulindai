//
//  ZhuCeViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/19.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "RegisterSuccessViewController.h"

@interface ZhuCeViewController ()<UITextFieldDelegate,UIActionSheetDelegate>

@property(nonatomic,strong)UITextField *accountTF;
@property(nonatomic,strong)UITextField *mobileTF;
@property(nonatomic,strong)UITextField *verCodeTF;
@property(nonatomic,strong)UITextField *pwdTF;
@property(nonatomic,strong)UITextField *rePwdTF;
@property(nonatomic,strong)UIButton *verBtn;
@property(nonatomic,strong)UIView *miniView;

//原型图修改
@property(nonatomic,strong)UIButton *chooseBtn;


@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];

    self.navLab.text = @"手机注册";
    [self setBackBtn];
    [self createUI];

}

-(void)createUI{
    _accountTF=[self setTFWithFrame:CGRectMake(40, SafeAreaTopHeight+20, WIDTH-80, 40) placeholder:@"  请输入用户名"];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"  请输入用户名" attributes:
                                      @{NSForegroundColorAttributeName:NAVCOLOR,
                                        NSFontAttributeName:_accountTF.font
                                        }];
    _accountTF.attributedPlaceholder = attrString;
    _accountTF.textColor = NAVCOLOR;
//    _accountTF.delegate=self;
    [self.view addSubview:_accountTF];
    _mobileTF=[self setTFWithFrame:CGRectMake(40, _accountTF.frame.origin.y+50, WIDTH-80, 40) placeholder:@"  请输入手机号"];
    _mobileTF.delegate=self;
    [self.view addSubview:_mobileTF];
    _verCodeTF=[self setTFWithFrame:CGRectMake(40, _mobileTF.frame.origin.y+50, WIDTH-200, 40) placeholder:@"  请输入验证码"];
    _verCodeTF.delegate=self;
    [self.view addSubview:_verCodeTF];
    _pwdTF=[self setTFWithFrame:CGRectMake(40, _verCodeTF.frame.origin.y+50, WIDTH-80, 40) placeholder:@"  请输入登录密码"];
    _pwdTF.delegate=self;
    [self.view addSubview:_pwdTF];
    _rePwdTF=[self setTFWithFrame:CGRectMake(40, _pwdTF.frame.origin.y+50, WIDTH-80, 40) placeholder:@"  请确认登录密码"];
    _rePwdTF.delegate=self;
    [self.view addSubview:_rePwdTF];
    
    _verBtn=[self btnWithFrame:CGRectMake(WIDTH-150, _verCodeTF.frame.origin.y+10, 110, 20) title:@"获取验证码" color:NAVCOLOR image:@"" size:14 action:@selector(verBtnClick:)];
    [self.view addSubview:_verBtn];
    
    //xiugai
    _chooseBtn=[self btnWithFrame:CGRectMake(50, _rePwdTF.frame.origin.y+50, WIDTH-80, 40) title:@"出借人" color:[UIColor lightGrayColor] image:@"" size:14 action:@selector(chooseBtnClick:)];
    _chooseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_chooseBtn setImage:[UIImage imageNamed:@"三角"] forState:UIControlStateNormal];
    [_chooseBtn setImageEdgeInsets:UIEdgeInsetsMake(0, WIDTH-110, 0, 0)];
    [self.view addSubview:_chooseBtn];
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(40,_rePwdTF.frame.origin.y+90, WIDTH-80, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
    
    UIButton *checkBtn=[self btnWithFrame:CGRectMake(40, _chooseBtn.frame.origin.y+80, 20, 20) title:@"" color:nil image:@"选中" size:1 action:nil];
    [self.view addSubview:checkBtn];
    
    NSString *linkStr = @"http://www.baidu.com";
    NSDictionary *dict = @{NSLinkAttributeName:[NSURL URLWithString:linkStr]};
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"已阅读并同意《誉霖贷服务条款》"];
    [attribute addAttributes:dict range:NSMakeRange(6, 9)];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(60, _chooseBtn.frame.origin.y+75, 200, 25)];
    textView.attributedText = attribute;
    [self.view addSubview:textView];
    textView.editable = NO;
    
    UIButton *nextBtn=[self btnWithFrame:CGRectMake(40, checkBtn.frame.origin.y+40, WIDTH-80, 40) title:@"下一步" color:[UIColor darkGrayColor] image:@"" size:16 action:@selector(nextBtnClick)];
    nextBtn.layer.borderColor=[UIColor darkGrayColor].CGColor;
    nextBtn.layer.borderWidth=1;
    [self.view addSubview:nextBtn];
    
    
}

-(void)chooseBtnClick:(UIButton *)button{
    UIActionSheet * sh = [[UIActionSheet alloc]initWithTitle:@"请选择您的身份" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"借款人",@"出借人", nil];
    [sh showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"点击按钮下标:%ld",buttonIndex);
    if (buttonIndex==0) {
        [_chooseBtn setTitle:@"借款人" forState:UIControlStateNormal];
    }else{
        [_chooseBtn setTitle:@"出借人" forState:UIControlStateNormal];
    }
    
}

-(void)nextBtnClick{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleExpand];
    [MMProgressHUD showDeterminateProgressWithTitle:nil status:nil];
    NSString *url=[NSString stringWithFormat:@"%@%@",BASE_URL,@"act=register"];
    NSLog(@"URL:%@",url);
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"user_name=%@&user_pwd=%@&user_pwd_confirm=%@&mobile=%@&mobile_code=%@&type=JSON",[NSString stringWithFormat:@"%@",_accountTF.text],[NSString stringWithFormat:@"%@",_pwdTF.text],[NSString stringWithFormat:@"%@",_rePwdTF.text],[NSString stringWithFormat:@"%@",_mobileTF.text],[NSString stringWithFormat:@"%@",_verCodeTF.text]] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data64=[GTMBase64 decodeData:data];
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data64 options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@",dict);
        
        if ([dict[@"response_code"] intValue]==1) {
            [MMProgressHUD dismissWithSuccess:dict[@"show_err"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                RegisterSuccessViewController *vc = [RegisterSuccessViewController new];
                [self presentViewController:vc animated:YES completion:^{
                    
                }];
                
            });
            
           
        }else{
            [MMProgressHUD dismissWithError:dict[@"show_err"]];
        }
        
    }];
    [dataTask resume];
    
}

#pragma mark 获取验证码
-(void)verBtnClick:(UIButton *)button{
    NSLog(@"获取验证码");
    [self getData];
    [self openCountdown];
}
-(void)getData{
    
    NSString *url=[NSString stringWithFormat:@"%@%@",BASE_URL,@"act=send_register_code"];
    
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"mobile=%@&type=JSON",[NSString stringWithFormat:@"%@",_mobileTF.text]] dataUsingEncoding:NSUTF8StringEncoding];//_verCodeTF.text
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data64=[GTMBase64 decodeData:data];
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data64 options:NSJSONReadingMutableContainers error:nil];

        dispatch_sync(dispatch_get_main_queue(), ^(){
           
            [self createminiViewWithTitle:dict[@"show_err"]];
            
            [UIView animateWithDuration:2 animations:^{
                _miniView.alpha = 0.5;
            } completion:^(BOOL finished) {
                [_miniView removeFromSuperview];
            }];
            
        });
        
    }];
    [dataTask resume];
    
}

-(void)createminiViewWithTitle:(NSString *)title{
    
    _miniView=[[UIView alloc]initWithFrame:CGRectMake((WIDTH/2.0-75), 150, 150, 30)];
    _miniView.backgroundColor=[UIColor blackColor];
    _miniView.layer.cornerRadius=5;
    [self.view addSubview:_miniView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    label.text=title;
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:13];
    label.textAlignment=NSTextAlignmentCenter;
    [_miniView addSubview:label];
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
//    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
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
