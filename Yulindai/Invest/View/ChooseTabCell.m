//
//  ChooseTabCell.m
//  Yulindai
//
//  Created by zcg on 2018/3/30.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "ChooseTabCell.h"
#import "ChooseCollectionCell.h"

@implementation ChooseTabCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //根据自己的需求设置宽高
    [_flowLayout setItemSize:CGSizeMake(self.frame.size.width, 300)];
    //竖直滑动
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //内边距，列、行间距
    _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _flowLayout.minimumInteritemSpacing = 10;
    _flowLayout.minimumLineSpacing = 10;
    _flowLayout.estimatedItemSize = CGSizeMake(20, 40);
    self.collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_flowLayout];
    self.collection.scrollEnabled = NO;
    [self addSubview:_collection];
    _collection.backgroundColor = [UIColor whiteColor];
    [_collection registerClass:[ChooseCollectionCell class] forCellWithReuseIdentifier:@"collectionReuse"];
    
    
}
- (void)setCellContent:(NSArray *)arr andIsShow:(BOOL)isShow andCellIndexPath:(NSIndexPath *)indexPath{
    if(_collection){
        [_collection removeFromSuperview];
    }
    [self setupUI];

}

//- (void)setCellContent:(NSArray *)arr andIsShow:(BOOL)isShow andCellIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
//    CGFloat h = 10;//用来控制button距离父视图的高
//    for (int i = 0; i < arr.count; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//        button.tag = 100 + i;
//        button.layer.cornerRadius = 10;
//        button.layer.masksToBounds = YES;
//        button.layer.borderWidth = 1;
//        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
//        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        //根据计算文字的大小
//
//        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
//        CGFloat length = [arr[i] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
//        //为button赋值
//        [button setTitle:arr[i] forState:UIControlStateNormal];
//        //设置button的frame
//        button.frame = CGRectMake(20 + w, h, length + 25 , 30);
//        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
//        if(20 + w + length + 25 > 320){
//            w = 0; //换行时将w置为0
//            h = h + button.frame.size.height + 10;//距离父视图也变化
//            button.frame = CGRectMake(20 + w, h, length + 25, 30);//重设button的frame
//        }
//        w = button.frame.size.width + button.frame.origin.x;
//        [self addSubview:button];
//    }
//}
//-(void)setupUI{
//    NSArray *arr = @[@"无知",@"风云变幻",@"唉",@"呵呵哒",@"快看看",@"窿窿啦啦",@"呵呵呵"];
//    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
//    CGFloat h = 10;//用来控制button距离父视图的高
//    for (int i = 0; i < arr.count; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//        button.tag = 100 + i;
//        button.layer.cornerRadius = 10;
//        button.layer.masksToBounds = YES;
//        button.layer.borderWidth = 1;
//        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
//        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        //根据计算文字的大小
//
//        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
//        CGFloat length = [arr[i] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
//        //为button赋值
//        [button setTitle:arr[i] forState:UIControlStateNormal];
//        //设置button的frame
//        button.frame = CGRectMake(20 + w, h, length + 25 , 30);
//        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
//        if(20 + w + length + 25 > 320){
//            w = 0; //换行时将w置为0
//            h = h + button.frame.size.height + 10;//距离父视图也变化
//            button.frame = CGRectMake(20 + w, h, length + 25, 30);//重设button的frame
//        }
//        w = button.frame.size.width + button.frame.origin.x;
//        [self addSubview:button];
//    }
//}
//
//- (void)handleClick:(UIButton *)btn{
//
//    [btn setTitleColor:NAVCOLOR forState:(UIControlStateNormal)];
//    btn.layer.borderColor = NAVCOLOR.CGColor;
//
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
