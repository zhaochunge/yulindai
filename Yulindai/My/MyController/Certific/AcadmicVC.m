//
//  AcadmicVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "AcadmicVC.h"

@interface AcadmicVC ()<UITextFieldDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)LTView *nameView;
@property(nonatomic,strong)LTView *cardNum;
@property(nonatomic,strong)LLBView *yearView;
@property(nonatomic,strong)LLBView *cityView;
@property(nonatomic,strong)LLBView *loanView;
@property(nonatomic,strong)UIButton *btnImg1;
@property(nonatomic,strong)UIButton *btnImg2;
@property(nonatomic,assign)int selectPic;

@end

@implementation AcadmicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    _selectPic = 0;
    self.navigationItem.title = @"学历认证";
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight);
    self.scrollView.userInteractionEnabled = YES;
    [self.view addSubview:_scrollView];
    //认证
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    NSString *discribStr = @"您上传的身份证扫描件需和您绑定的身份证一致,否则将无法通过认证.";
    CGSize size=[discribStr boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    CGFloat top = 10;
    CGFloat height =size.height+36;
    [cerTools title:@"学历认证" font:17 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:YES];
    //验证码
    top = height+top+10;
    self.nameView = [[LTView alloc] initWithFrame:CGRectMake(20 ,top,WIDTH-40,50)];
    self.nameView.titleLab.text = @"验证码";
    self.nameView.textField.delegate = self;
    [self.scrollView addSubview:self.nameView];
    //最高学历
    top = top+60;
    self.yearView = [[LLBView alloc] initWithFrame:CGRectMake(20, top, WIDTH-40, 50)];
    _yearView.titleLab.text = @"最高学历";
    [self.scrollView addSubview:self.yearView];
    //毕业院校
    top = top +60;
    self.cardNum = [[LTView alloc] initWithFrame:CGRectMake(20 ,top,WIDTH-40,50)];
    self.cardNum.titleLab.text = @"毕业院校";
    self.cardNum.textField.delegate = self;
    [self.scrollView addSubview:self.cardNum];
    //入学年份
    top = top+60;
    self.loanView = [[LLBView alloc] initWithFrame:CGRectMake(20, top, WIDTH-40, 50)];
    _loanView.titleLab.text = @"入学年份";
    [_scrollView addSubview:_loanView];

    //线
    top = top+49;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, top, WIDTH, 10)];
    line.backgroundColor = LINECOLOR;
    [_scrollView addSubview:line];
    //说明
    top = top+20;
    NSDictionary *dict2 = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    NSString *discribStr2 = @"您上传的身份证扫描件需和您绑定的身份证一致,否则将无法通过认证.";
    CGSize size2=[discribStr2 boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    height =size2.height+36;
    [cerTools title:@"认证说明:" font:15 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:NO];
    //提交
    top = top+height+50;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"提交审核" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(20, top, WIDTH-40, 40);
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.backgroundColor = NAVCOLOR;
    [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.scrollView addSubview:btn];
    
    _scrollView.contentSize = CGSizeMake(WIDTH,top+50+SafeAreaTopHeight);
}
#pragma mark 提交审核
-(void)action:(UIButton *)btn{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
