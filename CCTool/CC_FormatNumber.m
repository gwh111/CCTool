//
//  FormatNumber.m
//  91lottoryshop
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CC_FormatNumber.h"

@implementation CC_FormatNumber

+(NSString *)formatNumberFromNumberString: (NSString *)numberString{
    NSString *newString;
    
//    NSLog(@"new%f",[numberString doubleValue]);
    if ([numberString doubleValue]<10000) {
        newString=[NSString stringWithFormat:@"%@元",numberString];
    }
    
    if (([numberString doubleValue]>=10000)&&([numberString doubleValue]<100000000)){
        int wan=[numberString doubleValue]/10000;
        int yuan=[numberString intValue]%10000;
        if (yuan==0) {
            newString=[NSString stringWithFormat:@"%d万",wan];
        }else{
            newString=[NSString stringWithFormat:@"%d万%d元",wan,yuan];
        }
    }

    if ([numberString doubleValue]>=100000000){
        int yi=[numberString doubleValue]/100000000;
        int wan=[numberString doubleValue]/10000;
        wan=wan*10000-yi*100000000;
        wan=wan/10000;
        int yuan=[numberString intValue]%10000;
//        NSLog(@"%dyi%dwan%dyuan",yi,wan,yuan);
        if (wan==0&yuan==0) {
            newString=[NSString stringWithFormat:@"%d亿",yi];
        }else if (wan==0){
            newString=[NSString stringWithFormat:@"%d亿%d元",yi,yuan];
        }else if (yuan==0) {
            newString=[NSString stringWithFormat:@"%d亿%d万",yi,wan];
        }else{
            newString=[NSString stringWithFormat:@"%d亿%d万%d元",yi,wan,yuan];
        }
    }
//    NSLog(@"newString%@",newString);
    return newString;
}

//+(NSString *)formatNumberFromNumberString: (NSString *)numberString{
//    NSString *newString;
//    
//    NSLog(@"new%f",[numberString doubleValue]);
//    if ([numberString doubleValue]<10000) {
//        newString=numberString;
//    }
//    if (([numberString doubleValue]>=10000)&&([numberString doubleValue]<1000000)){
//        newString=[NSString stringWithFormat:@"%.2f万",[numberString doubleValue]/10000];
//    }
//    if (([numberString doubleValue]>=1000000)&&([newString doubleValue]<10000000)){
//        newString=[NSString stringWithFormat:@"%.2f百万",[numberString doubleValue]/1000000];
//    }
//    if (([numberString doubleValue]>=10000000)&&([newString doubleValue]<100000000)){
//        newString=[NSString stringWithFormat:@"%.2f千万",[numberString doubleValue]/10000000];
//    }
//    
//    if ([numberString doubleValue]>=100000000){
//        newString=[NSString stringWithFormat:@"%.2f亿",[numberString doubleValue]/100000000];
//    }
//    NSLog(@"newString%@",newString);
//    return newString;
//}

@end
