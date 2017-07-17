//
//  GetWeekendFromDate.m
//  JCZJ
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "CC_GetWeekendFromDate.h"

@implementation CC_GetWeekendFromDate

+(NSString*)getWeekDayStr:(NSDate *)nowDate
{
    NSString *weekDayStr = nil;
    
//    NSDate* now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps;
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:nowDate];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateFromComponents:comps];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    
    NSUInteger week = [weekdayComponents weekday];
    week++;NSLog(@"week=%lu",(unsigned long)week);
    switch (week) {
        case 8:
            weekDayStr = @"星期日";
            break;
        case 2:
            weekDayStr = @"星期一";
            break;
        case 3:
            weekDayStr = @"星期二";
            break;
        case 4:
            weekDayStr = @"星期三";
            break;
        case 5:
            weekDayStr = @"星期四";
            break;
        case 6:
            weekDayStr = @"星期五";
            break;
        case 7:
            weekDayStr = @"星期六";
            break;
        default:
            weekDayStr = @"";
            break;
    }
    return weekDayStr;
}

@end
