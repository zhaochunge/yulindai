//
//  ChooseCollectionCell.m
//  Yulindai
//
//  Created by zcg on 2018/4/2.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ChooseCollectionCell.h"

@implementation ChooseCollectionCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupUI];
    }
    
    return self;
}
-(void)setupUI{
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.layer.borderWidth = 1;
    self.btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.cornerRadius = 5;
    [self.btn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    [self addSubview:_btn];
    [self.btn setBackgroundColor:[UIColor whiteColor]];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(0);   // 对当前view的top进行约束,距离参照view的上边界是 :
        make.left.equalTo(self.contentView).with.offset(0);  // 对当前view的left进行约束,距离参照view的左边界是 :
        make.height.equalTo(@30);                // 高度
        make.right.equalTo(self.contentView).with.offset(0); // 对当前view的right进行约束,距离参照view的右边界是 :
    }];
}
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect rect = [self.btn.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 40) options:NSStringDrawingTruncatesLastVisibleLine|   NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil];
    rect.size.width +=18;
    rect.size.height+=18;
    attributes.frame = rect;
    return attributes;
    
}
@end
