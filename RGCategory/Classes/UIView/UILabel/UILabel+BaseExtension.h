//
//  UILabel+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BaseExtension)

+(instancetype)Lable;

+(instancetype)LableWithText:(NSString *)text  textColor:(UIColor *)textColor  FontSize:(NSInteger)fontSzie;


+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName
                    textAlignment:(NSTextAlignment)textAlignment
                CornerRadius:(CGFloat)cornerRadius
             backgroundColor:(UIColor *)backgroundColor;


+(instancetype)lableWithTextColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName
                    textAlignment:(NSTextAlignment)textAlignment;


+(instancetype)lableWithtextColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                         fontName:(NSString *)fontName;


+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName;



+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
             regularFontSize:(CGFloat)fontSzie;
                     

+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
              mediumFontSize:(CGFloat)fontSzie;


@end
