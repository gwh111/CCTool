//
//  Time.h
//  TimeLabelTest
//
//  Created by mac on 15/11/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_Time : NSObject


+(NSString *)getTimeStringWithNowDate:(NSString*)nowDateStr OldDate:(NSString *)oldDateStr;//返回 @“x秒前” 、@“x分钟前”、@“xx:xx”、@“昨天”、@“月-日”、@“年-月-日”


@end

@interface NSDate (Category)

@property (nonatomic, assign, readonly) int dp_day;
@property (nonatomic, assign, readonly) int dp_month;

+ (NSDate *)dp_dateFromString:(NSString *)string withFormat:(NSString *)format  ;


@end
