//
//  CC_Loading.m
//  HHSLive
//
//  Created by apple on 2017/4/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CC_Loading.h"

@interface CC_Loading(){
    UIView *defaultView;
    
    UIActivityIndicatorView *indi;
}

@end
@implementation CC_Loading

static CC_Loading *instance = nil;
static dispatch_once_t onceToken;

- (void)showLoadingInView:(UIView *)view{
    indi.hidden=NO;
    [indi startAnimating];
    [CC_Loading shareInstance].frame=view.frame;
    defaultView.hidden=NO;
    defaultView.center=view.center;
    [CC_Loading shareInstance].hidden=NO;
    [view addSubview:[CC_Loading shareInstance]];
    
}
- (void)hiddenLoading{
    defaultView.hidden=YES;
    [CC_Loading shareInstance].hidden=YES;
}

+ (instancetype)shareInstance
{
    dispatch_once(&onceToken, ^{
        instance = [[CC_Loading alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        defaultView=[[UIView alloc]init];
        [self addSubview:defaultView];
        defaultView.backgroundColor=RGBA(0, 0, 0, .8);
        defaultView.size=CGSizeMake(60, 60);
        defaultView.layer.masksToBounds=YES;
        defaultView.layer.cornerRadius=5;
        
        indi=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [defaultView addSubview:indi];
        [indi startAnimating];
        indi.left=0;
        indi.top=0;
        indi.width=10;
        indi.height=10;
        indi.center=defaultView.center;
        
    }
    return self;
}


@end
