//
//  AccountSafeViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "AccountSafeViewController.h"
#import "PersonalDataViewController.h"
#import "ResetPWDViewController.h"
#import "EmailViewController.h"
#import "ResetPhoneViewController.h"
#import "SetPayPWDViewController.h"
#import "ResetPayPWDViewController.h"

@interface AccountSafeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation AccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"账户安全";
    [self leftItem];
    self.view.backgroundColor=[UIColor whiteColor];
    _titleArray=@[@"实名认证",@"登录密码",@"绑定邮箱",@"绑定手机",@"支付密码"];
    [self setupTableView];
}

-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"asCell"];
    cell.textLabel.text=_titleArray[indexPath.row];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 10, 100, 30)];
    label.text=@"已设置";//未设置为红色
    [cell addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(WIDTH-60, 10, 40, 30);
    [button setTitle:@"设置" forState:UIControlStateNormal];
    [button setTitleColor:NAVCOLOR forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag=1100+indexPath.row;
    [cell addSubview:button];
    
    return cell;
}

-(void)buttonClick:(UIButton *)button{
    NSInteger tag=button.tag-1100;
    
    switch (tag) {
        case 0:
        {
            NSLog(@"0");
            PersonalDataViewController *pdVC=[[PersonalDataViewController alloc]init];
            [self.navigationController pushViewController:pdVC animated:YES];
            
        }
            break;
        case 1:
        {
            NSLog(@"1");
            ResetPWDViewController *resetVC=[[ResetPWDViewController alloc]init];
            [self.navigationController pushViewController:resetVC animated:YES];
        }
            break;
        case 2:
        {
            NSLog(@"2");
            EmailViewController *emailVC=[[EmailViewController alloc]init];
            [self.navigationController pushViewController:emailVC animated:YES];
        }
            break;
        case 3:
        {
            NSLog(@"3");
            ResetPhoneViewController *phoneVC=[[ResetPhoneViewController alloc]init];
            [self.navigationController pushViewController:phoneVC animated:YES];
        }
            break;
        case 4:
        {
            NSLog(@"4");
            
            if (0) {
                SetPayPWDViewController *setVC=[[SetPayPWDViewController alloc]init];
                [self.navigationController pushViewController:setVC animated:YES];
            }else{
                ResetPayPWDViewController *reVC=[[ResetPayPWDViewController alloc]init];
                [self.navigationController pushViewController:reVC animated:YES];
            }
            
        }
            break;
        default:
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
