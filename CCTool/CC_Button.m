//
//  AppButton.m
//  JCZJ
//
//  Created by apple on 16/12/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CC_Button.h"
#import "CC_UIViewExt.h"

@interface CC_Button(){
    BOOL delayMark;
    float delayTime;
}

@end
@implementation CC_Button
@synthesize tappedBlock;

- (void)addTappedBlockWithDelay:(float)delay and:(void (^)(UIButton *button))block{
    self.tappedBlock=block;
    delayTime=delay;
    [self addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTappedBlock:(void (^)(UIButton *button))block{
    self.tappedBlock=block;
    delayTime=0.2;
    [self addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTapped:(UIButton *)button{
    
    if (delayMark==0) {
        tappedBlock(button);
        delayMark=1;
        [self performSelector:@selector(tappedMethod:) withObject:button afterDelay:delayTime];
    }
}

- (void)tappedMethod:(UIButton *)button{
    delayMark=0;
}

- (void)buttonTappedWithDelay:(float)delay{
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event

{
    
    CGRect bounds = self.bounds;
    if (self.width>=44&&self.height>=44) {
        return [super pointInside:point withEvent:event];
    }else if (self.width>=44&&self.height<44)
    {
        bounds =CGRectInset(bounds, 0, -(44-self.height)/2.0);
    }else if (self.width<44&&self.height>=44)
    {
        bounds =CGRectInset(bounds,-(44-self.width)/2.0,0);
    }else if (self.width<44&&self.height<44)
    {
        bounds =CGRectInset(bounds,-(44-self.width)/2.0,-(44-self.height)/2.0);
    }
    return CGRectContainsPoint(bounds, point);
    
}

@end
