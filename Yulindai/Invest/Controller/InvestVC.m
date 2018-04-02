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
#import "ChooseTabCell.h"
#import "CellHeightModel.h"
#import "ChooseCollectionCell.h"

@interface InvestVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UITableView *tableList;
@property(nonatomic,strong)UIView *bacView;
@property (nonatomic, weak) UIView *upView;
@property (nonatomic, strong) UIWindow *window;
@property(nonatomic,strong)UITableView *chooseTable;
@property(nonatomic,strong)UIButton *sprBtn;
@property(nonatomic,strong)NSArray *chooseData;
// 存放cell视图展开状态的字典
@property (nonatomic, strong) NSMutableDictionary *cellIsShowAll;
//@property(nonatomic,assign)BOOL buttonSpr;
//展开cell数组
@property(nonatomic,strong)NSMutableArray *btnTagArr;
//存放选中标签数组
@property(nonatomic,strong)NSMutableArray *selectArr;
@end

@implementation InvestVC
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.cellIsShowAll = [NSMutableDictionary dictionary];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"投资列表";
    self.chooseData = @[@"无知",@"风云变幻",@"唉",@"呵呵哒",@"快看看",@"窿窿啦啦",@"呵呵呵",@"djsk",@"电视剧"];
//    _buttonSpr = NO;
    self.btnTagArr = [NSMutableArray array];
    self.selectArr = [NSMutableArray array];
    [self rightItem];
    [self createTable];
    [self createView];
}
-(void)rightItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"筛选-icon"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =item;
}
#pragma mark 筛选点击
-(void)rightBtn:(UIButton *)btn{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [view addGestureRecognizer:tap];
    [[[UIApplication sharedApplication] keyWindow]addSubview:view];
    self.upView = view;
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(70, 0, WIDTH-70, HEIGHT)];
    window.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
    window.windowLevel = UIWindowLevelNormal;
    window.hidden = NO;
    [window makeKeyAndVisible];
    self.window = window;
   
    [self createList];

}
#pragma mark 创建筛选列表
-(void)createList{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH-70, SafeAreaTopHeight-44)];
    view.backgroundColor = NAVCOLOR;
    [_window addSubview:view];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, SafeAreaTopHeight-44, 100, 44)];
    [_window addSubview:lab];
    lab.textColor = NAVCOLOR;
    lab.text = @"筛选一下";
    lab.font = [UIFont systemFontOfSize:18];
    self.chooseTable = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, WIDTH-70, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight-50) style:(UITableViewStylePlain)];
    self.chooseTable.delegate = self;
    _chooseTable.dataSource = self;
    [_window addSubview:_chooseTable];
    [_chooseTable registerClass:[ChooseTabCell class] forCellReuseIdentifier:@"chooseReuse"];
    UIView *line = [UIView new];
    line.frame = CGRectMake(0, HEIGHT-50-SafeAreaBottomHeight, WIDTH-70, 1);
    line.backgroundColor = [UIColor lightGrayColor];
    UIButton *review = [UIButton buttonWithType:UIButtonTypeSystem];
    review.frame = CGRectMake(0, HEIGHT-SafeAreaBottomHeight-49, (WIDTH-70)/2, 49);
    [review setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
    [review setBackgroundColor:[UIColor whiteColor]];
    [_window addSubview:review];
    [review setTitle:@"重置" forState:(UIControlStateNormal)];
    [review addTarget:self action:@selector(reviewAction:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *sure = [UIButton buttonWithType:UIButtonTypeSystem];
    sure.frame = CGRectMake(review.right, HEIGHT-49-SafeAreaBottomHeight, (WIDTH-70)/2, 49);
    [sure setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [sure setBackgroundColor:NAVCOLOR];
    [_window addSubview:sure];
    [sure setTitle:@"确定" forState:(UIControlStateNormal)];
    [sure addTarget:self action:@selector(sureAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
}
#pragma mark 重置点击
-(void)reviewAction:(UIButton *)btn{
    [self.selectArr removeAllObjects];
    [_chooseTable reloadData];
}
#pragma mark 确定点击
-(void)sureAction:(UIButton *)btn{
    
}
#pragma mark 收回菜单
- (void)tapAction{
    
    [self.window resignKeyWindow];
    [self.upView removeFromSuperview];
    self.window  = nil;
    self.upView = nil;
    
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
    if (tableView == self.tableList) {
        ListTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listReuse" forIndexPath:indexPath];
        [cell.btn addTarget:self action:@selector(investClick:) forControlEvents:(UIControlEventTouchUpInside)];
        
        return cell;
    }else{
        ChooseTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chooseReuse" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setCellContent:self.chooseData andIsShow:[[self.cellIsShowAll objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]] boolValue]  andCellIndexPath:indexPath];
        cell.collection.dataSource = self;
        cell.collection.delegate = self;
        return cell;
    }
   
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.chooseData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChooseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionReuse" forIndexPath:indexPath];
    [cell.btn setTitle:[NSString stringWithFormat:@"%@",self.chooseData[indexPath.row]] forState:(UIControlStateNormal)];
    [cell.btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    if (self.selectArr.count>0) {
        for (NSString *str in self.selectArr) {
            if ([str isEqualToString:self.chooseData[indexPath.row]]) {
                [cell.btn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
                cell.btn.layer.borderColor = NAVCOLOR.CGColor;
            }
        }
    }
    return cell;
}
#pragma mark 标签点击
-(void)action:(UIButton *)btn{
    if ([btn.titleLabel.textColor isEqual:NAVCOLOR]) {
        [btn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.selectArr removeObject:btn.titleLabel.text];
    }else{
        [btn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
        btn.layer.borderColor = NAVCOLOR.CGColor;
        [self.selectArr addObject:btn.titleLabel.text];
    }
    
    
}
#pragma mark 立即投资点击
-(void)investClick:(UIButton *)btn{
    EntrustVC *vc = [EntrustVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tableList) {
        return 10;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableList) {
        return 165;
    }else{
        return [CellHeightModel cellHeightWith:self.chooseData  andIsShow:[[self.cellIsShowAll objectForKey:[NSString stringWithFormat:@"%ld", indexPath.section]] boolValue] andLableWidth:WIDTH-30 andFont:12 andDefaultHeight:50 andFixedHeight:0 andIsShowBtn:0];
    }
 
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.chooseTable) {
        return 10;
    }else{
        return 1;
    }
}
#pragma mark 分区
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView == self.chooseTable){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,WIDTH,50)];
        view.backgroundColor = LINECOLOR;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0,10,WIDTH,30);
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16.0];
        label.text = @"  但是";
        label.backgroundColor = [UIColor whiteColor];
        [view addSubview:label];
        self.sprBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sprBtn.frame = CGRectMake(WIDTH-100, 10, 30, 30);
        _sprBtn.tag = 900+section;
        [view addSubview:_sprBtn];
        [_sprBtn setImage:[UIImage imageNamed:@"更多_ICON"] forState:(UIControlStateNormal)];
        [_sprBtn addTarget:self action:@selector(sprAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        
        return view;
    }
    else{
        UIView *view = [UIView new];
        return view;
    }
    
}
#pragma mark 展开
-(void)sprAction:(UIButton *)btn{
    if (_btnTagArr.count>0) {
        if (![_btnTagArr containsObject:[NSString stringWithFormat:@"%ld",btn.tag]]) {
            [_btnTagArr addObject:[NSString stringWithFormat:@"%ld",btn.tag]];
            NSString *str = [NSString stringWithFormat:@"%ld",btn.tag-900];
            [self.cellIsShowAll setObject:@"YES" forKey:str];
        }else{
            NSString *str = [NSString stringWithFormat:@"%ld",btn.tag-900];
            [self.cellIsShowAll setObject:@"NO" forKey:str];
            [_btnTagArr removeObject:[NSString stringWithFormat:@"%ld",btn.tag]];
        }
    }else{
        NSString *str = [NSString stringWithFormat:@"%ld",btn.tag-900];
        [self.cellIsShowAll setObject:@"YES" forKey:str];
        [_btnTagArr addObject:[NSString stringWithFormat:@"%ld",btn.tag]];
    }
    [_chooseTable reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.chooseTable) {
        return 41;
    }
    else{
        return 0;
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
