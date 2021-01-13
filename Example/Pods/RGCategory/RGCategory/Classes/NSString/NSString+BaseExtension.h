//
//  NSString+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/22.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSString *ClinkRange = @"linkRange";
static const NSString *ClinkText = @"linkText";

@interface NSString (BaseExtension)



///高度计算
-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;
///宽度计算
-(CGFloat)widthWithFontSize:(CGFloat)fontSize height:(CGFloat)height;
///size计算
-(CGSize)sizeWithFontSize:(CGFloat)fontSize height:(CGFloat)height  width:(CGFloat)width;
///MD5加密
- (NSString *)md5Encryption;

///JSON字符串转对象
-(id)objectFromJSONString;



///邮箱格式是否正确
- (BOOL)isEmail;
///身份证格式是否正确
- (BOOL)isIDCard;
///银行卡号是否正确
- (BOOL)isBankCard;
///电话号码是否正确
- (BOOL)isPhoneNum;

/**
 如果后台返回的价格不是字符串类型时,iOS端解析可能会有很多小数点,需要进行处理才能准确显示
 */
- (NSString *)dealPrice;

///时间戳转日期字符串
- (NSString *)dateStringWithFormat:(NSString *)dateFormat;
- (NSString *)dateString;

///识别文字里面的链接
- (NSArray<NSDictionary*> *)identificationLinks;

@end
