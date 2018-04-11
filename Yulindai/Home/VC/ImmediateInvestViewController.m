//
//  ImmediateInvestViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/30.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ImmediateInvestViewController.h"

@interface ImmediateInvestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *leiArray;
@property(nonatomic,strong)NSMutableArray *jiluArray;
@property(nonatomic,strong)NSArray *btnTitleArray;
@property(nonatomic,strong)UIButton *selectBtn;
@property(nonatomic,strong)UITableView *CTableView;
@property(nonatomic,strong)NSMutableArray *CTDataArray;
@property(nonatomic,strong)NSMutableArray *xinxiArray;

@end

@implementation ImmediateInvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"借款详情";
    self.view.backgroundColor=[UIColor whiteColor];
    _titleArray=@[@"发标时间",@"风险控制",@"审核记录",@"用户信息",@"借款描述",@"借款记录"];
    _leiArray=@[@[@"信用报告",@"实名认证",@"工作认证"],@[@"收入认证",@"房产认证",@"车产认证"]];
    _jiluArray=[[NSMutableArray alloc]initWithArray:@[@[@"借款笔数：1",@"成功笔数：1",@"还清笔数：1"],@[@"共计借入：100万",@"逾期次数：0",@"严重逾期：0"],@[@"逾期金额：0",@"待还本息：0",@"共计借出：0"],@[@"待收本息：0",@"",@""]]];
    _xinxiArray=[[NSMutableArray alloc]initWithArray:@[@[@"信用等级：HR",@"信用额度：1，000，000"],@[@"性       别：女",@"年       龄：18"],@[@"工作收入：100",@"有无购房：无"],@[@"有无购车：无",@"有无房贷：无"]]];
    _btnTitleArray=@[@"借入者信息",@"投标记录",@"还款详情"];
    
    //CellTable数据
    _CTDataArray=[[NSMutableArray alloc]init];
    
    
    [self createUI];
    [self leftItem];
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-40) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tag=100;
    [self.view addSubview:_tableView];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(0, HEIGHT-40, WIDTH, 40);
    button.backgroundColor=[UIColor orangeColor];
    [button setTitle:@"立即投资" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(suguniButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

-(void)suguniButtonClick{
    NSLog(@"立即投资");
}

-(void)buttonClick:(UIButton *)button{
    
    NSLog(@"%ld",button.tag);
    if (!button.isSelected) {
        self.selectBtn.selected = !self.selectBtn.selected;
        [self.selectBtn setTitleColor:NAVCOLOR forState:UIControlStateSelected];
        button.selected = !button.selected;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.selectBtn = button;
    }
    [_CTDataArray removeAllObjects];
    if (button.tag==1001) {
        [_CTDataArray addObjectsFromArray:@[@"我",@"是",@"猫"]];
    }else if (button.tag==1002){
        [_CTDataArray addObjectsFromArray:@[@"夏",@"目",@"漱",@"石"]];
    }else{
    }
    
    //一个cell刷新
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:3];
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:_tableView]) {
        
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ImmediateInvestCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (indexPath.section==3) {
        
        if (indexPath.row==0) {
            
            for (int i=0; i<3; i++) {
                UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                button.frame=CGRectMake(WIDTH/3.0*i, 5, WIDTH/3.0, 30);
                [button setTitle:_btnTitleArray[i] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button setTitleColor:NAVCOLOR forState:UIControlStateSelected];
                button.titleLabel.font=[UIFont systemFontOfSize:15];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                button.tag=1000+i;
                if (i==0) {
                    button.selected=YES;
                    self.selectBtn=button;
                }
                [cell addSubview:button];
            }
            
        }else{
            
            CGFloat Y;
            
            if (_CTDataArray.count==0) {
                Y=130;
            }else{
                Y=cell.frame.size.height*_CTDataArray.count;
            }
            
            _CTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, Y) style:UITableViewStylePlain];
            _CTableView.delegate=self;
            _CTableView.dataSource=self;
            [cell addSubview:_CTableView];
        }
        
    }else{
        if (indexPath.row==0) {
            
            cell.textLabel.font=[UIFont systemFontOfSize:15];
            cell.textLabel.text=_titleArray[indexPath.section];
            
        }else{
            if (indexPath.section==0) {
                UILabel *label=[self setupLabelWithFrame:CGRectMake(10, 10, WIDTH-20, 20) text:@"2018年3月30日 10：41 -- 2018年4月2日 8：30" font:13];
                [cell addSubview:label];
                UILabel *lab2=[self setupLabelWithFrame:CGRectMake(10, 30, WIDTH-20, 20) text:@"借款编号 #MER000888" font:13];
                [cell addSubview:lab2];
                
            }else if (indexPath.section==1){
                cell.textLabel.text=@"吾輩わがはいは猫である.吾輩わがはいは猫である.";
                cell.textLabel.numberOfLines=0;
                cell.textLabel.font=[UIFont systemFontOfSize:13];
                cell.textLabel.textColor=[UIColor darkGrayColor];
            }else if (indexPath.section==2){
                
                for (int i=0; i<2; i++) {
                    for (int j=0; j<3; j++) {
                        
                        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                        button.frame=CGRectMake(WIDTH/3.0*j, 10+25*i, WIDTH/3.0, 25);
                        [button setTitle:_leiArray[i][j] forState:UIControlStateNormal];
                        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                        button.titleLabel.font=[UIFont systemFontOfSize:14];
                        [button setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
                        [button setImagePositionWithType:SSImagePositionTypeRight spacing:2];
                        [cell addSubview:button];
                    }
                }
                
            }else if (indexPath.section==3){
                if (indexPath.row==1) {
                    
                }else{
                    
                }
            }else if (indexPath.section==4){
                cell.textLabel.text=@"どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。";
                cell.textLabel.numberOfLines=0;
                cell.textLabel.font=[UIFont systemFontOfSize:13];
                cell.textLabel.textColor=[UIColor darkGrayColor];
                
            }else{
                
                for (int i=0; i<4; i++) {
                    for (int j=0; j<3; j++) {
                        
                        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20+WIDTH/3.0*j, 10+20*i, WIDTH/3.0, 20)];
                        label.text=[NSString stringWithFormat:@"%@",_jiluArray[i][j]];
                        label.font=[UIFont systemFontOfSize:14];
                        label.textColor=[UIColor darkGrayColor];
                        [cell addSubview:label];
                    }
                }
            }
        }
    }
    return cell;
        
    }else{
        UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTableViewCell"];
        cell.textLabel.textColor=[UIColor darkGrayColor];
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        if (_CTDataArray.count==0) {
            
            if (indexPath.row==0) {
                cell.textLabel.text=@"用户信息";
            }else{
                
                for (int i=0; i<4; i++) {
                    for (int j=0; j<2; j++) {
                        
                        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(15+WIDTH/2.0*j, 5+20*i, WIDTH/2.0, 20)];
                        label.text=[NSString stringWithFormat:@"%@",_xinxiArray[i][j]];
                        label.font=[UIFont systemFontOfSize:14];
                        label.textColor=[UIColor darkGrayColor];
                        [cell addSubview:label];
                    }
                }
            }
//
        }else{
            
//            cell.textLabel.text=_CTDataArray[indexPath.row];
//            cell.textLabel.textColor=[UIColor darkGrayColor];
//            cell.textLabel.font=[UIFont systemFontOfSize:15];
            
            UILabel *banLab=[self setupLabelWithFrame:CGRectMake(20, 10, 20, 20) text:[NSString stringWithFormat:@"%ld",indexPath.row+1] font:14];
            [cell addSubview:banLab];
            
            UILabel *sumLab=[self setupLabelWithFrame:CGRectMake(WIDTH/4.0, 0, WIDTH/2.0, 20) text:[NSString stringWithFormat:@"%@",@"￥8000.00"] font:14];
            sumLab.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:sumLab];
            
            UILabel *dateLab=[self setupLabelWithFrame:CGRectMake(WIDTH/4.0, 20, WIDTH/2.0, 20) text:[NSString stringWithFormat:@"%@",@"2018-4-3"] font:14];
            dateLab.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:dateLab];
            
        }
        return cell;
    }
    
}

-(UILabel *)setupLabelWithFrame:(CGRect)frame text:(NSString *)text font:(NSInteger)font {
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.numberOfLines=0;
    label.textColor=[UIColor darkGrayColor];
    label.font=[UIFont systemFontOfSize:font];
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:_tableView]) {
        
        if (indexPath.row==0) {
            return 40;
        }else{
            
            if (indexPath.section==0) {
                return 60;
            }else if (indexPath.section==1){
                CGFloat contentWidth = WIDTH-20;
                UIFont *font = [UIFont systemFontOfSize:13];
                NSString *content =@"吾輩わがはいは猫である.吾輩わがはいは猫である.";
                CGSize size = [content sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
                return size.height+30;
            }else if (indexPath.section==2){
                return 70;
            }else if (indexPath.section==3){
                
                if (_CTDataArray.count==0) {
                    return 130;
                }else{
                    return _CTDataArray.count*40;
                }
                
            }else if (indexPath.section==4){
                CGFloat contentWidth = WIDTH-20;
                UIFont *font = [UIFont systemFontOfSize:13];
                NSString *content =@"どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。";
                CGSize size = [content sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
                return size.height+30;
            }else{
                return 100;
            }
            
        }
    }else{
        
        if (_CTDataArray.count==0) {
            
            if (indexPath.row==0) {
                return 40;
            }else{
                return 90;
            }
            
        }else{
            return 40;
        }
        
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if ([tableView isEqual:_tableView]) {
        if (section==0) {
            UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
            headView.backgroundColor=NAVCOLOR;
            
            UILabel *lilvLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3.0, 10, WIDTH/3.0, 40)];
            lilvLab.text=@"9.600%";
            lilvLab.textAlignment=NSTextAlignmentCenter;
            lilvLab.textColor=[UIColor whiteColor];
            lilvLab.font=[UIFont systemFontOfSize:28];
            [headView addSubview:lilvLab];
            
            UILabel *lab1=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0, 50, WIDTH/3.0, 20) text:@"年利率" ];
            [headView addSubview:lab1];
            UILabel *lab2=[self setupGuLabelWithFrame:CGRectMake(0, 120, WIDTH/3.0, 20) text:@"项目金额（元）" ];
            [headView addSubview:lab2];
            UILabel *lab3=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0, 120, WIDTH/3.0, 20) text:@"投资期限（月）" ];
            [headView addSubview:lab3];
            UILabel *lab4=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0*2, 120, WIDTH/3.0, 20) text:@"最小投资金额" ];
            [headView addSubview:lab4];
            
            UILabel *jeLab=[self setupGuLabelWithFrame:CGRectMake(0, 95, WIDTH/3.0, 20) text:@"1,000,000" ];
            [headView addSubview:jeLab];
            UILabel *qxLab=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0, 95, WIDTH/3.0, 20) text:@"12" ];
            [headView addSubview:qxLab];
            UILabel *zxLab=[self setupGuLabelWithFrame:CGRectMake(WIDTH/3.0*2, 95, WIDTH/3.0, 20) text:@"5,000" ];
            [headView addSubview:zxLab];
            
            
            UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(20, 80, WIDTH-40, 1)];
            line.backgroundColor=[UIColor whiteColor];
            [headView addSubview:line];
            
            return headView;
        }else{
            return nil;
        }
    }else{
        return nil;
    }
    
   
}

-(UILabel *)setupGuLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *lab1=[[UILabel alloc]initWithFrame:frame];
    lab1.textAlignment=NSTextAlignmentCenter;
    lab1.text=text;
    lab1.textColor=[UIColor whiteColor];
    lab1.font=[UIFont systemFontOfSize:14];
    return lab1;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if ([tableView isEqual:_tableView]) {
        if (section==5) {
            UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, WIDTH-40, 60)];
            label.text=@"将以客观、公正的原则，最大程度地核实借入者信息的真实性。但誉霖贷不保证审核信息100%真实，借入者若长期逾期，其个人信息将被公布。";
            label.textColor=[UIColor lightGrayColor];
            label.numberOfLines=0;
            label.font=[UIFont systemFontOfSize:12];
            
            [footView addSubview:label];
            return footView;
        }else{
            return nil;
        }
    }else{
        return nil;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:_tableView]) {
        NSLog(@"吾輩わがはいは猫である");
    }else{
        NSLog(@"CCC吾輩わがはいは猫である");
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:_tableView]) {
        if (section==0) {
            return 150;
        }else{
            return 0.1;
        }
    }else{
        return 0.1;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if ([tableView isEqual:_tableView]) {
        if (section==5) {
            return 100;
        }else{
            return 5;
        }
    }else{
        return 0.1;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if ([tableView isEqual:_tableView]) {
        return 6;
    }else{
        return 1;
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:_tableView]) {
        return 2;
    }else{
        
        if (_CTDataArray.count==0) {
            return 2;
        }else{
            return _CTDataArray.count;
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
