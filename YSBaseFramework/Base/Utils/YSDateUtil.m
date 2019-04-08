//
//  YSDateUtil.m
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/11.
//  Copyright © 2019年 wch. All rights reserved.
//

#import "YSDateUtil.h"
#import "YSFormat.h"

@implementation YSDateUtil

/**
 *  获取当前时间
 */
+(NSDate *)GetCurrentDate{
    NSDate *datenow = [NSDate date];
    return datenow;
}

/**
 *  获取当前时间
 */
+(NSString *)GetCurrentDateForString{
    return [YSFormat Date2String:[YSDateUtil GetCurrentDate]];
}

/**
 *  格式化显示时间
 */
+(NSString *)getSystemShowTime:(NSDate *)date isShowMS:(BOOL)isShowMS{
    
    //    NSString *newWeek;
    NSDate *now = [YSDateUtil GetCurrentDate];
    NSInteger interval = [YSDateUtil IntervalDays:date endDate:now];//间隔天数
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *curHour = [dateFormatter stringFromDate:date];
    
    //当天消息显示格式:上午 03:13
    if (interval==0) {
        /* 是否为需要显示上下午 */
        NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
        NSRange containsA = [formatStringForHours rangeOfString:@"a"];
        BOOL hasAMPM = containsA.location != NSNotFound;
        
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"aaahh:mm"];
        if(hasAMPM){
            [dateFormatter setAMSymbol:[NSString stringWithFormat:@"%@ ",@"上午"]];//上午
            [dateFormatter setPMSymbol:[NSString stringWithFormat:@"%@ ",@"下午"]];//下午
        } else {
            [dateFormatter setAMSymbol:@""];
            [dateFormatter setPMSymbol:@""];
        }
        
        NSString *ap = [dateFormatter stringFromDate:date];
        return ap;
    }
    //昨天消息显示:昨天
    if (interval==1) {
        return isShowMS ? [NSString stringWithFormat:@"昨天 %@",curHour] : [NSString stringWithFormat:@"昨天"]; //昨天
    }
    //    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //    NSDateComponents *comps = [[NSDateComponents alloc] init];
    //    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    //    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    //    comps = [calendar components:unitFlags fromDate:date];
    //    NSInteger week = [comps weekday];//获得星期几
    
    //判断是否在一星期以内
    //    if ([AppDateUtil IsDateThisWeek:date]) {
    //    if (interval<7) {
    //        switch (week) {
    //            case 1:
    //                newWeek = [NSString stringWithFormat:@"星期日"];//星期天
    //                break;
    //            case 2:
    //                newWeek = [NSString stringWithFormat:@"星期一"];//星期一
    //                break;
    //            case 3:
    //                newWeek = [NSString stringWithFormat:@"星期二"];//星期二
    //                break;
    //            case 4:
    //                newWeek = [NSString stringWithFormat:@"星期三"];//星期三
    //                break;
    //            case 5:
    //                newWeek = [NSString stringWithFormat:@"星期四"];//星期四
    //                break;
    //            case 6:
    //                newWeek = [NSString stringWithFormat:@"星期五"];//星期五
    //                break;
    //            case 7:
    //                newWeek = [NSString stringWithFormat:@"星期六"];//星期六
    //                break;
    //            default:
    //                break;
    //        }
    //        if(isShowMS){
    //            newWeek = [newWeek stringByAppendingFormat:@" %@",curHour];
    //        }
    //        return newWeek;
    //    }
    
    [dateFormatter setDateFormat:@"yyyy"];
    
    NSString *curYear = [dateFormatter stringFromDate:date];
    NSString *nowYear = [dateFormatter stringFromDate:now];
    
    if ([curYear integerValue]<[nowYear integerValue]) {
        isShowMS ? [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"] : [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }else{
        isShowMS ? [dateFormatter setDateFormat:@"MM-dd HH:mm"] : [dateFormatter setDateFormat:@"MM-dd"];
        
    }
    NSString * currentStr = [dateFormatter stringFromDate:date];
    return currentStr;
}



/**
 *  获取两个日期的间隔天数
 *
 *  @param startDate 开始日期
 *  @param endDate   结束日期
 *
 *  @return 间隔天数
 */
+(NSInteger)IntervalDays:(NSDate*)startDate endDate:(NSDate*)endDate{
    //将日期改为0时刻
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd 00:00:00"];
    
    NSString *strStartDate = [dateFormatter stringFromDate:startDate];
    startDate = [YSFormat String2Date:strStartDate];
    
    NSString *strNowDate = [dateFormatter stringFromDate:endDate];
    endDate = [YSFormat String2Date:strNowDate];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:startDate  toDate:endDate  options:0];
    int days = (int)[comps day];
    return days;
}

/**
 *  获取两个日期的间隔分钟数
 *
 *  @param startDate 开始日期
 *  @param endDate   结束日期
 *
 *  @return 间隔分钟数
 */
+(NSInteger)IntervalMinutes:(NSDate *)startDate endDate:(NSDate *)endDate{
    NSInteger cha = [YSDateUtil IntervalSeconds:startDate endDate:endDate];
    return cha/60;
}

/**
 *  获取两个日期的间隔秒数
 */
+(NSInteger)IntervalSeconds:(NSDate *)startDate endDate:(NSDate *)endDate{
    
    NSTimeInterval lateS=[startDate timeIntervalSince1970]*1;
    NSTimeInterval lateE=[endDate timeIntervalSince1970]*1;
    
    NSTimeInterval cha=lateE-lateS;
    
    return cha;
}

/**
 *  判断是否为这周的日期
 */
+(BOOL)IsDateThisWeek:(NSDate *)date {
    
    NSDate *start;
    NSTimeInterval extends;
    NSCalendar *cal=[NSCalendar autoupdatingCurrentCalendar];
    NSDate *today= [YSDateUtil GetCurrentDate];
    BOOL success= [cal rangeOfUnit:NSWeekCalendarUnit startDate:&start interval: &extends forDate:today];
    
    if(!success)
        return NO;
    
    NSTimeInterval dateInSecs = [date timeIntervalSinceReferenceDate];
    NSTimeInterval dayStartInSecs= [start timeIntervalSinceReferenceDate];
    
    if(dateInSecs > dayStartInSecs && dateInSecs < (dayStartInSecs+extends)){
        return YES;
    }
    else {
        return NO;
    }
}

@end
