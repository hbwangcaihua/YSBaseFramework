//
//  UIView+YSUtility.h
//  AFNetworking
//
//  Created by qitmac000370 on 2019/6/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YSUtility)

/* 添加触摸事件
-(void)handleTapEnterCircle:(UITapGestureRecognizer *)tapRecognizer
{
}
*/
- (void) addTarget:(id) target withSelector:(SEL) action;

@end

NS_ASSUME_NONNULL_END
