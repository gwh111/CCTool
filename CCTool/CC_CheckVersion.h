//
//  CC_CheckVersion.h
//  HHSLive
//
//  Created by apple on 2017/4/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_CheckVersion : NSObject

+ (void)requestVersionWithBundleId:(NSString *)bundle and:(void(^)(BOOL hasNewVersion))finish;

+ (void)requestVersion:(void(^)(BOOL hasNewVersion))finish;

@end
