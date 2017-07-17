//
//  CC_GifManager.h
//  HHSLive
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_GifManager : NSObject

+ (instancetype)shareInstance;

- (void)addImageListNamed:(NSString *)name andList:(NSArray *)list;
- (NSArray *)getImageListNamed:(NSString *)name;

/** 获取动画*/
- (UIImageView *)getGifNamed:(NSString *)gifName withImageArray:(NSArray *)gifArr withframe:(CGRect)frame;
/** 获取自定义动画*/
- (UIImageView *)getGifNamed:(NSString *)gifName withImageArray:(NSArray *)gifArr withframe:(CGRect)frame andDuration:(double)duration andRepeatCount:(NSUInteger)repeatCount;

/** 停止动画
 移除gif时调用
 */
- (void)stopGifNamed:(NSString *)gifName;

- (void)stopAllGif;


@property(nonatomic,retain) NSMutableDictionary *gifImagesDic;///<图片缓存集合

@end
