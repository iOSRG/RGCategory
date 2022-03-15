//
//  NSAttributedString+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (BaseExtension)


/*
 注意计算富文本高度时,
 要指定富文本的字体大小,否则系统不知道按哪种大小计算富文本的高度
 */

///高度计算
-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;
///宽度计算
-(CGFloat)widthWithFontSize:(CGFloat)fontSize height:(CGFloat)height;
///size计算
-(CGSize)sizeWithFontSize:(CGFloat)fontSize height:(CGFloat)height  width:(CGFloat)width;


@end
