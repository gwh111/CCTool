//
//  CC_LoadingView.m
//  HHSLive
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CC_LoadingView.h"

@interface CC_LoadingView(){
    UIImageView *loadingImageView;
    NSTimer *loadingTimer;
    NSUInteger count;
    
    UIView *defaultView;
    
    UIActivityIndicatorView *indi;
}

@end
@implementation CC_LoadingView

static CC_LoadingView *loadingView = nil;
static dispatch_once_t onceToken;

- (void)showLoadingInView:(UIView *)view{
    loadingImageView.hidden=YES;
    indi.hidden=NO;
    [indi startAnimating];
//    [CC_LoadingView shareInstance].frame=view.frame;
    defaultView.hidden=NO;
    defaultView.center=CGPointMake(view.width/2, view.height/2);
    [CC_LoadingView shareInstance].hidden=NO;
    [view addSubview:[CC_LoadingView shareInstance]];
    
}
- (void)hiddenLoading{
    defaultView.hidden=YES;
    [CC_LoadingView shareInstance].hidden=YES;
}

+ (instancetype)shareInstance
{
    dispatch_once(&onceToken, ^{
        loadingView = [[CC_LoadingView alloc] init];
    });
    return loadingView;
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
        
        loadingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 88/2, 214/2)];
        [self addSubview:loadingImageView];
        
        self.frame=loadingImageView.frame;
    }
    return self;
}

- (void)stopAnimating{
    [indi stopAnimating];
    indi.hidden=YES;
    loadingImageView.hidden=YES;
    [loadingTimer invalidate];
    loadingTimer=nil;
    self.hidden=YES;
}

- (void)startAnimating{
    [self stopAnimating];
    loadingImageView.hidden=NO;
    self.hidden=NO;
    count=10000;
    loadingTimer=[NSTimer timerWithTimeInterval:.07 target:self selector:@selector(animating) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:loadingTimer forMode:NSRunLoopCommonModes];
    [loadingTimer fire];
}
- (void)animating{
    count++;
    NSString *nameString=[NSString stringWithFormat:@"加载中-%ld",count];
    UIImage *image=UIIMAGE(nameString);
    if (image) {
        loadingImageView.image=image;
    }else{
        count=10000;
    }
}
- (void)startAnimatingNamed:(NSString *)imageName{
    
}

@end
