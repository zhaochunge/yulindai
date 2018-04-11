//
//  NewsViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"消息中心";
//    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.frame=CGRectMake(0, 0, 15, 15);
//    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
//    rightBtn.titleLabel.font=[UIFont systemFontOfSize:15];
//    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem=rightItem;
    [self setupNewsEmptyView];
    [self setupNewsView];
    [self leftItem];
}

//-(void)editClick{
//    NSLog(@"edit");
//}

-(void)setupNewsEmptyView{
    
    //默认视图背景
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
//    backgroundView.tag = 400;
    [self.view addSubview:backgroundView];
    
    //默认图片
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"暂无记录-icon"]];
    img.center = CGPointMake(WIDTH/2.0, HEIGHT/2.0 - 120);
    img.bounds = CGRectMake(0, 0, 70, 85);
    [backgroundView addSubview:img];
    
    UILabel *warnLabel = [[UILabel alloc]init];
    warnLabel.center = CGPointMake(WIDTH/2.0, HEIGHT/2.0 - 60);
    warnLabel.bounds = CGRectMake(0, 0, WIDTH, 30);
    warnLabel.textAlignment = NSTextAlignmentCenter;
    warnLabel.text = @"暂无消息";
    warnLabel.font = [UIFont systemFontOfSize:15];
    warnLabel.textColor = [UIColor lightGrayColor];
    [backgroundView addSubview:warnLabel];
    
}

-(void)setupNewsView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsCell"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, WIDTH-40, 25)];
    label.text=@"夏目漱石";
    [cell addSubview:label];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 25, WIDTH-40, 25)];
    titleLabel.text=@"吾輩わがはいは猫である";
    [cell addSubview:titleLabel];
    
    UILabel *detailLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, WIDTH-40, 40)];
    detailLabel.text=@"どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。";
    detailLabel.numberOfLines=2;
    detailLabel.textColor=[UIColor darkGrayColor];
    detailLabel.font=[UIFont systemFontOfSize:15];
    [cell addSubview:detailLabel];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsDetailViewController *ndVC=[[NewsDetailViewController alloc]init];
    ///
    [self.navigationController pushViewController:ndVC animated:YES];
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    ////删删删
    NSLog(@"删删删");
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
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
