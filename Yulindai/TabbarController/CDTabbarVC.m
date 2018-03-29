//
//  CDTabbarVC.m
//  CustomTabbar
//
//  Created by Dong Chen on 2017/8/31.
//  Copyright © 2017年 Dong Chen. All rights reserved.
//

#import "CDTabbarVC.h"
#import "CDNavigationVC.h"
#import "CDTabBar.h"
#import "MyVC.h"
#import "HomeVC.h"
#import "LoanVC.h"
#import "InvestVC.h"

@interface CDTabbarVC ()
@property (nonatomic, strong) HomeVC *homeVC;
@property (nonatomic, strong) MyVC *myVC;
@property (nonatomic, strong) LoanVC *loanVC;
@property (nonatomic, strong) InvestVC *investVC;

@end

@implementation CDTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitView];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
//    [self InitMiddleView];
}
//
//- (void)InitMiddleView
//{
//    CDTabBar *tabBar = [[CDTabBar alloc] init];
//    [self setValue:tabBar forKey:@"tabBar"];
//        [tabBar setDidMiddBtn:^{
//        CDMiddleVC *vc = [[CDMiddleVC alloc] init];
//        CDNavigationVC *nav = [[CDNavigationVC alloc] initWithRootViewController:vc];
//        [self presentViewController:nav animated:YES completion:nil];
//    }];
//}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    //NSLog(@" --- %@", item.title);
   
}

- (void)InitView
{
//    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"首页",  @"投资",@"借款",@"账户"];
    NSArray *images = @[@"首页-icon", @"借出-icon",@"借款-icon",@"账户-icon"];
    NSArray *selectedImages = @[@"首页s-icon",  @"投资-icon",@"借款s-icon",@"账户s-icon"];
    HomeVC * homeVc = [[HomeVC alloc] init];
    self.homeVC = homeVc;
    MyVC * myVc = [[MyVC alloc] init];
    self.myVC = myVc;
    InvestVC * investVc = [[InvestVC alloc] init];
    self.investVC = investVc;
    LoanVC * loanVc = [[LoanVC alloc] init];
    self.loanVC = loanVc;
    
    NSArray *viewControllers = @[homeVc,investVc,loanVc ,myVc];
    for (int i = 0; i < viewControllers.count; i++)
    {
        UIViewController *childVc = viewControllers[i];
        [self setVC:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}

- (void)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    VC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CDNavigationVC *nav = [[CDNavigationVC alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
}

@end
