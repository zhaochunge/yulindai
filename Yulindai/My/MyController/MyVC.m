//
//  MyVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/27.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "MyVC.h"
#import "myTableCell.h"
#import "TopUpVC.h"
#import "CashVC.h"
#import "CertificMessageVC.h"
#import "InvestManageVC.h"
#import "BorrowVC.h"
#import "SettingViewController.h"


@interface MyVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *myTab;
@property(nonatomic,strong)UIImageView *headImg;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *totalNum;
@property(nonatomic,strong)UILabel *freezeNum;
@property(nonatomic,strong)UILabel *balanceNum;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *picArr;
@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setStatusBarBackgroundColor:NAVCOLOR];
    self.titleArr = @[@[@"认证信息",@"投资管理",@"借款管理"],@[@"设置"]];
    self.picArr = @[@[@"认证-ICON",@"投资理财-ICON",@"借款-ICON (2)"],@[@"设置-ICON"]];
    [self createTable];
    [self headview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

-(void)createTable{
    self.myTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight) style:(UITableViewStylePlain)];
    self.myTab.delegate = self;
    _myTab.dataSource = self;
    _myTab.bounces = NO;
    [self.view addSubview:_myTab];
    [_myTab registerClass:[myTableCell class] forCellReuseIdentifier:@"MyReuse"];
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [self.myTab setTableFooterView:v];
}
-(void)headview{
    UIView *headView = [UIView new];
    headView.frame = CGRectMake(0, 0, WIDTH, 230);
    headView.backgroundColor = NAVCOLOR;
    _myTab.tableHeaderView = headView;
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
    _headImg.layer.cornerRadius = 20;
    _headImg.layer.masksToBounds = YES;
    [headView addSubview:_headImg];
    _headImg.backgroundColor = [UIColor whiteColor];
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, 100, 40)];
    self.nameLab.font = [UIFont systemFontOfSize:20];
    _nameLab.textColor = [UIColor whiteColor];
    _nameLab.text = @"王晓红";
    [headView addSubview:_nameLab];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(WIDTH-40, 20, 25, 25);
    [rightBtn setImage:[UIImage imageNamed:@"签到_ICON"] forState:(UIControlStateNormal)];
    [headView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    UILabel *totalLab = [[UILabel alloc] initWithFrame:CGRectMake(20, _headImg.bottom+20, (WIDTH-40)/2, 30)];
    totalLab.textColor = [UIColor whiteColor];
    totalLab.text = @"资产总金额(元)";
    totalLab.textAlignment = YES;
    [headView addSubview:totalLab];
    //
    UILabel *freezeLab = [[UILabel alloc] initWithFrame:CGRectMake(totalLab.right, _headImg.bottom+20, (WIDTH-40)/2, 30)];
    freezeLab.text = @"冻结资金(元)";
    freezeLab.textAlignment = YES;
    freezeLab.textColor = [UIColor whiteColor];
    [headView addSubview:freezeLab];
    //
    self.totalNum = [[UILabel alloc] initWithFrame:CGRectMake(20, totalLab.bottom, (WIDTH-40)/2, 30)];
    self.totalNum.textAlignment = YES;
    _totalNum.textColor = [UIColor whiteColor];
    [headView addSubview:_totalNum];
    _totalNum.text = @"850.00";
    //
    self.freezeNum = [[UILabel alloc] initWithFrame:CGRectMake(totalLab.right, freezeLab.bottom, (WIDTH-40)/2, 30)];
    self.freezeNum.textAlignment = YES;
    self.freezeNum.textColor = [UIColor whiteColor];
    [headView addSubview:_freezeNum];
    _freezeNum.text = @"730.00";
    
    UIView *whiteView= [[UIView alloc] initWithFrame:CGRectMake(0, 160, WIDTH, 70)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:whiteView];
    UILabel *balanceLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 30)];
    balanceLab.textColor = [UIColor lightGrayColor];
    balanceLab.text = @"可用余额(元)";
    [whiteView addSubview:balanceLab];
    self.balanceNum = [[UILabel alloc] initWithFrame:CGRectMake(20, balanceLab.bottom, 200, 30)];
    self.balanceNum.textColor = NAVCOLOR;
    [whiteView addSubview:_balanceNum];
    _balanceNum.text = @"120.00";
    //
    UIButton *topUpBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    topUpBtn.frame = CGRectMake(WIDTH-160, 20, 60, 30);
    [topUpBtn setTitle:@"充值" forState:(UIControlStateNormal)];
    topUpBtn.layer.cornerRadius = 15;
    [whiteView addSubview:topUpBtn];
    topUpBtn.backgroundColor = NAVCOLOR;
    [topUpBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [topUpBtn addTarget:self action:@selector(topUpAction:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    UIButton *cashBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cashBtn.frame = CGRectMake(WIDTH-80, 20, 60, 30);
    [cashBtn setTitle:@"提现" forState:(UIControlStateNormal)];
    cashBtn.layer.masksToBounds = YES;
    cashBtn.layer.borderWidth = 1;
    cashBtn.layer.cornerRadius = 15;
    cashBtn.layer.borderColor = NAVCOLOR.CGColor;
    [whiteView addSubview:cashBtn];
    [cashBtn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
    [cashBtn addTarget:self action:@selector(cashAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
#pragma mark 充值点击
-(void)topUpAction:(UIButton *)btn{
    TopUpVC *vc = [TopUpVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 提现点击
-(void)cashAction:(UIButton *)btn{
    CashVC *vc = [CashVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 右侧日历点击
-(void)rightAction:(UIButton *)btn{
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
    
}
#pragma mark tablecell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        if (indexPath.row == 0) {
            //认证信息
            CertificMessageVC *vc = [CertificMessageVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }if (indexPath.row == 1) {
            //投资管理
            InvestManageVC *vc = [InvestManageVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }if(indexPath.row == 2){
            //借款管理
            BorrowVC *vc = [BorrowVC new];
            [self.navigationController pushViewController:vc animated:YES]; 
        }
    }else{
        SettingViewController *setVC=[SettingViewController new];
        [self.navigationController pushViewController:setVC animated:YES];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyReuse" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.titleLab.text = self.titleArr[indexPath.section][indexPath.row];
    cell.img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picArr[indexPath.section][indexPath.row]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
    view.backgroundColor = LINECOLOR;
    return view;
}

-(void)viewWillDisappear:(BOOL)animated{
     [self.navigationController setNavigationBarHidden:NO animated:YES];
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
