//
//  SafeguardViewController.m
//  Yulindai
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "SafeguardViewController.h"

@interface SafeguardViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation SafeguardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title=_selfTitle;
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createUI];
    [self leftItem];
    
}

-(void)createUI{
    _webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    _webView.delegate=self;
    [self.view addSubview:_webView];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",_url]];
    
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
