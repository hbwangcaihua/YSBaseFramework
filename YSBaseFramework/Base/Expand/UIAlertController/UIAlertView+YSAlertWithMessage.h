//
//  UIAlertView+YSAlertWithMessage.h
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/25.
//  Copyright © 2019年 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertView (YSAlertWithMessage)

/**
 *  直接显示弹窗消息，无回调，无按钮设置等
 *  @param message 要显示的消息
 */
+(void)alertViewWithMessage:(NSString *)message;

+(void)alertViewWithTitle:(NSString *)Title Message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;

@end

NS_ASSUME_NONNULL_END
