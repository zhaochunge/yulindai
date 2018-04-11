//
//  AboutMeViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "AboutMeViewController.h"

@interface AboutMeViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"关于我们";
    [self createUI];
    [self leftItem];
}

-(void)createUI{
    _webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    _webView.delegate=self;
    [self.view addSubview:_webView];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",@"https://www.baidu.com"]];
    
//    NSLog(@"url:%@",[NSString stringWithFormat:@"%@%@/id/%@",URL,getArchives,_model.ID]);
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
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
