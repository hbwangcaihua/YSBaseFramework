//
//  NSArray+YSSerialize.m
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import "NSArray+YSSerialize.h"

@implementation NSArray (YSSerialize)

/**
 *  转换为字符串
 */
-(NSString *)seriaArrToString{
    NSData *postDatas = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:postDatas encoding:NSUTF8StringEncoding];
    return str;
}

@end
