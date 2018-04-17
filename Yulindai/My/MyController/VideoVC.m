//
//  VideoVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "VideoVC.h"

@interface VideoVC ()
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    self.navigationItem.title = @"视频认证";
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = CGRectMake(0,0, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight);
    self.scrollView.userInteractionEnabled = YES;
    [self.view addSubview:_scrollView];
    //认证
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    NSString *discribStr = @"您上传的身份证扫描件需和您绑定的身份证一致,否则将无法通过认证.";
    CGSize size=[discribStr boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    CGFloat top = 10;
    CGFloat height =size.height+36;
    [cerTools title:@"视频认证" font:17 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:YES];
    //认证说明
    top = height+top+10;
    NSDictionary *dict2 = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    NSString *discribStr2 = @"您上传的身份证扫描件需和您绑定的身份证一致,否则将无法通过认证.";
    CGSize size2=[discribStr2 boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    height =size2.height+36;
    [cerTools title:@"认证说明:" font:15 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:NO];
    //提交
    top = top+height+50;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"提交审核" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(20, top, WIDTH-40, 40);
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.backgroundColor = NAVCOLOR;
    [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.scrollView addSubview:btn];
    
    _scrollView.contentSize = CGSizeMake(WIDTH,top+50+SafeAreaTopHeight);
}
#pragma mark 提交审核
-(void)action:(UIButton *)btn{
    
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
