//
//  NSString+AttributedString.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)


- (NSMutableAttributedString *)attributedStringWithattributedArr:(NSArray< NSDictionary *>*)attributedArr {
    
    NSMutableAttributedString *attributedString = [self attributedStringWtihAttributed:nil];
    for (NSDictionary *attDic in attributedArr) {
        NSRange range = NSRangeFromString(attDic[AttributedRange]);
        NSDictionary *attributes = attDic[AttributedDic];
        [attributedString addAttributes:attributes range:range];
    }
    return attributedString;
}


//MARK: - 设置行间距
- (NSMutableAttributedString *)attributedStringForLineSpacing:(CGFloat)lineSpacing {
    
    if (!self.length) return [[NSMutableAttributedString alloc] init];
    NSMutableAttributedString *attributedString = [self attributedStringWtihAttributed:nil];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    return attributedString;
}

- (NSMutableAttributedString *)attributedStringForLineSpacing:(CGFloat)lineSpacing attributed:(NSDictionary *)attDic {
    
    if (!self.length) return [[NSMutableAttributedString alloc] init];
    
    NSMutableAttributedString *attributedString = [self attributedStringWtihAttributed:attDic];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    
    
    return attributedString;
    
}

- (NSMutableAttributedString *)deleteAttributedString {
    
    if (!self.length) return [[NSMutableAttributedString alloc] init];
    
    NSMutableAttributedString *attributedString = [self attributedStringWtihAttributed:nil];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value: [NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.length)];
    return attributedString;
}

- (NSMutableAttributedString *)deleteAttributedStringWithattributed:(NSDictionary *)attDic {
    
    if (!self.length) return [[NSMutableAttributedString alloc] init];
    
    NSMutableAttributedString *attributedString = [self attributedStringWtihAttributed:attDic];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value: [NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.length)];
    return attributedString;
    
}

- (NSMutableAttributedString *)underlineString {
    
    return [self underlineStringWithattributed:nil];
}
- (NSMutableAttributedString *)underlineStringWithattributed:(NSDictionary *)attDic {
    if (!self.length) return [[NSMutableAttributedString alloc] init];
    NSMutableAttributedString *attributedString = [self attributedStringWtihAttributed:attDic];
    [attributedString addAttributes:@{NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0, self.length)];
    return  attributedString;
}


- (NSMutableAttributedString *)paragraphStyleWithFont:(CGFloat)pointSize  len:(NSInteger)len lineSpacing:(CGFloat)lineSpacing{
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
    paraStyle01.headIndent = 0.0f;//行首缩进
    //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    CGFloat emptylen = pointSize * len;
    paraStyle01.firstLineHeadIndent = emptylen;//首行缩进
    paraStyle01.tailIndent = 0.0f;//行尾缩进
    paraStyle01.lineSpacing = lineSpacing;//行间距
    
    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    
    return attrText;
}



- (NSMutableAttributedString *)UnderlineStringWithDefalutAttributes:(NSDictionary *)defalutAtt   otherRange:(NSRange)range otherAttributes:(NSDictionary *)otherAttributes
{
    
    if (defalutAtt == nil) {
        
        defalutAtt = [NSDictionary dictionary];
    }
    
    if (otherAttributes == nil) {
        
        otherAttributes = [NSDictionary dictionary];
    }
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self attributes:defalutAtt];
    
    NSMutableDictionary *otherAttsDic = [NSMutableDictionary dictionaryWithDictionary:otherAttributes];
    
    otherAttsDic[NSUnderlineStyleAttributeName] = [NSNumber numberWithInteger:NSUnderlineStyleSingle];
    [attributeString setAttributes:otherAttsDic range:range];
    
    
    return attributeString;
}

- (NSMutableAttributedString *)stringWithDefalutAttributes:(NSDictionary *)defalutAtt   otherRange:(NSRange)range otherAttributes:(NSDictionary *)otherAttributes
{
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self attributes:defalutAtt];
    [attributeString setAttributes:otherAttributes range:range];
    
    return attributeString;
}

//MARK: - Private

- (NSMutableAttributedString *)attributedStringWtihAttributed:(NSDictionary *)attDic {
    NSMutableAttributedString *attributedString;
    if (attDic) {
        attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:attDic];
    }else{
        attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    }
    return attributedString;
}

@end
