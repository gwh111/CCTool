//
//  CC_Image.m
//  HHSLive
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CC_Image.h"

@implementation CC_Image

+ (UIImage *)getJpgNamed:(NSString *)imageName{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"]];
}

+ (UIImage *)getPngNamed:(NSString *)imageName{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
}

@end
