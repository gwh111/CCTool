//
//  CC_Loading.h
//  HHSLive
//
//  Created by apple on 2017/4/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CC_Loading : UIView

+ (instancetype)shareInstance;

- (void)showLoadingInView:(UIView *)view;

- (void)hiddenLoading;

@end
