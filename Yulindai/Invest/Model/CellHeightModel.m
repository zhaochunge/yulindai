//
//  CellHeightModel.m
//  Yulindai
//
//  Created by zcg on 2018/3/30.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "CellHeightModel.h"

@implementation CellHeightModel
+ (CGFloat)cellHeightWith:(NSArray *)contentArr andIsShow:(BOOL)isShow andLableWidth:(CGFloat)width andFont:(CGFloat)font andDefaultHeight:(CGFloat)defaultHeight andFixedHeight:(CGFloat)fixedHeight andIsShowBtn:(CGFloat)btnHeight
{
//    NSArray *arr = @[@"无知",@"风云变幻",@"唉",@"呵呵哒",@"快看看",@"窿窿啦啦",@"呵呵呵",@"djsk",@"电视剧"];
    NSString *arrStr;
    for (NSString *str in contentArr) {
        arrStr =[NSString stringWithFormat:@"%@%@",arrStr,str];
    }
//    NSLog(@"%@",arrStr);
    CGRect rect = [arrStr boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:28]} context:nil];
//    NSLog(@"%f",rect.size.height);
    if (rect.size.height > defaultHeight) {
        if (isShow) {
            return fixedHeight + btnHeight + rect.size.height;
        }else{
            return fixedHeight + btnHeight + defaultHeight;
        }
    } else {
        return 50;
    }
    
    return 100;
}
@end
