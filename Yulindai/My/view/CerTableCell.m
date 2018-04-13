//
//  CerTableCell.m
//  Yulindai
//
//  Created by zcg on 2018/4/12.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "CerTableCell.h"

@implementation CerTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.titleLab = [UILabel new];
    [self addSubview:_titleLab];
    self.status = [UILabel new];
    self.status.textColor = [UIColor lightGrayColor];
    [self addSubview:_status];
    self.upLab = [UILabel new];
    self.upLab.textAlignment = NSTextAlignmentRight;
    self.upLab.text = @"立即上传";
    _upLab.textColor = NAVCOLOR;
    [self addSubview:_upLab];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.top.mas_offset(@5);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@30);
    }];
    [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLab.mas_right).mas_offset(@10);
        make.top.mas_offset(@5);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@30);
    }];
    [self.upLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-20);
        make.height.mas_equalTo(@30);
        make.top.mas_offset(@5);
        make.width.mas_equalTo(@100);
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
