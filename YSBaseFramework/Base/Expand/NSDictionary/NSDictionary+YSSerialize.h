//
//  NSDictionary+YSSerialize.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YSSerialize)

/**
 *  转换为字符串
 */
-(NSString *)seriaDicToString;

/**
 *  转换为对象
 */
- (void)seriaDicToObj:(NSObject *)obj;

@end
