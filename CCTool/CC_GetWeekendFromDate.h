//
//  GetWeekendFromDate.h
//  JCZJ
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_GetWeekendFromDate : NSObject

/** 把时间转换为星期*/
+ (NSString*)getWeekDayStr:(NSDate *)nowDate;

@end
