//
//  YSKeyChain.h
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/28.
//  Copyright © 2019年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSKeyChain : NSObject

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end

NS_ASSUME_NONNULL_END
