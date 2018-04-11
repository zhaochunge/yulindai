//
//  HomeVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/27.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "HomeVC.h"
#import "AboutMeViewController.h"
#import "AboutManageViewController.h"
#import "SafeViewController.h"
#import "NewsViewController.h"
#import "ImmediateInvestViewController.h"

@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *btnTitleArray;
@property(nonatomic,strong)NSArray *btnImageArray;
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)NSMutableArray *bannerArray;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"誉霖贷";
    _btnTitleArray=@[@"关于我们",@"关于理财",@"安全保障"];
    _btnImageArray=@[@"关于我们-icon",@"理财-icon",@"安全保障-icon"];
    self.bannerArray=[NSMutableArray array];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 15, 15);
    [leftBtn setImage:[UIImage imageNamed:@"消息_ICON"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(newsClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    [self createUI];
    
}

-(void)newsClick{
    
    NewsViewController *newsVC=[[NewsViewController alloc]init];
    [self.navigationController pushViewController:newsVC animated:YES];
    
}

- (void)timeClick{
    
//    int num=(int)_bannerArray.count;
    int num=3;
    //改变偏移量
    UIScrollView * scrollView = (UIScrollView*)[self.view viewWithTag:1000];
    //0 1 2 3 4
    static int i = 0;
    
    //切换的动画效果 滚动到某个位置的动画效果
    [scrollView scrollRectToVisible:CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT) animated:YES];
    
    if (i<=num) {
        i++;
    }else{
        i=0;
    }
}

-(void)picBtnClick:(UIButton *)button{
    NSLog(@"picBtnClick");
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"图片啊";
            
            _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
            NSInteger picNum=3;
            _scrollView.contentSize = CGSizeMake(WIDTH*3, 100);
            _scrollView.pagingEnabled = YES;
            _scrollView.tag=1000;
            _scrollView.bounces = NO;
            _scrollView.showsHorizontalScrollIndicator = NO;
            _scrollView.showsVerticalScrollIndicator = NO;
            
            for (int i=0; i<3; i++) {
                UIButton *picBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                picBtn.frame=CGRectMake(WIDTH*i, 0, WIDTH, 150);
                picBtn.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
                [picBtn addTarget:self action:@selector(picBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [_scrollView addSubview:picBtn];
            }
            
//            [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
           
            [cell addSubview:_scrollView];
            
        }else{
            
            for (int i=0;i<3; i++) {//48x48=50x50
                YXButton *button=[YXButton buttonWithType:UIButtonTypeCustom];
                button.titleLabel.adjustsFontSizeToFitWidth = YES;
                button.frame=CGRectMake(WIDTH/6.0*(2*i+1)-50, 15, 100, 80);
                [button setTitle:_btnTitleArray[i] forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:_btnImageArray[i]] forState:UIControlStateNormal];
                button.titleLabel.font=[UIFont systemFontOfSize:13];
                [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                button.tag=1000+i;
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
            }
            
        }
    }else{
        if (indexPath.row==0) {
            cell.textLabel.text=@"新人理财投资";
        }else{
            UILabel *lilvLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/3.0, 50)];
            lilvLab.text=@"5.60%";
            lilvLab.textColor=[UIColor orangeColor];
            lilvLab.font=[UIFont systemFontOfSize:28];
            lilvLab.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:lilvLab];
            
            UILabel *lab1=[self setupGuLabelWithFrame:CGRectMake(0, 50, WIDTH/3.0, 20) text:@"年化收益率"];
            [cell addSubview:lab1];
            UILabel *lab2=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0, 20, WIDTH/6.0, 20) text:@"理财期限"];
            [cell addSubview:lab2];
            UILabel *lab3=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0, 50, WIDTH/6.0, 20) text:@"起投金额"];
            [cell addSubview:lab3];
            
            UILabel *lab4=[self setupCanLabelWithFrame:CGRectMake(WIDTH/2.0, 20, WIDTH/6.0, 20) text:@"30天"];
            [cell addSubview:lab4];
            UILabel *lab5=[self setupCanLabelWithFrame:CGRectMake(WIDTH/2.0, 50, WIDTH/6.0, 20) text:@"1200元"];
            [cell addSubview:lab5];
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.titleLabel.adjustsFontSizeToFitWidth=YES;
            button.frame=CGRectMake(WIDTH/3.0*2, 30, WIDTH/4.0, 30);
            button.backgroundColor=[UIColor orangeColor];
            [button setTitle:@"立即投资" forState:UIControlStateNormal];
            button.layer.cornerRadius=15;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font=[UIFont systemFontOfSize:18];
            [button addTarget:self action:@selector(suguniButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell addSubview:button];
        }
        
    }
    
    return cell;
}

-(void)suguniButtonClick:(UIButton *)button{
    NSLog(@"suguniButtonClick");
    ImmediateInvestViewController *iiVC=[[ImmediateInvestViewController alloc]init];
    [self.navigationController pushViewController:iiVC animated:YES];
}

-(UILabel *)setupCanLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *lab1=[[UILabel alloc]initWithFrame:frame];
    lab1.text=text;
    lab1.adjustsFontSizeToFitWidth=YES;
    lab1.font=[UIFont systemFontOfSize:16];
    lab1.textAlignment=NSTextAlignmentCenter;
    return lab1;
}

-(UILabel *)setupGuLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *lab1=[[UILabel alloc]initWithFrame:frame];
    lab1.text=text;
    lab1.adjustsFontSizeToFitWidth=YES;
    lab1.textColor=[UIColor darkGrayColor];
    lab1.font=[UIFont systemFontOfSize:15];
    lab1.textAlignment=NSTextAlignmentCenter;
    return lab1;
}

-(void)buttonClick:(UIButton *)button{
    NSInteger num=button.tag-1000;
    if (num==0) {
        NSLog(@"button==0");
        AboutMeViewController *amVC=[[AboutMeViewController alloc]init];
        [self.navigationController pushViewController:amVC animated:YES];
        
    }else if (num==1){
        NSLog(@"button==1");
        AboutManageViewController *amVC=[[AboutManageViewController alloc]init];
        [self.navigationController pushViewController:amVC animated:YES];
        
    }else{
        NSLog(@"button==2");
        SafeViewController *sVC=[[SafeViewController alloc]init];
        [self.navigationController pushViewController:sVC animated:YES];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点我啦");
    
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-50) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    ////根据数据，最少（固定）有1个
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
//    headView.backgroundColor=[UIColor cyanColor];
//
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 150;
        }else{
            return 100;
        }
    }else{
        if (indexPath.row==0) {
            return 40;
        }else{
            return 90;
        }
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
