//
//  ChineseString.h
//  YUChineseSorting
//
//  Created by yuzhx on 15/4/19.
//  Copyright (c) 2015年 BruceYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "yspinyin.h"

@interface YSChinesePinyinUtil : NSObject
@property(strong,nonatomic)NSString *string;
@property(strong,nonatomic)NSString *pinYin;


//+(NSString *)getChineseStringShortName:(NSString *)chineseName;


/**
 *  获取汉字的全称字母
 */
+ (NSString *)ysGetChineseStringFullform:(NSString *)chineseName;

/**
 *  获取汉字简拼
 */
+ (NSString *)ysGetChineseStringShortform:(NSString *)chineseName;

/**
 *  获取某个字符串或者汉字的首字母.
 */
+ (NSString *)ysGetChineseStringFirstCharform:(NSString *)chineseName;


/**
 *  判断是否为正常字母
 */
+ (NSString *)ysGetFormatFirstChar:(NSString *)firstChar;

//+ (NSString *)firstCharactorWithString:(NSString *)string;

@end
