//
//  Created by lz on 15/12/31.
//  Copyright (c) 2015年 Leo. All rights reserved.
//
//  Email : leoios@sina.com
//  GitHub: http://github.com/LeoiOS
//  如有问题或建议请给我发 Email, 或在该项目的 GitHub 主页 Issues 我, 谢谢:)
//
//  活动指示器

#import "YSLCProgressHUD.h"

// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_SIZE    16.0f

@implementation YSLCProgressHUD

+ (instancetype)sharedHUD {
    
    static YSLCProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[YSLCProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (instancetype)sharedHideHUDForNotClickHide {
    
    static YSLCProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[YSLCProgressHUD alloc] initWithWindowForNotClickHide:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (instancetype)sharedHideHUDForNotClickHide2 {
    
    static YSLCProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[YSLCProgressHUD alloc] initWithWindowForNotClickHide2:[UIApplication sharedApplication].keyWindow];
        hud.isNotShowStatus2 = NO;
    });
    return hud;
}

/** 在 window 上添加一个 HUD */
+ (YSLCProgressHUD *)showStatus:(YSLCProgressHUDStatus)status text:(NSString *)text isnotclicktohide:(BOOL)isnotclicktohide{
    return [self showStatus:status text:text isnotclicktohide:isnotclicktohide isDetailsLabelText:NO];
}
+ (YSLCProgressHUD *)showStatus2:(YSLCProgressHUDStatus)status text:(NSString *)text isnotclicktohide:(BOOL)isnotclicktohide{
    return [self showStatus2:status text:text isnotclicktohide:isnotclicktohide isDetailsLabelText:NO];
}

+ (YSLCProgressHUD *)showStatus:(YSLCProgressHUDStatus)status text:(NSString *)text{
    return [self showStatus:status text:text isnotclicktohide:NO isDetailsLabelText:NO];
}
+ (YSLCProgressHUD *)showStatus:(YSLCProgressHUDStatus)status text:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText{
    return [self showStatus:status text:text isnotclicktohide:NO isDetailsLabelText:isDetailsLabelText];
}

+ (YSLCProgressHUD *)showStatus:(YSLCProgressHUDStatus)status text:(NSString *)text isnotclicktohide:(BOOL)isnotclicktohide isDetailsLabelText:(BOOL)isDetailsLabelText{
    
    YSLCProgressHUD *hud = [YSLCProgressHUD sharedHUD];
    
    if(isnotclicktohide){
        hud = [YSLCProgressHUD sharedHideHUDForNotClickHide];
    }
    hud.labelText = nil;
    hud.detailsLabelText = nil;
    [hud show:YES];
    [hud setRemoveFromSuperViewOnHide:YES];
    if(isDetailsLabelText){
        [hud setDetailsLabelText:text];
        [hud setDetailsLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    }else{
        [hud setLabelText:text];
        [hud setLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    }
    [hud setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"YSLCProgressHUD" ofType:@"bundle"];
    
    switch (status) {
            
        case YSLCProgressHUDStatusSuccess: {
            
            NSString *sucPath = [bundlePath stringByAppendingPathComponent:@"new/checkmark.png"];
            UIImage *sucImage = [UIImage imageWithContentsOfFile:sucPath];
            
            hud.mode = YSMBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
            hud.customView = sucView;
            [hud hide:YES afterDelay:2.0f];
        }
            break;
            
        case YSLCProgressHUDStatusError: {
            
            NSString *errPath = [bundlePath stringByAppendingPathComponent:@"new/cross.png"];
            UIImage *errImage = [UIImage imageWithContentsOfFile:errPath];
            
            hud.mode = YSMBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
            hud.customView = errView;
            [hud hide:YES afterDelay:2.0f];
        }
            break;
            
        case YSLCProgressHUDStatusWaitting: {
            
            hud.mode = YSMBProgressHUDModeIndeterminate;
        }
            break;
            
        case YSLCProgressHUDStatusInfo: {
            
            NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"warning.png"];
            UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];
            
            hud.mode = YSMBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            hud.customView = infoView;
            [hud hide:YES afterDelay:2.0f];
        }
            break;
            
        default:
            break;
    }
    
    return hud;
}


+ (YSLCProgressHUD *)showStatus2:(YSLCProgressHUDStatus)status text:(NSString *)text isnotclicktohide:(BOOL)isnotclicktohide isDetailsLabelText:(BOOL)isDetailsLabelText{
    
    YSLCProgressHUD *hud = [YSLCProgressHUD sharedHUD];
    
    if(isnotclicktohide){
        hud = [YSLCProgressHUD sharedHideHUDForNotClickHide2];
    }
    hud.labelText = nil;
    hud.detailsLabelText = nil;
    [hud show:YES];
    [hud setRemoveFromSuperViewOnHide:YES];
    if(isDetailsLabelText){
        [hud setDetailsLabelText:text];
        [hud setDetailsLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    }else{
        [hud setLabelText:text];
        [hud setLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    }
    [hud setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"YSLCProgressHUD" ofType:@"bundle"];
    
    switch (status) {
            
        case YSLCProgressHUDStatusSuccess: {
            
            NSString *sucPath = [bundlePath stringByAppendingPathComponent:@"new/checkmark.png"];
            UIImage *sucImage = [UIImage imageWithContentsOfFile:sucPath];
            
            hud.mode = YSMBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
            hud.customView = sucView;
            [hud hide:YES afterDelay:2.0f];
        }
            break;
            
        case YSLCProgressHUDStatusError: {
            
            NSString *errPath = [bundlePath stringByAppendingPathComponent:@"new/cross.png"];
            UIImage *errImage = [UIImage imageWithContentsOfFile:errPath];
            
            hud.mode = YSMBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
            hud.customView = errView;
            [hud hide:YES afterDelay:2.0f];
        }
            break;
            
        case YSLCProgressHUDStatusWaitting: {
            
            hud.mode = YSMBProgressHUDModeIndeterminate;
        }
            break;
            
        case YSLCProgressHUDStatusInfo: {
            
            NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"warning.png"];
            UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];
            
            hud.mode = YSMBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            hud.customView = infoView;
            [hud hide:YES afterDelay:2.0f];
        }
            break;
            
        default:
            break;
    }
    
    return hud;
}



+ (YSLCProgressHUD *)showMessage:(NSString *)text {
    
    YSLCProgressHUD *hud = [YSLCProgressHUD sharedHUD];
    [hud show:YES];
    [hud setLabelText:text];
//    [hud setDetailsLabelText:text];
    [hud setMinSize:CGSizeZero];
    [hud setMode:YSMBProgressHUDModeText];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
//    [hud setDetailsLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud hide:YES afterDelay:2.0f];
    
    return hud;
}

+ (YSLCProgressHUD *)showInfoMsg:(NSString *)text{
    return [self showStatus:YSLCProgressHUDStatusInfo text:text];
}
+ (YSLCProgressHUD *)showInfoMsg:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText{
    
    return [self showStatus:YSLCProgressHUDStatusInfo text:text isDetailsLabelText:isDetailsLabelText];
}

+ (YSLCProgressHUD *)showFailure:(NSString *)text{
    return [self showStatus:YSLCProgressHUDStatusError text:text];
}
+ (YSLCProgressHUD *)showFailure:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText{
    
    return [self showStatus:YSLCProgressHUDStatusError text:text isDetailsLabelText:isDetailsLabelText];
}

+ (YSLCProgressHUD *)showSuccess:(NSString *)text{
    return [self showStatus:YSLCProgressHUDStatusSuccess text:text];
}
+ (YSLCProgressHUD *)showSuccess:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText{
    
    return [self showStatus:YSLCProgressHUDStatusSuccess text:text isDetailsLabelText:isDetailsLabelText];
}

+ (YSLCProgressHUD *)showLoading:(NSString *)text{
    return [self showStatus:YSLCProgressHUDStatusWaitting text:text];
}
+ (YSLCProgressHUD *)showLoading:(NSString *)text isDetailsLabelText:(BOOL)isDetailsLabelText{
    
    return [self showStatus:YSLCProgressHUDStatusWaitting text:text isDetailsLabelText:isDetailsLabelText];
}

+ (YSLCProgressHUD *)showLoadingForNotClickHide:(NSString *)text {
    
    return [self showStatus:YSLCProgressHUDStatusWaitting text:text isnotclicktohide:YES];
}

+ (YSLCProgressHUD *)showLoadingForNotClickHide2:(NSString *)text {
    if([YSLCProgressHUD sharedHideHUDForNotClickHide2].isNotShowStatus2){
        return nil;
    }
    else{
        return [self showStatus2:YSLCProgressHUDStatusWaitting text:text isnotclicktohide:YES];
    }
}

+ (void)hide {
    
    [[YSLCProgressHUD sharedHUD] hide:YES];
    [[YSLCProgressHUD sharedHideHUDForNotClickHide] hide:YES];
}


+ (void)hideForNotClick {
    [[YSLCProgressHUD sharedHideHUDForNotClickHide2] hide:YES];
}

@end
