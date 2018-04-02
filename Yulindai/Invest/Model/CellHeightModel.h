//
//  CellHeightModel.h
//  Yulindai
//
//  Created by zcg on 2018/3/30.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellHeightModel : NSObject
/*
 * contentStr：Lable内容
 * isShow：是否展开
 * width：Lable的宽度
 * font：字号
 * defaultHeight：默认高度，若大于该高度则显示展开收起按钮，低于该高度则正常显示文字高度
 * fixedHeight：其他控件固定高度
 * btnHeight：展开收起按钮高度
 */
+ (CGFloat)cellHeightWith:(NSArray *)contentArr andIsShow:(BOOL)isShow andLableWidth:(CGFloat)width andFont:(CGFloat)font andDefaultHeight:(CGFloat)defaultHeight andFixedHeight:(CGFloat)fixedHeight andIsShowBtn:(CGFloat)btnHeight;
@end
