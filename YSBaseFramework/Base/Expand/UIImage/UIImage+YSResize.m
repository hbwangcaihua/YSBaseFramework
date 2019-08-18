//
//  UIImage+YSResize.m
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import "UIImage+YSResize.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (YSResize)

/**
  等比例压缩图片到指定大小
 */
- (UIImage *)compressScaleToSize:(CGSize)size
{
    CGFloat width  = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    CGFloat scale = MIN(size.width / width, size.height / height);
    width  = width * scale;
    height = height * scale;
    int xPos = (size.width - width)/2;
    int yPos = (size.height - height)/2;
    UIGraphicsBeginImageContextWithOptions(size, NO,[[UIScreen mainScreen] scale]);
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

/**
 等比例压缩图片到指定大小
 */
- (UIImage *)compressScaleWithWidth:(float)width height:(float)height
{
    if (width>self.size.width && height > self.size.height)
    {
        return self;
    }
    else
    {
        float iw = self.size.width;
        float ih = self.size.height;
        float iLw = iw;
        float iLh = ih;
        if (height < ih || width < iw)
        {
            if ((float)height / (float)ih < (float)width / (float)iw)
            {
                iLh = height;
                iLw = iLh * iw / ih;
            }
            else
            {
                iLw = width;
                iLh = iLw * ih / iw;
            }
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(iLw, iLh), NO, 0);
        [self drawInRect:CGRectMake(0, 0, iLw, iLh)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    }
}

/**
  压缩图片到指定大小
 */
-(UIImage*)compressToSize:(CGSize)size
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

/**
 高斯模糊
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur {
//    NSInteger boxSize = (NSInteger)(10 * 5);
//    boxSize = boxSize - (boxSize % 2) + 1;
//
//    CGImageRef img = image.CGImage;
//
//    vImage_Buffer inBuffer, outBuffer, rgbOutBuffer;
//    vImage_Error error;
//
//    void *pixelBuffer, *convertBuffer;
//
//    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
//    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
//
//    convertBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
//    rgbOutBuffer.width = CGImageGetWidth(img);
//    rgbOutBuffer.height = CGImageGetHeight(img);
//    rgbOutBuffer.rowBytes = CGImageGetBytesPerRow(img);
//    rgbOutBuffer.data = convertBuffer;
//
//    inBuffer.width = CGImageGetWidth(img);
//    inBuffer.height = CGImageGetHeight(img);
//    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
//    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
//
//    pixelBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
//
//    if (pixelBuffer == NULL) {
//        NSLog(@"No pixelbuffer");
//    }
//
//    outBuffer.data = pixelBuffer;
//    outBuffer.width = CGImageGetWidth(img);
//    outBuffer.height = CGImageGetHeight(img);
//    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
//
//    void *rgbConvertBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
//    vImage_Buffer outRGBBuffer;
//    outRGBBuffer.width = CGImageGetWidth(img);
//    outRGBBuffer.height = CGImageGetHeight(img);
//    outRGBBuffer.rowBytes = 3;
//    outRGBBuffer.data = rgbConvertBuffer;
//
//    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
//
//    if (error) {
//        NSLog(@"error from convolution %ld", error);
//    }
//    const uint8_t mask[] = {2, 1, 0, 3};
//
//    vImagePermuteChannels_ARGB8888(&outBuffer, &rgbOutBuffer, mask, kvImageNoFlags);
//
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef ctx = CGBitmapContextCreate(rgbOutBuffer.data,
//                                             rgbOutBuffer.width,
//                                             rgbOutBuffer.height,
//                                             8,
//                                             rgbOutBuffer.rowBytes,
//                                             colorSpace,
//                                             kCGImageAlphaNoneSkipLast);
//    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
//    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
//
//    //clean up
//    CGContextRelease(ctx);
//
//    free(pixelBuffer);
//    free(convertBuffer);
//    free(rgbConvertBuffer);
//    CFRelease(inBitmapData);
//
//    CGColorSpaceRelease(colorSpace);
//    CGImageRelease(imageRef);
//
//    return returnImage;
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1); // convert to jpeg
    UIImage* destImage = [UIImage imageWithData:imageData];
    
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
