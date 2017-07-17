//
//  ResponseMixer.m
//  AppleToolProj
//
//  Created by apple on 16/12/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CC_ResponseMixer.h"

@implementation CC_ResponseMixer

- (NSMutableDictionary *)makeTwoResultWithOne:(NSDictionary *)result1 andTwo:(NSDictionary *)result2{
    
    NSMutableDictionary *newResponseDic=[[NSMutableDictionary alloc]initWithDictionary:[result1 objectForKey:@"response"]];
    
    NSMutableDictionary *resultRespones1=[result1 objectForKey:@"response"];
    NSMutableDictionary *resultRespones2=[result2 objectForKey:@"response"];
    NSArray *keysArr=[resultRespones1 allKeys];
    for (int i=0; i<[keysArr count]; i++) {
        NSString *currentKey=[keysArr objectAtIndex:i];
        if ([[resultRespones1 objectForKey:currentKey] isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *tempDic=[[NSMutableDictionary alloc]initWithDictionary:[resultRespones1 objectForKey:currentKey]];
            [tempDic addEntriesFromDictionary:[resultRespones2 objectForKey:currentKey]];
            [newResponseDic setObject:tempDic forKey:currentKey];
        }
        
        if ([[resultRespones1 objectForKey:currentKey] isKindOfClass:[NSArray class]]) {
            NSMutableArray *tempArr=[[NSMutableArray alloc]initWithArray:[resultRespones1 objectForKey:currentKey]];
            [tempArr addObjectsFromArray:[resultRespones2 objectForKey:currentKey]];
            [newResponseDic setObject:tempArr forKey:currentKey];
        }
    }
    
    NSMutableDictionary *newDic=[[NSMutableDictionary alloc]init];
    [newDic setObject:newResponseDic forKey:@"response"];
    return newDic;
}

@end
