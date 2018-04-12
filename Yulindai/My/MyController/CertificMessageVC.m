//
//  CertificMessageVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/12.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "CertificMessageVC.h"
#import "CerTableCell.h"

@interface CertificMessageVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *cerTab;
@property(nonatomic,strong)NSArray *titleArr;
@end

@implementation CertificMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    [self setupUI];
    self.navigationItem.title = @"认证信息";
    self.titleArr =@[ @[@"实名认证"],@[@"工作认证",@"信用报告",@"收入认证",@"电子印章",@"房产认证",@"购车认证",@"学历认证",@"视频认证",@"手机认证",@"居住地认证",@"结婚认证"]];
}
-(void)setupUI{
    self.cerTab = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight) style:(UITableViewStylePlain)];
    self.cerTab.delegate = self;
    self.cerTab.dataSource = self;
    [self.cerTab registerClass:[CerTableCell class] forCellReuseIdentifier:@"cerReuse"];
    [self.view addSubview:self.cerTab];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if (section == 0) {
        return 1;
    }else{
         return 11;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cerReuse" forIndexPath:indexPath];
    cell.status.text = @"未上传";
    cell.titleLab.text = [NSString stringWithFormat:@"%@",self.titleArr[indexPath.section][indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 70)];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
    [headSection addSubview:line];
    line.backgroundColor = LINECOLOR;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, line.bottom, WIDTH, 30)];
    if(section == 0){
        title.text = @"必要信用认证";
    }else{
        title.text = @"可选信用认证";
    }
    
    title.font = [UIFont systemFontOfSize:19];
    [headSection addSubview:title];
    UILabel *discrib = [[UILabel alloc] initWithFrame:CGRectMake(20, title.bottom, WIDTH-40, 30)];
    discrib.textColor = [UIColor lightGrayColor];
    
    if(section == 0){
        discrib.text = @"以下为必要信用认证,上传齐全后将审核.必要认证缺失无法得到贷款.";
    }else{
        discrib.text = @"您可以选择上传的认证项目,只要通过可选信用认证,将会提高您的等级和额度.";
    }
    discrib.font = [UIFont systemFontOfSize:15];
    discrib.adjustsFontSizeToFitWidth = YES;
    [headSection addSubview:discrib];
    UIView *linee = [[UIView alloc] initWithFrame:CGRectMake(0, discrib.bottom, WIDTH, 1)];
    linee.backgroundColor = LINECOLOR;
    [headSection addSubview:linee];
    return headSection;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
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
