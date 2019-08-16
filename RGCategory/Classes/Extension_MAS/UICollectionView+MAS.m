//
//  UICollectionView+MAS.m
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import "UICollectionView+MAS.h"

@implementation UICollectionView (MAS)

+ (instancetype)CollectionViewWithFlowLayout:(UICollectionViewFlowLayout *)fl
                       delegateAndDataSource:(id)delAndDat
                              showsIndicator:(BOOL)show
                             backgroundColor:(UIColor *)backgroundColor
                                     supView:(UIView *)supView
                           CollectionViewMas:(void(^)(MASConstraintMaker *make))colMas
{

    UICollectionView *col = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fl];
    col.delegate = delAndDat;
    col.dataSource = delAndDat;
    col.showsVerticalScrollIndicator = show;
    col.showsHorizontalScrollIndicator = show;
    col.backgroundColor = backgroundColor;
    [supView addSubview:col];
    [col mas_makeConstraints:colMas];
    return col;
    
}

+ (instancetype)CollectionViewWithCell:(Class)cell
                            FlowLayout:(UICollectionViewFlowLayout *)fl
                 delegateAndDataSource:(id)delAndDat
                        showsIndicator:(BOOL)show
                       backgroundColor:(UIColor *)backgroundColor
                               supView:(UIView *)supView
                     CollectionViewMas:(void(^)(MASConstraintMaker *make))colMas
{
    UICollectionView *col = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fl];
    col.delegate = delAndDat;
    col.dataSource = delAndDat;
    col.showsVerticalScrollIndicator = show;
    col.showsHorizontalScrollIndicator = show;
    col.backgroundColor = backgroundColor;
    [supView addSubview:col];
    [col mas_makeConstraints:colMas];
    [col registerClass:cell forCellWithReuseIdentifier:NSStringFromClass(cell)];
    
    return col;
    
}


@end
