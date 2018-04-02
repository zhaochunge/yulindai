//
//  ChooseTabCell.h
//  Yulindai
//
//  Created by zcg on 2018/3/30.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseTabCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
- (void)setCellContent:(NSArray *)arr andIsShow:(BOOL)isShow andCellIndexPath:(NSIndexPath *)indexPath;

@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;

@end
