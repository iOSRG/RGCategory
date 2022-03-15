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
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas {
    
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.backgroundColor = [UIColor clearColor];
    if (fontName.length) {
        lable.font = [UIFont fontWithName:fontName size:fontSzie];
    }else {
        lable.font = [UIFont systemFontOfSize:fontSzie];
    }
    
    [supView addSubview:lable];
    if (labMas) {
        [lable mas_makeConstraints:labMas];
    }
    return lable;
    
}

+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    FontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas
{
    
    UILabel *lable = [self LableWithText:text textColor:textColor fontSize:fontSzie fontName:nil supView:supView lableMas:labMas];
    return lable;
    
}


+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
             regularFontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas {
    
    UILabel *lable = [self LableWithText:text textColor:textColor fontSize:fontSzie fontName:@"PingFangSC-Regular" supView:supView lableMas:labMas];
    return lable;
}

+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
              mediumFontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas {
    
    UILabel *lable = [self LableWithText:text textColor:textColor fontSize:fontSzie fontName:@"PingFangSC-Medium" supView:supView lableMas:labMas];
    return lable;
    
}

+(instancetype)lableWithCornerRadius:(CGFloat)cornerRadius
                       textAlignment:(NSTextAlignment)textAlignment
                     backgroundColor:(UIColor *)backgroundColor
                                text:(NSString *)text
                           textColor:(UIColor *)textColor
                            fontSize:(CGFloat)fontSzie
                            fontName:(NSString *)fontName
                             supView:(UIView *)supView
                            lableMas:(void(^)(MASConstraintMaker *make))labMas {
    
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.textAlignment = textAlignment;
    if (fontName.length) {
        lable.font = [UIFont fontWithName:fontName size:fontSzie];
    }else {
        lable.font = [UIFont systemFontOfSize:fontSzie];
    }
    lable.backgroundColor = backgroundColor;
    lable.layer.cornerRadius = cornerRadius;
    lable.layer.masksToBounds = YES;
    [supView addSubview:lable];
    if (labMas) {
        [lable mas_makeConstraints:labMas];
    }
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
    UILabel *lable = [self lableWithCornerRadius:cornerRadius textAlignment:textAlignment backgroundColor:backgroundColor text:text textColor:textColor fontSize:fontSzie fontName:nil supView:supView lableMas:labMas];
    return lable;
    
}



@end
