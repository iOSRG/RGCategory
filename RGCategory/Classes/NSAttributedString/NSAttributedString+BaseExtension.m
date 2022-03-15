//
//  NSAttributedString+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "NSAttributedString+BaseExtension.h"

@implementation NSAttributedString (BaseExtension)

//MARK: - 文字宽高计算
-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    
    return  [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.height;
    
}

-(CGFloat)widthWithFontSize:(CGFloat)fontSize height:(CGFloat)height
{
    
    return  [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.width;
}

-(CGSize)sizeWithFontSize:(CGFloat)fontSize height:(CGFloat)height  width:(CGFloat)width
{
    
    return  [self boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
}

@end
