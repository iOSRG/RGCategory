//
//  NSDate+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "NSDate+BaseExtension.h"

@implementation NSDate (BaseExtension)
-(BOOL)isThisYear
{
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    NSInteger currentYear=[calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSInteger selfYear=[calendar component:NSCalendarUnitYear fromDate:self];
    return currentYear==selfYear;
    
}


-(BOOL)isThisDay
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    NSDateComponents * current=  [ calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSDateComponents * selfDate=[ calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    
    
    return current.year==selfDate.year
    && current.month==selfDate.month
    && current.day==selfDate.day ;
}

-(BOOL)isYesterDay
{
    
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    fmt.dateFormat=@"yyyy-MM-dd";
    
    NSDate *currenDate=[fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    
    NSDate *selfDate=[fmt dateFromString:[fmt stringFromDate:self]];
    
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents * compont= [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:currenDate options:0];
    
    
    return compont.year==0
    && compont.month==0
    && compont.day==1;
}


//MARK: - 日期转时间字符串
- (NSString *)stringWithdateFormat:(NSString *)dateFormatString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormatString;
    NSString *dateString = [formatter stringFromDate:self];
    return dateString;
    
}

//MARK: - 给一个数，正数是以后n个月，负数是前n个月 ,获取几个月后的日期
- (NSDate *)priousorOrLaterDatewithMonth:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    //NSCalendarIdentifierGregorian  为公历,最正常的日历
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *targetDate = [calender dateByAddingComponents:comps toDate:self options:0];
    return targetDate;
}

//MARK: - 与现在对比, 1分钟前,1小时前等等
- (NSString *)timeStringCompareNow {
    
    NSTimeInterval  timeInterval = [self timeIntervalSinceNow];
    if (timeInterval < 0) { //已经发生了的时间
        timeInterval = -timeInterval;
    }
    
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
        
    }else if((temp = temp/24) <3){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }else{ //超过3天显示正常时间
        
        return [self stringWithdateFormat:@"YYYY-MM-dd"];
    }
    
    return result;
    
    
    return @"";
}

//MARK: - 时间戳转固定格式的时间字符串
+ (NSString *)dateStringWithTimeIntervalSince1970:(NSString *)timeInterval  DateFormat:(NSString *)dateFormat{
    if (dateFormat.length == 0 || [timeInterval integerValue] <= 0) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval integerValue]];
    NSString *dateString = [date stringWithdateFormat:dateFormat];
    return dateString;
}


//MARK: - 从某个时间到某个时间的年,月,日差值元素列表
+(NSDateComponents *)dateComponentsFromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate
{
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    
    NSDateComponents *dateComponents= [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:startingDate toDate:resultDate options:0];
    
    return dateComponents;
}

//MARK: - 返回当前时间的所有拆分元素
+(NSDateComponents *)componentsWithdate:(NSDate *)date
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    NSDateComponents *component=[calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date];
    
    return component;
}


//MARK: - 时间字符串转日期
+ (NSDate *)dateWithString:(NSString *)dateString  dateFormat:(NSString *)dateFormatString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormatString;
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

//MARK: - 是否是月末
- (BOOL)isLastDayForCurrentMonth {
    
    NSDate *nextDate = [self dateByAddingTimeInterval:24*60*60];
    return ![[nextDate stringWithdateFormat:@"MM"] isEqualToString:[self stringWithdateFormat:@"MM"]];
}

@end
