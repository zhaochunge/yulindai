//
//  SettingViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "SettingViewController.h"
#import "AccountSafeViewController.h"
#import "AboutViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"设置";
    [self leftItem];
    self.view.backgroundColor=[UIColor lightGrayColor];
    _titleArray=@[@"清除缓存",@"账户安全",@"关于誉霖贷"];
    [self setUpTableView];
    
    
    
}

-(void)setUpTableView{
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingCell"];
    cell.textLabel.text=_titleArray[indexPath.row];
    if (indexPath.row==0) {
        cell.detailTextLabel.text=@"25M";
    }else{
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        
    }else if (indexPath.row==1){
        AccountSafeViewController *safeVC=[[AccountSafeViewController alloc]init];
        [self.navigationController pushViewController:safeVC animated:YES];
    }else{
        AboutViewController *aboutVC=[[AboutViewController alloc]init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(10, 50, WIDTH-20, 40);
    button.backgroundColor=NAVCOLOR;
    [button setTitle:@"退出登录" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=20;
    [footerView addSubview:button];
    return footerView;
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
