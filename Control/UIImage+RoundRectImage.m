//
//  UIImage+RoundRectImage.m
//  Control
//
//  Created by xinying on 2016/3/24.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "UIImage+RoundRectImage.h"

@implementation UIImage (RoundRectImage)

//给上下文添加圆角蒙版
void addRoundRectToPath(CGContextRef context, CGRect rect, float radius, CGImageRef image)
{
    float width, height;
    if (radius == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    width = CGRectGetWidth(rect);
    height = CGRectGetHeight(rect);
    
    //裁剪路径
    CGContextMoveToPoint(context, width, height / 2);
    CGContextAddArcToPoint(context, width, height, width / 2, height, radius);
    CGContextAddArcToPoint(context, 0, height, 0, height / 2, radius);
    CGContextAddArcToPoint(context, 0, 0, width / 2, 0, radius);
    CGContextAddArcToPoint(context, width, 0, width, height / 2, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
    CGContextRestoreGState(context);
}

//给传入的图片设置圆角后返回圆角图片
+ (UIImage *)imageOfRoundRectWithImage: (UIImage *)image size: (CGSize)size radius: (CGFloat)radius
{

//2 ,通过贝塞尔曲线 实现，也是基于绘图技术
    UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
    
    // 矩形框
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    //剪切
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
//    [[UIBezierPath bezierPathWithArcCenter:CGPointZero radius:radius startAngle:0.2 endAngle:3.14 clockwise:YES] addClip];
    [image drawInRect:rect];
    
    UIImage *img =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
//1,通过绘图技术来实现的
    // 开启图形上下文 （这个就用到前面的UIView的分类可以直接点出来）
//    UIGraphicsBeginImageContext(size);
//
//    // 获得上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    // 矩形框
//    CGRect rect = CGRectMake(0, 0, size.width, size.height);
//
//    // 添加一个圆
//    CGContextAddEllipseInRect(ctx, rect);
//
//    // 裁剪(裁剪成刚才添加的图形形状)
//    CGContextClip(ctx);
//
//    // 往圆上面画一张图片
//    [image drawInRect:rect];
//
//    // 获得上下文中的图片
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//
//    // 关闭图形上下文
//    UIGraphicsEndImageContext();
//
//    return img;
    

// 出错，没有输出
    //    if (!image || (NSNull *)image == [NSNull null]) { return nil; }
    //
    //    const CGFloat width = size.width;
    //    const CGFloat height = size.height;
    //
    //    radius = MAX(5.f, radius);
    //    radius = MIN(10.f, radius);
    //
    //    UIImage * img = image;
    //    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorSpace, kCGImageAlphaPremultipliedFirst);
    //    CGRect rect = CGRectMake(0, 0, width, height);
    //
    //    //绘制圆角
    //    CGContextBeginPath(context);
    //    addRoundRectToPath(context, rect, radius, img.CGImage);
    //    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    //    img = [UIImage imageWithCGImage: imageMasked];
    //
    //    CGContextRelease(context);
    //    CGColorSpaceRelease(colorSpace);
    //    CGImageRelease(imageMasked);
}


@end
