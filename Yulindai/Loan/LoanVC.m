//
//  LoanVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "LoanVC.h"

@interface LoanVC ()

@property(nonatomic,strong)NSArray *cateArray;
@property(nonatomic,strong)UITextView *textView;

@end

@implementation LoanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"借款";
    _cateArray=@[@"借款标题",@"借款用途",@"有无抵押",@"贷款金额",@"还款周期",@"还款期限",@"年利率",@"还款方式",@"担保机构",@"筹标期限",@"每月还本息",@"每月交借款管理费"];
    
    [self createUI];
    
}

-(void)sanjiaoBtnClick:(UIButton *)button{
    NSLog(@"sanjiao");
}

-(void)createUI{
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-50)];
    scrollView.contentSize=CGSizeMake(WIDTH, 1350);
    scrollView.scrollEnabled=YES;
    scrollView.userInteractionEnabled=YES;
    scrollView.bounces=YES;//*****
    scrollView.alwaysBounceVertical = YES;//****
    [self.view addSubview:scrollView];
    
    CGFloat wid=100;
    for (int i=0; i<12; i++) {
        UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(10, 60+60*i, WIDTH-20, 1)];
        line.backgroundColor=[UIColor lightGrayColor];
        [scrollView addSubview:line];
        if (i==11) {
            wid=120;
        }
        UILabel *cateLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 15+60*i, wid, 30)];
        cateLab.text=_cateArray[i];
        cateLab.font=[UIFont systemFontOfSize:15];
        [scrollView addSubview:cateLab];
        
    }
    
    UIButton *yongtuBtn=[self setupButtonWithY:15+60 title:@"短期周转" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:yongtuBtn];

    UIButton *diyaBtn=[self setupButtonWithY:15+60*2 title:@"无" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:diyaBtn];
    
    //贷款金额
    UILabel *jineLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 15+60*3, WIDTH-110, 30)];
    jineLab.text=[NSString stringWithFormat:@"%@",@"     元"];
    jineLab.textColor=[UIColor darkGrayColor];
    [scrollView addSubview:jineLab];
    
    UIButton *zhouqiBtn=[self setupButtonWithY:15+60*4 title:@"按月还款" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:zhouqiBtn];
    
    UIButton *qixianBtn=[self setupButtonWithY:15+60*5 title:@"3个月" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:qixianBtn];
    
    //年利率
    UILabel *lilvLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 15+60*6, WIDTH-110, 30)];
    lilvLab.text=[NSString stringWithFormat:@"%@",@"     %"];
    lilvLab.textColor=[UIColor darkGrayColor];
    [scrollView addSubview:lilvLab];
    
    UIButton *fangshiBtn=[self setupButtonWithY:15+60*7 title:@"等额本息" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:fangshiBtn];
    
    UIButton *danbaoBtn=[self setupButtonWithY:15+60*8 title:@"不邀约" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:danbaoBtn];
    
    UIButton *choubiaoBtn=[self setupButtonWithY:15+60*9 title:@"    天" SEL:@selector(sanjiaoBtnClick:)];
    [scrollView addSubview:choubiaoBtn];
    
    UILabel *benxiLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 15+60*10, WIDTH-110, 30)];
    benxiLab.text=@"￥0.00";
    benxiLab.textColor=[UIColor redColor];
    [scrollView addSubview:benxiLab];
    
    UILabel *feiLab=[[UILabel alloc]initWithFrame:CGRectMake(130, 15+60*11, WIDTH-140, 30)];
    feiLab.text=@"￥0.00";
    feiLab.textColor=[UIColor redColor];
    [scrollView addSubview:feiLab];
    
    UILabel *label=[self setupLabelWithY:60*12+10 title:@"成交服务费由誉霖贷平台收取，您当前等级："];
    [scrollView addSubview:label];

    UIView *deView=[[UIView alloc]initWithFrame:CGRectMake(10, label.frame.origin.y+35, WIDTH-20, 90)];
    deView.backgroundColor=[UIColor colorWithRed:247/255.0 green:251/255.0 blue:252/155.0 alpha:1];
    [scrollView addSubview:deView];
    
    NSArray *tArray=@[@"信用等级",@"服务费率",@"服务费"];
    NSArray *imgArray=@[@"HR",@"E",@"D",@"C",@"B",@"A",@"AA"];
    NSArray *lvArray=@[@"5.0%",@"3.0%",@"2.5%",@"2.0%",@"1.5%",@"1.0%",@"0.0%"];
    for (int i=0; i<4; i++) {
        UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, 30*i, WIDTH-20, 0.5)];
        line.backgroundColor=[UIColor lightGrayColor];
        [deView addSubview:line];
        if (i<3) {
            UILabel *tLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 5+30*i, 60, 20)];
            tLab.text=tArray[i];
            tLab.font=[UIFont systemFontOfSize:13];
            [deView addSubview:tLab];
            if (i==0) {
                for (int j=0; j<7; j++) {
                    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(70+(WIDTH-90)/7.0*j, 5, 20, 20)];
                    imageView.image=[UIImage imageNamed:imgArray[j]];
                    [deView addSubview:imageView];
                }
            }
            if (i==1) {
                for (int j=0; j<7; j++) {
                    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(70+(WIDTH-90)/7.0*j, 5+30*i, 30, 20)];
                    lab.adjustsFontSizeToFitWidth = YES;
                    lab.text=lvArray[j];
                    [deView addSubview:lab];
                }
            }
        }
    }
    UILabel *desLab=[self setupLabelWithY:deView.frame.origin.y+100 title:@"借款描述"];
    [scrollView addSubview:desLab];
    
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(10, desLab.frame.origin.y+30, WIDTH-20, 80)];
    _textView.layer.borderWidth=0.8;
    _textView.layer.borderColor=[UIColor darkGrayColor].CGColor;
    [scrollView addSubview:_textView];
    
    UILabel *showLab=[self setupLabelWithY:_textView.frame.origin.y+90 title:@"展示资料"];
    [scrollView addSubview:showLab];
    UILabel *nameLab=[self setupLabelWithY:showLab.frame.origin.y+40 title:@"名称"];
    [scrollView addSubview:nameLab];
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(10, nameLab.frame.origin.y+40, WIDTH-20, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [scrollView addSubview:line];
    UILabel *cPicLab=[self setupLabelWithY:nameLab.frame.origin.y+50 title:@"选择图片"];
    [scrollView addSubview:cPicLab];
    
    CGFloat btnWid=WIDTH/3.0;
    for (int i=0; i<3; i++) {
        UIButton *picBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        picBtn.frame=CGRectMake(20+btnWid*i, cPicLab.frame.origin.y+40, btnWid-40, btnWid-40);
        picBtn.layer.borderWidth=1;
        picBtn.layer.borderColor=NAVCOLOR.CGColor;
//        picBtn.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        [picBtn addTarget:self action:@selector(picBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:picBtn];
    }
    UIButton *subBtn=[self setupButtonWithY:cPicLab.frame.origin.y+40+btnWid+20 title:@"提交审核"];
    [scrollView addSubview:subBtn];
    UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBtn.frame=CGRectMake(10, subBtn.frame.origin.y+60, 20, 20);
    [checkBtn setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    [scrollView addSubview:checkBtn];
    NSString *linkStr = @"http://www.baidu.com";
    NSDictionary *dict = @{NSLinkAttributeName:[NSURL URLWithString:linkStr]};
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"我同意誉霖贷《借款协议》"];
    [attribute addAttributes:dict range:NSMakeRange(6, 6)];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(30, subBtn.frame.origin.y+55, 200, 25)];
    textView.attributedText = attribute;
    [scrollView addSubview:textView];
    textView.editable = NO;
    
    
}

-(void)picBtnClick:(UIButton *)button{
    NSLog(@"点我啦点我啦");
}

-(void)subBtnClick{
    NSLog(@"sub");
}

-(UILabel *)setupLabelWithY:(CGFloat)y title:(NSString *)title{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, y, WIDTH-20, 30)];
    label.text=title;
    label.font=[UIFont systemFontOfSize:15];
    return label;
}

-(UIButton *)setupButtonWithY:(CGFloat)y title:(NSString *)title{
    UIButton *subBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    subBtn.frame=CGRectMake(40, y, WIDTH-80, 40);
    subBtn.backgroundColor=[UIColor orangeColor];
    [subBtn setTitle:title forState:UIControlStateNormal];
    [subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    subBtn.layer.cornerRadius=20;
    [subBtn addTarget:self action:@selector(subBtnClick) forControlEvents:UIControlEventTouchUpInside];
    return subBtn;
}

-(UIButton *)setupButtonWithY:(CGFloat)y title:(NSString *)title SEL:(SEL)sel{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(100, y, WIDTH-110, 30);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-135, 10, 16, 16)];
    imgView.image=[UIImage imageNamed:@"三角"];
    [button addSubview:imgView];
    return button;
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
