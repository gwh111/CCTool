//
//  AppToolValidate.h
//  AppleToolProj
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_Validate : NSObject

/** 手机号码验证*/
+ (BOOL)validateMobile:(NSString *)mobileStr;
/** 邮箱*/
+ (BOOL)validateEmail:(NSString *)emailStr;

@end
