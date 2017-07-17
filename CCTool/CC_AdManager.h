//
//  CC_AdManager.h
//  HHSLive
//
//  Created by apple on 2017/5/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CC_AdManagerDelegate <NSObject>

- (void)AdViewTapped:(id)infoDic;

@end

@interface CC_AdManager : NSObject

@property (nonatomic, weak) id <CC_AdManagerDelegate> delegate;

/** 初始化*/
- (void)initAdInView:(UIView *)view;
/** adImageUrl
 添加地址后刷新
 [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"adImageUrl"];
 [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"adImageDic"];
 */
- (void)addAdView;

@end
