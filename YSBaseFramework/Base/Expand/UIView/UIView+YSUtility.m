//
//  UIView+YSUtility.m
//  AFNetworking
//
//  Created by qitmac000370 on 2019/6/21.
//

#import "UIView+YSUtility.h"

@implementation UIView (YSUtility)

// 添加触摸事件
- (void) addTarget:(id) target withSelector:(SEL) action{
    self.userInteractionEnabled = YES;

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapGestureRecognizer setNumberOfTapsRequired:1];
    [tapGestureRecognizer addTarget:target action:action];
    [self addGestureRecognizer:tapGestureRecognizer];
}

@end
