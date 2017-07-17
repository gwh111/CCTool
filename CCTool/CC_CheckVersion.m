//
//  CC_CheckVersion.m
//  HHSLive
//
//  Created by apple on 2017/4/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CC_CheckVersion.h"

@implementation CC_CheckVersion

+ (void)requestVersionWithBundleId:(NSString *)bundle and:(void(^)(BOOL hasNewVersion))finish{
//    NSString *urlStr=@"https://itunes.apple.com/cn/lookup?bundleId=com.jczj.push";
    NSString *urlStr=[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?bundleId=%@",bundle];
    NSLog(@"u==%@",urlStr);
    
    // 2.创建一个网络请求
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    // 3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.根据会话对象，创建一个Task任务：
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"从服务器获取到数据");
        /*
         对从服务器获取到的数据data进行相应的处理：
         */
        if (!data) {
            finish(NO);
            return ;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
        if (dict[@"results"]) {
            NSArray *resultsArr=dict[@"results"];
            if ([resultsArr count]>0) {
                if ([[[dict objectForKey:@"results"]objectAtIndex:0]objectForKey:@"version"]) {
                    
                    NSString *onlineVersion=[[[dict objectForKey:@"results"]objectAtIndex:0]objectForKey:@"version"];
                    NSArray *onlineArray = [onlineVersion componentsSeparatedByString:@"."];
                    
                    NSLog(@"%@",onlineArray);
                    NSString *appVersion=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
                    NSArray *appArray = [appVersion componentsSeparatedByString:@"."];
                    NSLog(@"%@",appArray);
                    
                    BOOL needUpdate=0;
                    if ([appArray count]>=3) {
                        if ([onlineArray count]>=3) {
                            if ([[onlineArray objectAtIndex:0]intValue]>[[appArray objectAtIndex:0]intValue]) {
                                needUpdate=1;
                            }else if ([[onlineArray objectAtIndex:0]intValue]==[[appArray objectAtIndex:0]intValue]) {
                                if ([[onlineArray objectAtIndex:1]intValue]>[[appArray objectAtIndex:1]intValue]) {
                                    needUpdate=1;
                                }else if ([[onlineArray objectAtIndex:1]intValue]==[[appArray objectAtIndex:1]intValue]){
                                    if ([[onlineArray objectAtIndex:2]intValue]>[[appArray objectAtIndex:2]intValue]) {
                                        needUpdate=1;
                                    }
                                }
                            }
                        }
                    }
                    NSLog(@"needUpdate%d",needUpdate);
                    if (needUpdate==1) {
                        if ([[dict objectForKey:@"results"]count]>0) {
                            
                            finish(YES);
                            return;
                        }
                        
                    }
                }
            }
        }
        
        finish(NO);
    }];
    // 5.最后一步，执行任务（resume也是继续执行）:
    [sessionDataTask resume];
}

@end
