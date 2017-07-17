//
//  CC_AdManager.m
//  HHSLive
//
//  Created by apple on 2017/5/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CC_AdManager.h"

@interface CC_AdManager(){
    UIView *adView;
    UIImageView *adImageV;
    
    UIButton *adCountBtn;
    int adCount;
    NSTimer *countTimer;
}

@end
@implementation CC_AdManager

- (void)removeAd{
    [adView removeFromSuperview];
}
// GCD倒计时
- (void)startCoundown{
    
    countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
}
- (void)countDown{
    if(adCount < 0){
        [countTimer invalidate];
        countTimer=nil;
        [self removeAd];
    }else{
        [adCountBtn setTitle:[NSString stringWithFormat:@"%d跳过",adCount] forState:UIControlStateNormal];
        if(adCount == 0){
            [adCountBtn setTitle:[NSString stringWithFormat:@"%d跳过",1] forState:UIControlStateNormal];
        }
    }
    adCount--;
}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"adImageDic"]) {
        [self.delegate AdViewTapped:[[NSUserDefaults standardUserDefaults] objectForKey:@"adImageDic"]];
    }
    
}
- (void)initAdInView:(UIView *)view{
    
    adView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    adView.backgroundColor=[UIColor whiteColor];
    //        UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    [view addSubview:adView];
    
    adImageV=[[UIImageView alloc]initWithFrame:adView.frame];
    [adView addSubview:adImageV];
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] init];
    singleTapRecognizer.numberOfTapsRequired = 1;
    [singleTapRecognizer addTarget:self action:@selector(handleSingleTap:)];
    [adImageV addGestureRecognizer:singleTapRecognizer];
    
    adCount=3;
    adCountBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 40, 60, 20)];
    //按钮点击消失
    [adCountBtn addTarget:self action:@selector(removeAd) forControlEvents:UIControlEventTouchUpInside];
    [adCountBtn setTitle:[NSString stringWithFormat:@"%d跳过",adCount] forState:UIControlStateNormal];
    adCountBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [adCountBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    adCountBtn.backgroundColor = [UIColor colorWithRed:38 / 255.0 green:38 / 255.0 blue:38 / 255.0 alpha:0.6];
    adCountBtn.layer.cornerRadius = 10;
    [adView addSubview:adCountBtn];
    
    [self addAdView];
    
}

- (void)addAdView{
    
    NSString *imageUrl=[[NSUserDefaults standardUserDefaults] objectForKey:@"adImageUrl"];
    if (imageUrl) {
        [adImageV sd_setImageWithURL:[NSURL URLWithString:imageUrl]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [self startCoundown];
        }];
        
    }else{
        [self removeAd];
    }
}

@end
