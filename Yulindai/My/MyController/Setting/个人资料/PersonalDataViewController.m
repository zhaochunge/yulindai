//
//  PersonalDataViewController.m
//  Yulindai
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "PersonalDataViewController.h"

@interface PersonalDataViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSMutableArray *sec2Array;
@property(nonatomic,strong)NSMutableArray *sec3Array;

@end

@implementation PersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"个人资料";
    [self leftItem];
    self.view.backgroundColor=[UIColor whiteColor];
    _titleArray=@[@[@"头像"],@[@"昵称",@"性别"],@[@"学历",@"邮箱",@"职业",@"手机号",@"故乡",@"所在地"]];
    _sec2Array=[[NSMutableArray alloc]initWithArray:@[@"丧d",@"男"]];
    _sec3Array=[[NSMutableArray alloc]initWithArray:@[@"小学",@"8888 8888@qq.com",@"会社員",@"18888888888",@"地図",@"地図"]];
    [self setupTableView];
    
}

-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pdCell"];
    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];
    if (indexPath.section==0) {
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-65, 7, 30, 30)];
        imgView.backgroundColor=[UIColor redColor];
        imgView.layer.cornerRadius=15;
        [cell addSubview:imgView];
    }else if (indexPath.section==1){
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(90, 7, WIDTH-130, 30)];
        label.text=_sec2Array[indexPath.row];
        [cell addSubview:label];
    }else{
        
        if(indexPath.row==1|indexPath.row==3){
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(90, 7, WIDTH-130, 30)];
            label.text=_sec3Array[indexPath.row];
            [cell addSubview:label];
//            、、困死了😪。。。。
            
        }else{
            UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame=CGRectMake(90, 7, WIDTH-130, 30);
            [button setTitle:_sec3Array[indexPath.row] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [cell addSubview:button];
            UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-120, 10, 16, 16)];
            imgView.image=[UIImage imageNamed:@"三角"];
            [button addSubview:imgView];
            
        }
        
//        if (indexPath.row==0) {
//            UIButton *button;
//        }else if (indexPath.row==1){
////            UILabel /UITextField
//        }else if (indexPath.row==2){
//            UIButton *button;
//        }else if (indexPath.row==3){
////            UILabel/UITextField
//        }else if (indexPath.row==4){
//            UIButton *button;
//        }else{
//            UIButton *button;
//        }
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==2) {
        
        UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.backgroundColor=NAVCOLOR;
        button.frame=CGRectMake(10, 35, WIDTH-20, 40);
        [button setTitle:@"保存" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.cornerRadius=10;
        [footerView addSubview:button];
        
        return footerView;
    }else{
        return nil;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
        return 100;
    }else{
        return 9.9;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }else if (section==1){
        return 2;
    }else{
        return 6;
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
