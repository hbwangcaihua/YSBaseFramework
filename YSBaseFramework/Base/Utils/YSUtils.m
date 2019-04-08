//
//  YSUtils.m
//  ApuRay
//
//  Created by qitmac000370 on 2019/3/10.
//  Copyright © 2019年 wch. All rights reserved.
//

#import "YSUtils.h"

@implementation YSUtils

/**
 *  创建36位唯一GUID
 *
 *  @return GUID
 */
+(NSString *)CreateGUID{
    NSString *  result;
    CFUUIDRef   uuid;
    CFStringRef uuidStr;
    uuid = CFUUIDCreate(NULL);
    uuidStr = CFUUIDCreateString(NULL, uuid);
    result =[NSString stringWithFormat:@"%@", uuidStr];
    CFRelease(uuidStr);
    CFRelease(uuid);
    return result;
}

@end
