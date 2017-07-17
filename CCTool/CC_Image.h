//
//  CC_Image.h
//  HHSLive
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CC_Image : UIImage

+ (UIImage *)getJpgNamed:(NSString *)imageName;

+ (UIImage *)getPngNamed:(NSString *)imageName;

@end
