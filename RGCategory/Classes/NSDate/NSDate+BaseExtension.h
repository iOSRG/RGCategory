//
//  NSDate+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BaseExtension)

//MARK: - 对象方法

/**判断是否是今年*/
-(BOOL)isThisYear;
/**判断是否是今天*/
-(BOOL)isThisDay;
/**判断是否是昨天*/
-(BOOL)isYesterDay;

/**日期转时间字符串*/
- (NSString *)stringWithdateFormat:(NSString *)dateFormatString;

/**给一个数，正数是以后n个月，负数是前n个月 ,获取几个月后的日期*/
- (NSDate *)priousorOrLaterDatewithMonth:(NSInteger)month;

/**需要是一个准确的时间, 与现在对比, 1分钟前,1小时前等等*/
- (NSString *)timeStringCompareNow;

//MARK: - 类方法

/**时间字符串转日期*/
+ (NSDate *)dateWithString:(NSString *)dateString  dateFormat:(NSString *)dateFormatString;

/**时间戳转固定格式的时间字符串*/
+ (NSString *)dateStringWithTimeIntervalSince1970:(NSString *)timeInterval
                                       DateFormat:(NSString *)dateFormat;

/**从某个时间到某个时间的年,月,日差值元素列表*/
+(NSDateComponents *)dateComponentsFromDate:(NSDate *) startingDate toDate:(NSDate *)resultDate;

/** 返回当前时间的所有拆分元素*/
+(NSDateComponents *)componentsWithdate:(NSDate *)date;

/**是否是月末*/
- (BOOL)isLastDayForCurrentMonth;

@end
