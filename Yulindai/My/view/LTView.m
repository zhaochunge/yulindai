//
//  LTView.m
//  Yulindai
//
//  Created by zcg on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "LTView.h"

@implementation LTView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 80, 30)];
        [self addSubview:_titleLab];
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
        [self addSubview:_textField];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _titleLab.bottom+9, WIDTH-40, 1)];
        line.backgroundColor = LINECOLOR;
        [self addSubview:line];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
