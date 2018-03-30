//
//  InvestVC.m
//  Yulindai
//
//  Created by zcg on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "InvestVC.h"
#import "ListTabCell.h"
#import "EntrustVC.h"

@interface InvestVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableList;
@property(nonatomic,strong)UIView *bacView;
@end

@implementation InvestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"投资列表";
    [self createTable];
    [self createView];
}
#pragma mark 立即开通提示
-(void)createView{
    self.bacView = [[UIView alloc] initWithFrame:self.view.bounds];
    _bacView.backgroundColor = [UIColor colorWithRed:62/255.0 green:62/255.0 blue:62/255.0 alpha:0.5];
    [[[UIApplication sharedApplication] keyWindow]addSubview:_bacView];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 10;
    view.layer.masksToBounds = YES;
    [_bacView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@40);
        make.right.mas_offset(@-40);
        make.top.mas_offset(HEIGHT/4);
        make.height.mas_equalTo(HEIGHT/3);
    }];
    CGFloat viewwid = WIDTH-80;
    UIImageView *logoImg = [[UIImageView alloc] initWithFrame:CGRectMake(viewwid/4, 10, viewwid/2, HEIGHT/14)];
    logoImg.image = [UIImage imageNamed:@"誉霖贷-ICON"];
    [view addSubview:logoImg];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT/3/3, viewwid, 30)];
    title.text = @"开通资金托管账户";
    title.textAlignment = YES;
    [view addSubview:title];
    UILabel *disLab = [[UILabel alloc] initWithFrame:CGRectMake(0, title.bottom, viewwid, 30)];
    disLab.textColor = GARYCOLOR;
    disLab.textAlignment = YES;
    [view addSubview:disLab];
    disLab.text = @"交易资金由誉霖贷全程保管";
    disLab.font = [UIFont systemFontOfSize:16];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"立即开通" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:ORANGECOLOR];
    btn.frame = CGRectMake(20, HEIGHT/4, viewwid-40, 40);
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10;
    [view addSubview:btn];
    [btn addTarget:self action:@selector(kaiTong:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(WIDTH/2-20, HEIGHT/3*2, 40, 40);
    [_bacView addSubview:closeBtn];
    [closeBtn setImage:[UIImage imageNamed:@"关闭-ICON"] forState:(UIControlStateNormal)];
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:(UIControlEventTouchUpInside)];
}
#pragma mark 立即开通
-(void)kaiTong:(UIButton *)btn{
    [self.bacView removeFromSuperview];
    EntrustVC *vc = [EntrustVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark 关闭
-(void)close:(UIButton *)btn{
    [self.bacView removeFromSuperview];
}
-(void)createTable{
    self.tableList = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight) style:(UITableViewStylePlain)];
    self.tableList.delegate = self;
    self.tableList.dataSource = self;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableList registerClass:[ListTabCell class] forCellReuseIdentifier:@"listReuse"];
    [self.view addSubview:_tableList];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listReuse" forIndexPath:indexPath];
    [cell.btn addTarget:self action:@selector(investClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;
}
#pragma mark 立即投资点击
-(void)investClick:(UIButton *)btn{
    EntrustVC *vc = [EntrustVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 165;
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
