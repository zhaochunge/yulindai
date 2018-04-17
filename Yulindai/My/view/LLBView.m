//
//  LLView.m
//  Yulindai
//
//  Created by zcg on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "LLBView.h"

@implementation LLBView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createView];
    }
    return self;
}

-(void)createView{
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 80, 30)];
    [self addSubview:_titleLab];
    self.chooseLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, WIDTH-170, 30)];
    _chooseLab.textColor = [UIColor lightGrayColor];
    [self addSubview:_chooseLab];
    self.sprBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sprBtn.frame = CGRectMake(WIDTH-70, 10, 30, 30);
    [_sprBtn setImage:[UIImage imageNamed:@"三角"] forState:(UIControlStateNormal)] ;
    [self addSubview:_sprBtn];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _titleLab.bottom+9, WIDTH-40, 1)];
    line.backgroundColor = LINECOLOR;
    [self addSubview:line];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
