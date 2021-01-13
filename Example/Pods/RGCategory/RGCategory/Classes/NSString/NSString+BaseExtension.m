//
//  NSString+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/22.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "NSString+BaseExtension.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (BaseExtension)
//MARK: - 文字宽高计算
-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    
    return  [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size.height;
    
}

-(CGFloat)widthWithFontSize:(CGFloat)fontSize height:(CGFloat)height
{
    
    return  [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size.width;
}

-(CGSize)sizeWithFontSize:(CGFloat)fontSize height:(CGFloat)height  width:(CGFloat)width
{
    
    return  [self boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size;
    
}

//MARK: - Md5加密
- (NSString *)md5Encryption
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    
    const char *input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(input, (CC_LONG)(strlen(input)), result);
    
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",result[i]];
    }
    
    return output;
}
//MARK: - JSON字符串转对象
-(id)objectFromJSONString{
    
    NSAssert(!self, @"不能为空");
    if (!self || !self.length) {  return nil;  }
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id result =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    return error ? nil : result;
}

//MARK: - 正则校验
- (BOOL)isEmail
{
    if ([self length] == 0) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if (![emailTest evaluateWithObject:self]) {
        return NO;
    }
    return YES;
}


- (BOOL)isIDCard
{
    //长度不为18的都排除掉
    if (self.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:self];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}

- (BOOL)isBankCard {
    if (!self.length) {
        
        return NO;
    }
    NSString *cardNo = [self copy];
    
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[self length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}


- (BOOL)isPhoneNum {
    return [self isVerificationRegix:@"^\\d{11}$" content:self];
}


- (BOOL)isVerificationRegix:(NSString *)regix content:(NSString *)content{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regix];
    return  [predicate evaluateWithObject:content];
}

//MARK: - 价格精度校验
- (NSString *)dealPrice {
    
    if (!self.length) return @"";
    
    NSString *reviseString = [self revisePrice];
    
    if ([reviseString containsString:@"."]) {
        //去除小数点后面的00
        NSInteger intPrice = [reviseString integerValue];
        CGFloat floatPrice = [reviseString floatValue];
        
        if (intPrice == floatPrice) {
            return [NSString stringWithFormat:@"%ld",intPrice];
        }else{
            return reviseString;
        }
        
    }else{
        return reviseString;
    }
}


- (NSString *)revisePrice {
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [self doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

//MARK: - 时间戳转日期字符串
- (NSString *)dateStringWithFormat:(NSString *)dateFormat {
    if (!self.length) return @"";
    if (!dateFormat.length) dateFormat = @"yyyy.MM.dd";
    
    NSInteger dateSecond = [[self substringToIndex:10] integerValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateSecond];
    NSDateFormatter *fmatter = [[NSDateFormatter alloc] init];
    fmatter.dateFormat = dateFormat;
    NSString *dateStr = [fmatter stringFromDate:date];
    
    return dateStr;
}

- (NSString *)dateString {
    
    if (!self.length)  return @"";
    
    NSInteger dateSecond = [[self substringToIndex:10] integerValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateSecond];
    NSDateFormatter *fmatter = [[NSDateFormatter alloc] init];
    fmatter.dateFormat = @"yyyy.MM.dd";
    NSString *dateStr = [fmatter stringFromDate:date];
    return dateStr;
}

//MARK: - 识别文字里面的链接
- (NSArray<NSDictionary*> *)identificationLinks {
    
    NSString *text = self;
    if (!text.length) {
        return [NSMutableArray array];
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    NSError *error;
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    if (!error) {
        NSArray *arrayOfAllMatches = [regex matchesInString:text options:0 range:NSMakeRange(0, [text length])];
        for (NSTextCheckingResult *match in arrayOfAllMatches)
        {
            
            NSMutableDictionary *linkDic = [NSMutableDictionary dictionary];
            linkDic[ClinkRange] = NSStringFromRange(match.range);
            linkDic[ClinkText] = [text substringWithRange:match.range];
            [arr addObject:linkDic];
        }
    }
    return arr;
}


@end
