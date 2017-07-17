//
//  CC_LoadingView.h
//  HHSLive
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CC_LoadingView : UIView

+ (instancetype)shareInstance;

- (void)startAnimating;

- (void)stopAnimating;

- (void)showLoadingInView:(UIView *)view;
- (void)hiddenLoading;

@end
