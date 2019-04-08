//
//  YSTimer.m
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/12.
//  Copyright © 2019年 wch. All rights reserved.
//

#import "YSTimer.h"

@interface YSTimer ()

@property(nonatomic,weak) id target;  //重点，此处为weak
@property(nonatomic,assign) SEL selector;

@end

@implementation YSTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    
    YSTimer *ysTimer = [[YSTimer alloc] init];
    ysTimer.target = aTarget;
    ysTimer.selector = aSelector;
    
    return [NSTimer scheduledTimerWithTimeInterval:ti target:ysTimer selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    YSTimer *ysTimer = [[YSTimer alloc] init];
    ysTimer.target = aTarget;
    ysTimer.selector = aSelector;
    
    return [NSTimer timerWithTimeInterval:ti target:ysTimer selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
}

- (void)fire:(id)obj{
    [self.target performSelector:self.selector withObject:obj];
}

@end
