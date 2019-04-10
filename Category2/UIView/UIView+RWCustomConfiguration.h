//
//  UIView+RWCustomConfiguration.h
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/3/14.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RWCustomConfiguration)

+(id )viewFromNibWithClassName:(NSString *)className;

-(void)refreshCornerRadius:(double)radius;

-(void)showRWProgressHUD:(NSString *)tip;
-(void)dissmissRWProgressHUD;




/**
 设置视图样式，圆角，带边框

 @param cornerRadius 圆角
 @param borderColor 边框颜色
 */
-(void)setStyle001:(CGFloat)cornerRadius withBorderColor:(UIColor *)borderColor;

-(void)setStyle002ShadowOffset:(CGSize)shadowOffset andShadowColor:(UIColor *)shadowColor andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius;
-(void)setStyle003ShadowOffset:(CGSize)shadowOffset andShadowColor:(UIColor *)shadowColor andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius;

-(void)setStyle003WithSatrtPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor;


-(void)setStyle004;

-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top andTag:(int)tag;
-(void)removeDefaultViewWithTag:(int)tag;

-(void)addDefaultPageWithoutGetView:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top andTag:(int)tag;

@end
