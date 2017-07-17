//
//  AppToolObject.h
//  AppleToolProj
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 二进制颜色*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0x00FF0000) >> 16)) / 255.0     \
green:((float)((rgbValue & 0x0000FF00) >>  8)) / 255.0     \
blue:((float)((rgbValue & 0x000000FF) >>  0)) / 255.0     \
alpha:1.0]
/** rgb颜色*/
#define RGBCOLOR [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1]
#define COLOR_NAVBAR [UIColor colorWithRed:228/255.0f green:45/255.0f blue:39/255.0f alpha:1]
#define COLOR_TEXT [UIColor colorWithRed:25/255.0f green:25/255.0f blue:25/255.0f alpha:1]
#define COLOR_BOTTOM [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
/** 获取屏幕 宽度、高度*/
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/** 获取系统版本*/
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
/** 简写*/
#define UIF(f) [UIFont systemFontOfSize:f]
#define UIIMAGE(a) [UIImage imageNamed:a]

/** 特殊字符串*/
#import "CC_AttributedStr.h"
/** 延迟按钮*/
#import "CC_Button.h"
/** 常用代码*/
#import "CC_CodeLib.h"
/** 字典转字符串*/
#import "CC_FormatDic.h"
/** md5签名*/
#import "CC_MD5Object.h"
/** 条件验证*/
#import "CC_Validate.h"
/** 大数字格式化*/
#import "CC_FormatDic.h"
/** 转换为星期*/
#import "CC_GetWeekendFromDate.h"
/** 两个相同结构字典合并*/
#import "CC_ResponseMixer.h"
/** 发布时间*/
#import "CC_Time.h"
/** 布局调整*/
#import "CC_UIViewExt.h"
/** 格式化数字*/
#import "CC_FormatNumber.h"
/** 黑底白字提示（自动消失）*/
#import "CC_NoticeView.h"
/** */

#import "CC_GHttpSessionTask.h"

#import "CC_Image.h"

#import "CC_GifManager.h"

#import "CC_LoadingView.h"

#import "CC_Loading.h"

#import "CC_CheckVersion.h"

#import "CC_ICInfomationView_Runtime.h"

#import "CC_AdManager.h"

@interface CC_ToolObject : NSObject

@end
