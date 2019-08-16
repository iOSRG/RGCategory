//
//  UICollectionView+MAS.h
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface UICollectionView (MAS)

+ (instancetype)CollectionViewWithFlowLayout:(UICollectionViewFlowLayout *)fl
                       delegateAndDataSource:(id)delAndDat
                              showsIndicator:(BOOL)show
                             backgroundColor:(UIColor *)backgroundColor
                                     supView:(UIView *)supView
                           CollectionViewMas:(void(^)(MASConstraintMaker *make))colMas;

+ (instancetype)CollectionViewWithCell:(Class)cell
                            FlowLayout:(UICollectionViewFlowLayout *)fl
                 delegateAndDataSource:(id)delAndDat
                        showsIndicator:(BOOL)show
                       backgroundColor:(UIColor *)backgroundColor
                               supView:(UIView *)supView
                     CollectionViewMas:(void(^)(MASConstraintMaker *make))colMas;


@end
