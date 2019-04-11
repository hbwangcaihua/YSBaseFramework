//
//  Created by lz on 15/12/31.
//  Copyright (c) 2015年 Leo. All rights reserved.
//
//  Email : leoios@sina.com
//  GitHub: http://github.com/LeoiOS
//  如有问题或建议请给我发 Email, 或在该项目的 GitHub 主页 Issues 我, 谢谢:)
//
//  活动指示器

#import "YSMBProgressHUD.h"

typedef NS_ENUM(NSInteger, YSLCProgressHUDStatus) {
    
    /** 成功 */
    YSLCProgressHUDStatusSuccess,
    
    /** 失败 */
    YSLCProgressHUDStatusError,
    
    /** 提示 */
    YSLCProgressHUDStatusInfo,
    
    /** 等待 */
    YSLCProgressHUDStatusWaitting
};

@interface YSLCProgressHUD : YSMBProgressHUD

/** 返回一个 HUD 的单例 */
+ (instancetype)sharedHUD;

+ (instancetype)sharedHideHUDForNotClickHide2;

/** 在 window 上添加一个 HUD */
+ (YSLCProgressHUD *)showStatus:(YSLCProgressHUDStatus)status text:(NSString *)text isnotclicktohide:(BOOL)isnotclicktohide;

#pragma mark - 建议使用的方法

/** 在 window 上添加一个只显示文字的 HUD */
+ (YSLCProgressHUD *)showMessage:(NSString *)text;

/** 在 window 上添加一个提示`信息`的 HUD */
+ (YSLCProgressHUD *)showInfoMsg:(NSString *)text;
+ (YSLCProgressHUD *)showInfoMsg:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText;

/** 在 window 上添加一个提示`失败`的 HUD */
+ (YSLCProgressHUD *)showFailure:(NSString *)text;
+ (YSLCProgressHUD *)showFailure:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText;

/** 在 window 上添加一个提示`成功`的 HUD */
+ (YSLCProgressHUD *)showSuccess:(NSString *)text;
+ (YSLCProgressHUD *)showSuccess:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText;

/** 在 window 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (YSLCProgressHUD *)showLoading:(NSString *)text;
+ (YSLCProgressHUD *)showLoading:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText;

+ (YSLCProgressHUD *)showLoadingForNotClickHide:(NSString *)text;

+ (YSLCProgressHUD *)showLoadingForNotClickHide2:(NSString *)text;

/** 手动隐藏 HUD */
+ (void)hide;

+ (void)hideForNotClick;

@property(nonatomic,assign) BOOL isNotShowStatus2;

@end
