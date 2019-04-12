//
//  UIAlertView+YSAlertWithMessage.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
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
