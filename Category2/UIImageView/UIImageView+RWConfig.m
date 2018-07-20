//
//  UIImageView+RWConfig.m
//  SupplyChain
//
//  Created by Johnson on 2016/7/24.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "UIImageView+RWConfig.h"
#import <objc/runtime.h>

static NSString *finishAnimateKey = @"finishAnimate";

@implementation UIImageView (RWConfig)

-(void)loadGifImagewithBaseName:(NSString *)name numOfImage:(NSInteger)num animationDuration:(double)duration repeatCount:(NSInteger)repeatCount complete:(void(^)())completeBlock{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i <= num ; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@%02d" ,name ,i]];
        CGImageRef cgimg = img.CGImage;
        [images addObject:(__bridge UIImage *)cgimg];
    }
    //创建CAKeyframeAnimation
    
    if (![self.layer animationForKey:@"animation1708"]) {
        [CATransaction begin];
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        animation.duration = duration;
        animation.repeatCount = repeatCount;
        animation.beginTime = CACurrentMediaTime();
        animation.values = images;
        animation.calculationMode = kCAAnimationCubic;
        animation.delegate = self;
        self.finishAnimate = ^{
            completeBlock();
        };
        [self.layer addAnimation:animation forKey:@"animation1708"];
        [CATransaction commit];
    }
    
}

-(void)loadGifImagewithBaseName:(NSString *)name numOfImage:(NSInteger)num animationDuration:(double)duration repeatCount:(NSInteger)repeatCount{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i <= num ; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@%02d" ,name ,i]];
        CGImageRef cgimg = img.CGImage;
        [images addObject:(__bridge UIImage *)cgimg];
    }
    
    //创建CAKeyframeAnimation
    
    if (![self.layer animationForKey:@"animation1708"]) {
        [CATransaction begin];
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        animation.duration = duration;
        animation.repeatCount = repeatCount;
        animation.beginTime = CACurrentMediaTime();
        animation.values = images;
        animation.calculationMode = kCAAnimationCubic;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [self.layer addAnimation:animation forKey:@"animation1708"];
        
        [CATransaction commit];
    }
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        SaleBlock(self.finishAnimate);
    }
}

-(void)stopGifAnimationforSec:(double)time{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopAnimating];
    });
}

-(void)setFinishAnimate:(void (^)())finishAnimate{
    objc_setAssociatedObject(self, &finishAnimateKey, finishAnimate, OBJC_ASSOCIATION_COPY);
}

-(void (^)())finishAnimate{
    return objc_getAssociatedObject(self, &finishAnimateKey);
}

//Johnson 开始来画虚线啦～
- (void)drawDottedLineWithlineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds =self.bounds;
    shapeLayer.position =CGPointMake(CGRectGetWidth(self.frame) /2, CGRectGetHeight(self.frame));
    shapeLayer.fillColor =[UIColor clearColor].CGColor;
    
    //  设置虚线颜色为blackColor
    shapeLayer.strokeColor =lineColor.CGColor;
    //  设置虚线宽度
    shapeLayer.lineWidth =CGRectGetHeight(self.frame);
    shapeLayer.lineJoin =kCALineJoinRound;
    //  设置线宽，线间距
    shapeLayer.lineDashPattern =[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength] ,[NSNumber numberWithInt:lineSpacing] ,nil];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(self.frame), 0);
    shapeLayer.path =path;
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
//    // 开始划线 划线的frame
//    UIGraphicsBeginImageContext(self.frame.size);
//    
//    [self.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//    
//    // 获取上下文
//    CGContextRef line = UIGraphicsGetCurrentContext();
//    
//    // 设置线条终点的形状
//    CGContextSetLineCap(line, kCGLineCapRound);
//    // 设置虚线的长度 和 间距
//    CGFloat lengths[] = {5,1};
//    
//    CGContextSetStrokeColorWithColor(line, [UIColor blackColor].CGColor);
//    // 开始绘制虚线
//    CGContextSetLineDash(line, 0, lengths, 2);
//    
//    CGContextMoveToPoint(line, 0.0, 2.0);
//    
//    CGContextAddLineToPoint(line, self.frame.size.width, 2.0);
//    
//    CGContextStrokePath(line);
//    
//    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
//    self.image  =UIGraphicsGetImageFromCurrentImageContext();
}

-(void)setProductImage:(NSString *)imageStr{
    
    if (RWModelServerSinglton.userType == UserTypeVisitor) {
        self.image = [UIImage imageNamed:imageStr];
        return;
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", REQ_HOST, imageStr];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageRetryFailed];
    
}

@end
