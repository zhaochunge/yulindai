//
//  ListTabCell.m
//  Yulindai
//
//  Created by zcg on 2018/3/29.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ListTabCell.h"

@implementation ListTabCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.img = [UIImageView new];
    self.img.layer.cornerRadius = 15;
    self.img.layer.masksToBounds = YES;
    self.img.backgroundColor = ORANGECOLOR;
    [self addSubview:_img];
    self.titleLab = [UILabel new];
    [self addSubview:_titleLab];
    self.line = [UIView new];
    _line.backgroundColor = LINECOLOR;
    [self addSubview:_line];
    self.presentLab = [UILabel new];
    self.presentLab.textColor = ORANGECOLOR;
    self.presentLab.font = [UIFont systemFontOfSize:25 weight:0.5];
    [self addSubview:_presentLab];
    self.lilvLab = [UILabel new];
    _lilvLab.textColor = GARYCOLOR;
    _lilvLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:_lilvLab];
    self.timeLab = [UILabel new];
    [self addSubview:_timeLab];
//    self.timeLab.font = [UIFont systemFontOfSize:18];
    self.timeLab.adjustsFontSizeToFitWidth = YES;
    self.discribeLab = [UILabel new];
    _discribeLab.textColor = GARYCOLOR;
    _discribeLab.font = [UIFont systemFontOfSize:16];
    _discribeLab.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_discribeLab];
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn setTitle:@"立即投资" forState:(UIControlStateNormal)];
    [_btn setBackgroundColor:ORANGECOLOR];
    [_btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    _btn.layer.cornerRadius = 10;
    _btn.layer.masksToBounds = YES;
    [self addSubview:_btn];
    self.line2 = [UIView new];
    [self addSubview:_line2];
    _line2.backgroundColor = LINECOLOR;
    _titleLab.text = @"供应链金融";
    _presentLab.text = @"9.3%";
    _lilvLab.text = @"年利率";
    _timeLab.text = @"投资期限12个月";
    _discribeLab.text = @"每月付息,到期还本";
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.top.mas_offset(@15);
        make.width.mas_equalTo(@30);
        make.height.mas_equalTo(@30);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_img.mas_right).mas_offset(@20);
        make.top.mas_offset(@15);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@200);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.height.mas_equalTo(@2);
        make.top.mas_equalTo(_img.mas_bottom).mas_offset(@10);
    }];
    [self.presentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.top.mas_equalTo(_line.mas_bottom).mas_offset(20);
        make.width.mas_equalTo(WIDTH/10*3-20);
        make.height.mas_equalTo(@30);
    }];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(WIDTH/10*3);
        make.width.mas_equalTo(WIDTH/5*2);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(_line.mas_bottom).mas_offset(@20);
    }];
    [self.lilvLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_presentLab.mas_left);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@100);
        make.top.mas_equalTo(_presentLab.mas_bottom).mas_offset(@0);
    }];
    [self.discribeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_timeLab.mas_left);
        make.top.mas_equalTo(_timeLab.mas_bottom).mas_offset(@0);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(_timeLab.mas_width);
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-20);
        make.top.mas_equalTo(_line.mas_bottom).mas_equalTo(@35);
        make.height.mas_equalTo(@35);
        make.width.mas_equalTo(WIDTH/25*6);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.height.mas_equalTo(@10);
        make.right.mas_offset(0);
        make.bottom.mas_offset(@0);
    }];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
