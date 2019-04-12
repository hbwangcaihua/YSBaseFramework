//
//  YSFormat.m
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import "YSFormat.h"

@implementation YSFormat

/**
 *  将日期格式转为字符串
 */
+(NSString*)Date2String:(NSDate *)date{
    return [YSFormat Date2String:date format:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

/**
 *  将日期格式转为字符串
 */
+(NSString*)Date2String:(NSDate *)date format:(NSString *)format{
    if (!date) {
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

/**
 *  将字符串转为日期
 */
+(NSDate *)String2Date:(NSString *)strDate{
    strDate = [[strDate stringByReplacingOccurrencesOfString:@"/" withString:@"-"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    if([strDate rangeOfString:@"+"].location != NSNotFound){
        strDate = [strDate substringToIndex:[strDate rangeOfString:@"+"].location];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if([strDate rangeOfString:@"."].location != NSNotFound){
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    }else if([strDate rangeOfString:@"Z"].location != NSNotFound){
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
    }
    else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    
    NSDate *curDate = [dateFormatter dateFromString:strDate];
    if (curDate == nil) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        curDate = [dateFormatter dateFromString:strDate];
    }
    return curDate;
}

/**
 *  将字符串转为日期
 */
+(NSDate *)String2Date:(NSString *)strDate format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *curDate = [dateFormatter dateFromString:strDate];
    return curDate;
}

/**
 *  转换为字符串
 *
 *  @param objStr 数据
 *
 *  @return 字符串
 */
+(NSString *)Null2String:(id)objStr{
    return [YSFormat Null2String:objStr defaultStr:@""];
}

/**
 *  转换为字符串
 *
 *  @param objStr 数据
 *  @param defaultStr 为空时的默认值
 *
 *  @return 字符串
 */
+(NSString *)Null2String:(id)objStr defaultStr:(NSString *)defaultStr{
    if(objStr==nil || [objStr isEqual:[NSNull null]]){
        return @"";
    }
    
    return (NSString *)objStr;
}

/**
 *  格式化当前时间，用户给文件或图片命名
 *
 *  @return 时间格式:yyyyMMddhhmmssSSS
 */
+(NSString *)FormatNow2String{
    NSDate *now = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddhhmmssSSS"];
    NSString *nowDateStr = [dateFormatter stringFromDate:now];
    nowDateStr = [nowDateStr stringByReplacingOccurrencesOfString:@":" withString:@""];
    return nowDateStr;
}

@end
