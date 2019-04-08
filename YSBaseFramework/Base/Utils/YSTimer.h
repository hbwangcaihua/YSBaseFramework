//
//  YSTimer.h
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/12.
//  Copyright © 2019年 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSTimer : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end
