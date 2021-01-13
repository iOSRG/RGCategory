//
//  UILabel+MAS.m
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import "UILabel+MAS.h"

@implementation UILabel (MAS)

+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    FontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas
{
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.font = [UIFont systemFontOfSize:fontSzie];
    lable.backgroundColor = [UIColor clearColor];
    [supView addSubview:lable];
    [lable mas_makeConstraints:labMas];
    
    return lable;
    
}

+(instancetype)LableWithCornerRadius:(CGFloat)cornerRadius
                       textAlignment:(NSTextAlignment)textAlignment
                     backgroundColor:(UIColor *)backgroundColor
                                Text:(NSString *)text
                           textColor:(UIColor *)textColor
                            FontSize:(CGFloat)fontSzie
                             supView:(UIView *)supView
                            lableMas:(void(^)(MASConstraintMaker *make))labMas
{
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.textAlignment = textAlignment;
    lable.font = [UIFont systemFontOfSize:fontSzie];
    lable.backgroundColor = backgroundColor;
    lable.layer.cornerRadius = cornerRadius;
    lable.layer.masksToBounds = YES;
    [supView addSubview:lable];
    [lable mas_makeConstraints:labMas];
    
    return lable;
    
}

+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
             regularFontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas {
    
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSzie];
    lable.backgroundColor = [UIColor clearColor];
    [supView addSubview:lable];
    [lable mas_makeConstraints:labMas];
    
    return lable;
}

+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
              mediumFontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas {
    
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSzie];
    lable.backgroundColor = [UIColor clearColor];
    [supView addSubview:lable];
    [lable mas_makeConstraints:labMas];
    return lable;
    
}


@end
