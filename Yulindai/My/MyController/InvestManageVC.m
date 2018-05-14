//
//  InvestVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "InvestManageVC.h"
#import "LineBtn.h"

@interface InvestManageVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UILabel *moneyNum;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UIView *headerView;
@end

@implementation InvestManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"投资管理";
    self.dataArr = [NSMutableArray array];
    [self leftItem];
    [self createHeader];
    if (self.dataArr.count>0) {
        [self createTable];
    }else{
        [self createView];
    }

}
-(void)createView{
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-35, (HEIGHT-150)/2-50, 70, 100)];
    image.image = [UIImage imageNamed:@"暂无记录-icon"];
    [self.view addSubview:image];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, image.bottom, WIDTH, 30)];
    lab.text = @"暂无消息";
    lab.textColor = GARYCOLOR;
    lab.textAlignment = YES;
    [self.view addSubview:lab];
}
-(void)createTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaTopHeight) style:(UITableViewStylePlain)];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.tableHeaderView = self.headerView;
    [self.view addSubview:self.table];
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"meaasge"];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"meaasge" forIndexPath:indexPath];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(void)createHeader{
    self.headerView= [UIView new];
    _headerView.frame = CGRectMake(0, 0, WIDTH, 150);
    _headerView.backgroundColor = NAVCOLOR;
    [self.view addSubview:_headerView];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    titleLab.text = @"持有资产";
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = YES;
    [_headerView addSubview:titleLab];
    self.moneyNum = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLab.bottom, WIDTH, 40)];
    self.moneyNum.textAlignment = YES;
    self.moneyNum.textColor = [UIColor whiteColor];
    self.moneyNum.font = [UIFont systemFontOfSize:26];
    self.moneyNum.text = @"120.0";
    [_headerView addSubview:_moneyNum];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, _moneyNum.bottom+9, WIDTH-40, 1)];
    line.backgroundColor = [UIColor whiteColor];
    [_headerView addSubview:line];
    NSArray *arr = @[@"全部",@"招标中",@"回收中",@"已回收",@"流标",@"坏账"];
    for (int i = 0; i<6; i++) {
        LineBtn *btn = [LineBtn buttonWithType:UIButtonTypeSystem Frame:CGRectMake(WIDTH/6*i, line.bottom+10, WIDTH/6, 50) ButtonTitle:arr[i] ButtonBackGroundColor:NAVCOLOR ButtonBackgroundImage:nil ButtonTitleColor:[UIColor whiteColor]];
        btn.tag = 666+i;
        if (i == 0) {
            btn.line.backgroundColor = [UIColor whiteColor];
        }
        [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [_headerView addSubview:btn];
    }
    
}
#pragma mark 点击
-(void)action:(LineBtn *)btn{

    for (int i = 0; i<6; i++) {
        LineBtn *button = [self.view viewWithTag:i+666];
        button.line.backgroundColor = NAVCOLOR;
        if (i == btn.tag-666) {
            button.line.backgroundColor = [UIColor whiteColor];
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
