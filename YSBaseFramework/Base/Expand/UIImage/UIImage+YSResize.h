//
//  UIImage+YSResize.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YSResize)

/**
  等比例压缩图片到指定大小
 */
- (UIImage *)compressScaleToSize:(CGSize)size;

/**
  等比例压缩图片到指定大小
 */
- (UIImage *)compressScaleWithWidth:(float)width height:(float)height;

/**
  压缩图片到指定大小
 */
-(UIImage*)compressToSize:(CGSize)size;

@end
