//
//  YSDateUtil.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSDateUtil : NSObject

/**
 *  获取当前时间
 */
+(NSDate *)GetCurrentDate;

/**
 *  获取当前时间
 */
+(NSString *)GetCurrentDateForString;

/**
 *  格式化显示时间
 */
+(NSString *)getSystemShowTime:(NSDate *)date isShowMS:(BOOL)isShowMS;

/**
 *  获取两个日期的间隔天数
 *
 *  @param startDate 开始日期
 *  @param endDate   结束日期
 *
 *  @return 间隔天数
 */
+(NSInteger)IntervalDays:(NSDate*)startDate endDate:(NSDate*)endDate;

/**
 *  获取两个日期的间隔分钟数
 *
 *  @param startDate 开始日期
 *  @param endDate   结束日期
 *
 *  @return 间隔分钟数
 */
+(NSInteger)IntervalMinutes:(NSDate *)startDate endDate:(NSDate *)endDate;

/**
 *  获取两个日期的间隔秒数
 */
+(NSInteger)IntervalSeconds:(NSDate *)startDate endDate:(NSDate *)endDate;

/**
 *  判断是否为这周的日期
 */
+(BOOL)IsDateThisWeek:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
