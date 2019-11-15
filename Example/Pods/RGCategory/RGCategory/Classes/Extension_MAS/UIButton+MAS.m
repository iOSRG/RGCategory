//
//  UIButton+MAS.m
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import "UIButton+MAS.h"

@implementation UIButton (MAS)

#pragma mark - 正常的文字、颜色、字体

+(instancetype)ButtonWithNormalTitle:(NSString *)normalTitle
                    NormalTitleColor:(UIColor *)NormalTitleColor
                            FontSize:(CGFloat)FontSize
                     backgroundColor:(UIColor *)backgroundColor
                             supView:(UIView *)supView
                           buttonMas:(void(^)(MASConstraintMaker *make))btnMas
{  
    UIButton *button = [[self alloc]init];
    button.backgroundColor = backgroundColor;
    button.titleLabel.font = [UIFont systemFontOfSize:FontSize];
    [button  setTitle:normalTitle forState:UIControlStateNormal];
    [button  setTitleColor:NormalTitleColor forState:UIControlStateNormal];
    [supView addSubview:button];
    [button mas_makeConstraints:btnMas];
    return button;
    
}

#pragma mark - 包含正常和选中的文字、颜色、字体
+(instancetype)ButtonWithselectTitle:(NSString *)selectTitle
                    selcetTitleColor:(UIColor *)selectTitleColor
                         NormalTitle:(NSString *)normalTitle
                    NormalTitleColor:(UIColor *)NormalTitleColor
                     backgroundColor:(UIColor *)backgroundColor
                            FontSize:(CGFloat)FontSize
                             supView:(UIView *)supView
                           buttonMas:(void(^)(MASConstraintMaker *make))btnMas
{

    UIButton *button = [UIButton ButtonWithNormalTitle:normalTitle NormalTitleColor:NormalTitleColor FontSize:FontSize backgroundColor:backgroundColor supView:supView buttonMas:btnMas];
    [button  setTitle:selectTitle forState:UIControlStateSelected];
    [button  setTitleColor:selectTitleColor forState:UIControlStateSelected];
    return button;
}

#pragma mark - 包含正常和选中的文字、颜色、字体
+(instancetype)ButtonWithSelectedImage:(UIImage *)selectedImage
                           NormalImage:(UIImage *)normalImage
                     backgroundColor:(UIColor *)backgroundColor
                             supView:(UIView *)supView
                           buttonMas:(void(^)(MASConstraintMaker *make))btnMas
{
    UIButton *button = [[self alloc]init];
    button.backgroundColor = backgroundColor;
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [supView addSubview:button];
    [button mas_makeConstraints:btnMas];
    return button;
}

#pragma mark - 只有一张正常的图片
+(instancetype)ButtonWithNormalImage:(UIImage *)normalImage
                     backgroundColor:(UIColor *)backgroundColor
                             supView:(UIView *)supView
                           buttonMas:(void(^)(MASConstraintMaker *make))btnMas
{
    UIButton *button = [[self alloc]init];
    button.backgroundColor = backgroundColor;
    [button setImage:normalImage forState:UIControlStateNormal];
    [supView addSubview:button];
    [button mas_makeConstraints:btnMas];
    return button;
    
}


@end
