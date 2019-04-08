//
//  YSFormat.h
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/11.
//  Copyright © 2019年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSFormat : NSObject

/**
 *  将日期格式转为字符串
 */
+(NSString*)Date2String:(NSDate *)date;

/**
 *  将日期格式转为字符串
 */
+(NSString*)Date2String:(NSDate *)date format:(NSString *)format;

/**
 *  将字符串转为日期
 */
+(NSDate *)String2Date:(NSString *)strDate;

/**
 *  将字符串转为日期
 */
+(NSDate *)String2Date:(NSString *)strDate format:(NSString *)format;

/**
 *  转换为字符串
 *
 *  @param objStr 数据
 *
 *  @return 字符串
 */
+(NSString *)Null2String:(id)objStr;

/**
 *  转换为字符串
 *
 *  @param objStr 数据
 *  @param defaultStr 为空时的默认值
 *
 *  @return 字符串
 */
+(NSString *)Null2String:(id)objStr defaultStr:(NSString *)defaultStr;

/**
 *  格式化当前时间，用户给文件或图片命名
 *
 *  @return 时间格式:yyyyMMddhhmmssSSS
 */
+(NSString *)FormatNow2String;

@end

NS_ASSUME_NONNULL_END
