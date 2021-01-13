//
//  UILabel+MAS.h
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface UILabel (MAS)

+(instancetype)LableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    FontSize:(CGFloat)fontSzie
                     supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas;

/**带圆角和背景颜色的lable*/
+(instancetype)LableWithCornerRadius:(CGFloat)cornerRadius
                       textAlignment:(NSTextAlignment)textAlignment
                     backgroundColor:(UIColor *)backgroundColor
                                Text:(NSString *)text
                           textColor:(UIColor *)textColor
                            FontSize:(CGFloat)fontSzie
                             supView:(UIView *)supView
                    lableMas:(void(^)(MASConstraintMaker *make))labMas;


@end
