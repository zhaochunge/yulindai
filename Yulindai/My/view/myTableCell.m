//
//  myTableCell.m
//  Yulindai
//
//  Created by zcg on 2018/4/12.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "myTableCell.h"

@implementation myTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.img = [UIImageView new];
    [self.contentView addSubview:_img];
    self.titleLab = [UILabel new];
    [self.contentView addSubview:_titleLab];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.top.mas_offset(@8);
        make.bottom.mas_offset(@-8);
        make.width.mas_equalTo(30);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_img.mas_right).mas_offset(@10);
        make.width.mas_equalTo(@200);
        make.top.mas_offset(@5);
        make.bottom.mas_offset(@-5);
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
