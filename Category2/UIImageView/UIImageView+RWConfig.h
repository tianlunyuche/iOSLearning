//
//  UIImageView+RWConfig.h
//  SupplyChain
//
//  Created by Johnson on 2016/7/24.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RWConfig)<CAAnimationDelegate>

-(void)loadGifImagewithBaseName:(NSString *)name numOfImage:(NSInteger)num animationDuration:(double)duration repeatCount:(NSInteger)repeatCount complete:(void(^)())completeBlock;
-(void)loadGifImagewithBaseName:(NSString *)name numOfImage:(NSInteger)num animationDuration:(double)duration repeatCount:(NSInteger)repeatCount;

-(void)stopGifAnimationforSec:(double)time;

- (void)drawDottedLineWithlineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

// 设置商品图片
-(void) setProductImage:(NSString *)imageStr;

@property (nonatomic, copy) void(^finishAnimate)();

@end
