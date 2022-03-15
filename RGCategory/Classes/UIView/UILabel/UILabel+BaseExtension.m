//
//  UILabel+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UILabel+BaseExtension.h"

static NSInteger const DefaultFontSize = 17;

@implementation UILabel (BaseExtension)

+(instancetype)Lable{
    
    UILabel *lable = [[self alloc]init];
    lable.backgroundColor = [UIColor clearColor];
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:DefaultFontSize];
    lable.clipsToBounds = YES;
    return lable;
}

+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName
                    textAlignment:(NSTextAlignment)textAlignment
                CornerRadius:(CGFloat)cornerRadius
             backgroundColor:(UIColor *)backgroundColor {
    
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.textAlignment = textAlignment;
    if (cornerRadius > 0) {
        lable.layer.cornerRadius = cornerRadius;
        lable.layer.masksToBounds = YES;
    }
    if (fontName.length) {
        lable.font = [UIFont fontWithName:fontName size:fontSzie];
    }else {
        lable.font = [UIFont systemFontOfSize:fontSzie];
    }
    
    if (backgroundColor) {
        lable.backgroundColor = backgroundColor;
    }
    return lable;
    
    
}




+(instancetype)LableWithText:(NSString *)text  textColor:(UIColor *)textColor  FontSize:(NSInteger)fontSzie
{
    
    
    
    return [self lableWithText:text textColor:textColor fontSize:fontSzie fontName:nil textAlignment:NSTextAlignmentLeft CornerRadius:0 backgroundColor:nil];
}


+(instancetype)lableWithTextColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName
                    textAlignment:(NSTextAlignment)textAlignment {
    
    return [self lableWithText:nil textColor:textColor fontSize:fontSzie fontName:fontName textAlignment:textAlignment CornerRadius:0 backgroundColor:nil];
    
}


+(instancetype)lableWithtextColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName {
    return [self lableWithText:nil textColor:textColor fontSize:fontSzie fontName:fontName textAlignment:NSTextAlignmentLeft CornerRadius:0 backgroundColor:nil];
}


+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                    fontSize:(CGFloat)fontSzie
                    fontName:(NSString *)fontName {
    
    return [self lableWithText:text textColor:textColor fontSize:fontSzie fontName:fontName textAlignment:NSTextAlignmentLeft CornerRadius:0 backgroundColor:nil];
}



+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
             regularFontSize:(CGFloat)fontSzie {
    
    return [self lableWithText:text textColor:textColor fontSize:fontSzie fontName:@"PingFangSC-Regular" textAlignment:NSTextAlignmentLeft CornerRadius:0 backgroundColor:nil];
}
                     

+(instancetype)lableWithText:(NSString *)text
                   textColor:(UIColor *)textColor
              mediumFontSize:(CGFloat)fontSzie {
    
    return [self lableWithText:text textColor:textColor fontSize:fontSzie fontName:@"PingFangSC-Medium" textAlignment:NSTextAlignmentLeft CornerRadius:0 backgroundColor:nil];
    
}








@end
