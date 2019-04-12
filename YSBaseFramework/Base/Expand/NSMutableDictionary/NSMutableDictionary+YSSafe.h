//
//  NSMutableDictionary+YSSafe.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (YSSafe)

/**
 *  不可变字典
 */
-(NSDictionary *)ysNSDictonaryForKey:(NSString *)key;

/**
 *  可变字典
 */
-(NSMutableDictionary *)ysNSMutableDictionaryForKey:(NSString *)key;

/**
 *  不可变数组
 */
-(NSArray *)ysNSArrayForKey:(NSString *)key;

/**
 *  可变数组
 */
-(NSMutableArray *)ysNSMutableArrayForKey:(NSString *)key;

/**
 *  字符串
 */
-(NSString *)ysNSStringForKey:(NSString *)key;

/**
 *  数值型
 */
-(NSNumber *)ysNSNumberForKey:(NSString *)key;

@end
