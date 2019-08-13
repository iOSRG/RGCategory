//
//  NSString+AttributedString.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSString *AttributedRange = @"AttributedRange";
static const NSString *AttributedDic = @"AttributedDic";

@interface NSString (AttributedString)

///给attributedString添加range和attribute
- (NSMutableAttributedString *)attributedStringWithattributedArr:(NSArray<NSDictionary *>*)attributedArr;

///设置行间距
- (NSMutableAttributedString *)attributedStringForLineSpacing:(CGFloat)lineSpacing;
- (NSMutableAttributedString *)attributedStringForLineSpacing:(CGFloat)lineSpacing attributed:(NSDictionary *)attDic;

///设置中划线
- (NSMutableAttributedString *)deleteAttributedString;
- (NSMutableAttributedString *)deleteAttributedStringWithattributed:(NSDictionary *)attDic;
/*
 *  首行缩进几个字符
 *  pointSize : 字体大小
 *  len : 字符个数
 *  lineSpacing : 行间距
 */
- (NSMutableAttributedString *)paragraphStyleWithFont:(CGFloat)pointSize  len:(NSInteger)len lineSpacing:(CGFloat)lineSpacing;

/**部分Range文字下划线的属性设置*/
- (NSMutableAttributedString *)UnderlineStringWithDefalutAttributes:(NSDictionary *)defalutAtt   otherRange:(NSRange)range otherAttributes:(NSDictionary *)otherAttributes;

/**创建NSMutableAttributedString并设置属性*/
- (NSMutableAttributedString *)stringWithDefalutAttributes:(NSDictionary *)defalutAtt   otherRange:(NSRange)range otherAttributes:(NSDictionary *)otherAttributes;

@end
