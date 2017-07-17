//
//  CC_GifManager.m
//  HHSLive
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CC_GifManager.h"

@interface CC_GifManager(){
    NSMutableDictionary *gifDic;
}

@end
@implementation CC_GifManager

static CC_GifManager *gif = nil;
static dispatch_once_t onceToken;

+ (instancetype)shareInstance
{
    dispatch_once(&onceToken, ^{
        gif = [[CC_GifManager alloc] init];
    });
    return gif;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        gifDic=[[NSMutableDictionary alloc]init];
        _gifImagesDic=[[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)addImageListNamed:(NSString *)name andList:(NSArray *)list{
    [gifDic setObject:list forKey:name];
}
- (NSArray *)getImageListNamed:(NSString *)name{
    if (![gifDic objectForKey:name]) {
        return nil;
    }
    return [gifDic objectForKey:name];
}

- (UIImageView *)getGifNamed:(NSString *)gifName withImageArray:(NSArray *)gifArr withframe:(CGRect)frame{
    if ([gifDic objectForKey:gifName]) {
        UIImageView *imageV=[gifDic objectForKey:gifName];
        imageV.frame=frame;
        [imageV startAnimating];
        return imageV;
    }else{
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:frame];
        imageV.animationImages=gifArr;
        [imageV startAnimating];
        return imageV;
    }
}

- (UIImageView *)getGifNamed:(NSString *)gifName withImageArray:(NSArray *)gifArr withframe:(CGRect)frame andDuration:(double)duration andRepeatCount:(NSUInteger)repeatCount{
    if ([gifDic objectForKey:gifName]) {
        UIImageView *imageV=[gifDic objectForKey:gifName];
        imageV.frame=frame;
        imageV.animationImages=gifArr;
        imageV.animationDuration=duration;
        imageV.animationRepeatCount=repeatCount;
        [imageV startAnimating];
        return imageV;
    }else{
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:frame];
        imageV.animationImages=gifArr;
        imageV.animationDuration=duration;
        imageV.animationRepeatCount=repeatCount;
        [imageV startAnimating];
        [gifDic setObject:imageV forKey:gifName];
        return imageV;
    }
}

- (void)stopGifNamed:(NSString *)gifName{
    if ([gifDic objectForKey:gifName]) {
        UIImageView *imageV=[gifDic objectForKey:gifName];
        [imageV stopAnimating];
        [gifDic removeObjectForKey:gifName];
    }
}

- (void)stopAllGif{
//    NSArray *keys=[gifDic allKeys];
//    for (int i=0; i<[keys count]; i++) {
//        UIImageView *imageV=[gifDic objectForKey:[keys objectAtIndex:i]];
//        [imageV stopAnimating];
//        [gifDic removeObjectForKey:[keys objectAtIndex:i]];
//    }
    _gifImagesDic=nil;
}

@end
