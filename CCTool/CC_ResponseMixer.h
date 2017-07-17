//
//  ResponseMixer.h
//  AppleToolProj
//
//  Created by apple on 16/12/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_ResponseMixer : NSObject

/** 两个response结果合并*/
- (NSMutableDictionary *)makeTwoResultWithOne:(NSDictionary *)result1 andTwo:(NSDictionary *)result2;

@end
