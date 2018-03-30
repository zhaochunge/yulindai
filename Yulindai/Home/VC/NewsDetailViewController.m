//
//  NewsDetailViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"消息中心";
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0, 15, 15);
    [rightBtn setImage:[UIImage imageNamed:@"删除-ICON"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    [self createUI];
    
}

-(void)deleteClick{
    NSLog(@"delete");
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsdetailCell"];
    
    if (indexPath.row==0) {
        cell.textLabel.text=@"夏目漱石";
        cell.detailTextLabel.text=@"2018年3月29日";
        cell.detailTextLabel.textColor=[UIColor darkGrayColor];
    }else{
        
        cell.textLabel.text=@"吾輩わがはいは猫である";
        
        cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
        cell.detailTextLabel.text=@"どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。";
        cell.detailTextLabel.numberOfLines=0;
        cell.detailTextLabel.textColor=[UIColor darkGrayColor];
        
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 50;
    }else{
//        NSInteger row = [indexPath row];
        // 列寬
        CGFloat contentWidth = WIDTH-20;
        // 用何種字體進行顯示
        UIFont *font = [UIFont systemFontOfSize:15];
        // 該行要顯示的內容
        NSString *content =@"どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。";
        // 計算出顯示完內容需要的最小尺寸
        CGSize size = [content sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        // 這裏返回需要的高度
        return size.height+30;
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
