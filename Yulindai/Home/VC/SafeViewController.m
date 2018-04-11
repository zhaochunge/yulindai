//
//  SafeViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "SafeViewController.h"
#import "SafeguardViewController.h"

@interface SafeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
//@property(nonatomic,strong)NSArray *safeguardTitleArray;

@end

@implementation SafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"安全保障";
    _titleArray=@[@"网上理财安全建议",@"贷款审核与保障",@"交易安全保障",@"本金保障"];
//    _safeguardTitleArray=@[@""];
    [self createUI];
    [self leftItem];
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"safeCell"];
    
    
    cell.textLabel.text=[NSString stringWithFormat:@"• %@",_titleArray[indexPath.row]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SafeguardViewController *safeVC=[[SafeguardViewController alloc]init];
    safeVC.title=_titleArray[indexPath.row];
    safeVC.url=@"https://www.baidu.com";
    [self.navigationController pushViewController:safeVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
