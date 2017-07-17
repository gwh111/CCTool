//
//  Time.m
//  TimeLabelTest
//
//  Created by mac on 15/11/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "CC_Time.h"

@implementation CC_Time

+ (NSDateFormatter *)dateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [dateFormatter setTimeZone:GTMzone];
    return dateFormatter;
}

+(NSString *)getTimeStringWithNowDate:(NSString *)nowDateStr OldDate:(NSString *)oldDateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    NSDate *nowDate = [dateFormatter dateFromString:nowDateStr];
    NSDate *oldDate = [dateFormatter dateFromString:oldDateStr];
    
    NSTimeInterval now = [nowDate timeIntervalSince1970];
    NSTimeInterval old = [oldDate timeIntervalSince1970];
    
//    NSString *yearStr = [oldDateStr substringWithRange:NSMakeRange(0, 4)];
//    int year = [yearStr intValue];
//    int yearDay = ((year % 4 == 0 && year % 400 != 0) || year % 400 == 0)?366:365;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *nowComps ;
    nowComps = [calendar components:unitFlags fromDate:nowDate];
    NSDateComponents *oldComps ;
    oldComps = [calendar components:unitFlags fromDate:oldDate];
    
    NSString *returnStr ;
    
    if ( !(nowComps.year==oldComps.year) )
    {
        if (nowComps.year == oldComps.year + 1)
        {
            if (nowComps.month == 1 && oldComps.month == 12)
            {
                if (nowComps.day == 1 && oldComps.day == 31)
                {
                    if (now - old > 60 *60) {
                        returnStr = @"昨天";
                    }
                    else if (now - old > 60)
                    {
                        returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];
                    }
                    else if (now - old >= 0)
                    {
                        returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];
                    }
                    else returnStr = [NSString stringWithFormat:@"%d秒前",0];
                }
                else
                {
                    returnStr = [oldDateStr substringWithRange:NSMakeRange(0, 10)];//xxxx-xx-xx
                }
            }
            else
            {
                returnStr = [oldDateStr substringWithRange:NSMakeRange(0, 10)];//xxxx-xx-xx
            }
        }
        else
        {
            returnStr = [oldDateStr substringWithRange:NSMakeRange(0, 10)];//xxxx-xx-xx
        }
    }
    else if (nowComps.month != oldComps.month)
    {
        if (nowComps.month == oldComps.month + 1)
        {
            if (oldComps.month == 1 || oldComps.month == 3 || oldComps.month == 5 || oldComps.month == 7 || oldComps.month == 8 || oldComps.month == 10 || oldComps.month == 12 )
            {
                if (nowComps.day == 1 && oldComps.day == 31)
                {
                    if (now - old > 60 *60) {
                        returnStr = @"昨天";
                    }
                    else if (now - old > 60)
                    {
                        returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];
                    }
                    else if (now - old >= 0)
                    {
                        returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];
                    }
                    else returnStr = [NSString stringWithFormat:@"%d秒前",0];
                }
                else returnStr = [oldDateStr substringWithRange:NSMakeRange(5, 5)];//xx-xx
                
            }
            else if (oldComps.month == 2)
            {
                if ((oldComps.year % 4 == 0 && oldComps.year % 100 != 0) ||oldComps.year % 400 == 0)
                {
                    if (nowComps.day == 1 && oldComps.day == 29)
                    {
                        if (now - old > 60 *60) {
                            returnStr = @"昨天";
                        }
                        else if (now - old > 60)
                        {
                            returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];
                        }
                        else if (now - old >= 0)
                        {
                            returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];
                        }
                        else returnStr = [NSString stringWithFormat:@"%d秒前",0];
                    }
                    else returnStr = [oldDateStr substringWithRange:NSMakeRange(5, 5)];//xx-xx
                }
                else
                {
                    if (nowComps.day == 1 && oldComps.day == 28)
                    {
                        if (now - old > 60 *60) {
                            returnStr = @"昨天";
                        }
                        else if (now - old > 60)
                        {
                            returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];
                        }
                        else if (now - old >= 0)
                        {
                            returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];
                        }
                        else returnStr = [NSString stringWithFormat:@"%d秒前",0];
                    }
                    
                   else returnStr = [oldDateStr substringWithRange:NSMakeRange(5, 5)];//xx-xx
                }
            }
            else
            {
                if (nowComps.day == 1 && oldComps.day == 30)
                {
                    if (now - old > 60 *60) {
                        returnStr = @"昨天";
                    }
                    else if (now - old > 60)
                    {
                        returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];
                    }
                    else if (now - old >= 0)
                    {
                        returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];
                    }
                    else returnStr = [NSString stringWithFormat:@"%d秒前",0];
                }
                
                else returnStr = [oldDateStr substringWithRange:NSMakeRange(5, 5)];//xx-xx
                
            }
        }
        else
        {
            returnStr = [oldDateStr substringWithRange:NSMakeRange(5, 5)];//xx-xx
        }
    }
    else if (nowComps.day != oldComps.day)
    {
        if (nowComps.day == oldComps.day + 1)
        {
            if (now - old > 60 *60) {
                returnStr = @"昨天";
            }
            else if (now - old > 60)
            {
                returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];
            }
            else if (now - old >= 0)
            {
                returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];
            }
            else returnStr = [NSString stringWithFormat:@"%d秒前",0];
        }
        else
        {
            returnStr = [oldDateStr substringWithRange:NSMakeRange(5, 5)];//xx-xx
        }
    }
    else if ( now - old>= 60*60) {
        returnStr = [oldDateStr substringWithRange:NSMakeRange(11, 5)];//xx:xx
    }
    else if ( now - old >= 60)
        returnStr = [NSString stringWithFormat:@"%d分钟前",(int)(now - old)/60];//xx分钟前
    else if (now -old >= 0){
        returnStr = [NSString stringWithFormat:@"%d秒前",(int)(now - old)];//xx秒前
    }
    else{
         returnStr = [NSString stringWithFormat:@"%d秒前",0];
    }
//    else return 0;

    return returnStr;
}


@end



#define CURRENT_CALENDAR [NSCalendar currentCalendar]
#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay  |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)


@implementation NSDate (Category)

+ (NSDate *)dp_dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [formatter setDateFormat:format];
    return [formatter dateFromString:string];
}


- (int)dp_day
{
    NSDateComponents * components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return (int)components.day;
}

- (int)dp_month
{
    NSDateComponents * components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return (int)components.month;
}
@end
