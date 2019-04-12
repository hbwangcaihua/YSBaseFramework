//
//  NSDictionary+YSRemove.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YSRemove)

/**
 *  移除不可用的key，序列化时使用。如:value为block
 */
+(NSDictionary *)removeUnabelKey:(NSDictionary *)dic;

/**
 *  移除值为null的key,存储数据时使用
 */
+ (id) removeJsonNullFromDic:(id)obj;

@end
