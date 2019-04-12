//
//  NSString+YSCheck.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YSCheck)

#pragma mark - Class method

/**
 *  给定的字符串是否是nil或者空字符串
 */
+(BOOL)isNullOrEmpty:(NSString *)str;

#pragma mark - Instance method

/**
 *  判断是否是纯汉字
 */
- (BOOL)isChinese;

/**
 *  判断是否含有汉字
 */
- (BOOL)includeChinese;

@end
