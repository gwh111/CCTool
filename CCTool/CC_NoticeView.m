//
//  GNoticeView.m
//  JCZJ
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 apple. All rights reserved.
//
#import "AppDelegate.h"
#import "CC_NoticeView.h"

@implementation CC_NoticeView
@synthesize noticeString;

+ (void)showError:(NSString *)errorStr{
    
    UILabel *noticeLabel=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8, SCREEN_HEIGHT*2/3, SCREEN_WIDTH*6/8, 40*ScreenWidthScale)];
    noticeLabel.backgroundColor=RGBA(0, 0, 0, .8);
    noticeLabel.layer.cornerRadius = 10*ScreenWidthScale;
    noticeLabel.layer.masksToBounds = YES;
    noticeLabel.font=[UIFont systemFontOfSize:12*ScreenWidthScale];
    noticeLabel.textColor=[UIColor whiteColor];
    noticeLabel.numberOfLines=0;
    noticeLabel.textAlignment=NSTextAlignmentCenter;
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    [window addSubview:noticeLabel];
    noticeLabel.text=[NSString stringWithFormat:@"%@",errorStr];
    noticeLabel.size = CGSizeMake(errorStr.length*12*ScreenWidthScale+30*ScreenWidthScale, 40*ScreenWidthScale);
    noticeLabel.center = CGPointMake(SCREEN_WIDTH/2, noticeLabel.center.y);
    
    noticeLabel.alpha=0;
    [UIView animateWithDuration:.5f animations:^{
        noticeLabel.alpha=0.8;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            noticeLabel.alpha=.79;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.5f animations:^{
                noticeLabel.alpha=0;
            } completion:^(BOOL finished) {
                [noticeLabel removeFromSuperview];
            }];
        }];
    }];
}

+ (void)showError:(NSString *)errorStr atView:(UIView *)view{
    double SCREENWIDTH = SCREEN_WIDTH>SCREEN_HEIGHT?SCREEN_HEIGHT:SCREEN_WIDTH;
    float _ScreenWidthScale = (SCREENWIDTH/414.0*0.9+0.1);
    
    UILabel *noticeLabel=[[UILabel alloc]initWithFrame:CGRectMake(view.width/8, view.height*2/3, view.width*6/8, 40)];
    noticeLabel.backgroundColor=RGBA(0, 0, 0, .8);
    noticeLabel.layer.cornerRadius = 10*_ScreenWidthScale;
    noticeLabel.layer.masksToBounds = YES;
    noticeLabel.font=[UIFont systemFontOfSize:12];
    noticeLabel.textColor=[UIColor whiteColor];
    noticeLabel.numberOfLines=0;
    noticeLabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:noticeLabel];
    noticeLabel.text=[NSString stringWithFormat:@"%@",errorStr];
    noticeLabel.size = CGSizeMake(errorStr.length*12*_ScreenWidthScale+30*_ScreenWidthScale, 40*_ScreenWidthScale);
    noticeLabel.center = CGPointMake(view.width/2, noticeLabel.center.y);

    
    noticeLabel.alpha=0;
    [UIView animateWithDuration:.5f animations:^{
        noticeLabel.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            noticeLabel.alpha=.99;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.5f animations:^{
                noticeLabel.alpha=0;
            } completion:^(BOOL finished) {
                [noticeLabel removeFromSuperview];
            }];
        }];
    }];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UILabel *noticeLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    noticeLabel.backgroundColor=RGBA(0, 0, 0, .8);
    noticeLabel.font=[UIFont systemFontOfSize:12];
    noticeLabel.textColor=[UIColor whiteColor];
    noticeLabel.numberOfLines=0;
    noticeLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:noticeLabel];
    noticeLabel.text=noticeString;
    
    [noticeLabel.layer setMasksToBounds:YES];
    [noticeLabel.layer setCornerRadius:2]; //设置矩形四个圆角半径
    
    noticeLabel.alpha=0;
    [UIView animateWithDuration:.5f animations:^{
        noticeLabel.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            noticeLabel.alpha=.99;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.5f animations:^{
                noticeLabel.alpha=0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }];
    }];
}


@end
