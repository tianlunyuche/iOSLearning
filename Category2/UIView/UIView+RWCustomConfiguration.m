//
//  UIView+RWCustomConfiguration.m
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/3/14.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "UIView+RWCustomConfiguration.h"

@implementation UIView (RWCustomConfiguration)

+(id )viewFromNibWithClassName:(NSString *)className{
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil];
    return nibs.firstObject;
}

-(void)refreshCornerRadius:(double)radius{
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    
}

-(void)showRWProgressHUD:(NSString *)tip{
    
    UIView *progressView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:progressView];
    progressView.tag = 5678;
    progressView.backgroundColor = [UIColor colorWithHex:@"000000" alpha:RWBackGroudViewAlpha];
    
    UIView *showProgressView = [UIView new];
    [progressView addSubview:showProgressView];
    [showProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
        make.width.equalTo(120);
        make.height.equalTo(130);
    }];
    showProgressView.backgroundColor = [UIColor whiteColor];
    showProgressView.layer.cornerRadius = 5;
    showProgressView.layer.masksToBounds = YES;
    
    UIImageView *iv = [UIImageView new];
    [showProgressView addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(0).equalTo(-6);
        make.width.height.equalTo(54);
    }];
    iv.image = [UIImage sd_animatedGIFNamed:@"loading"];
    
    [progressView setNeedsLayout];
   
    UILabel *tipLabel = [UILabel new];
    [progressView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(iv);
        make.top.equalTo(iv.mas_bottom).offset(12);
    }];
    tipLabel.textColor = [UIColor colorWithHex:@"2e2e2e"];
    tipLabel.text = tip ? : @"加载中...";
    tipLabel.font = [UIFont systemFontOfSize:12];
    
}

//隐藏自定义加载视图
-(void)dissmissRWProgressHUD{
    
    UIView *progressView = [self viewWithTag:5678];
    if (progressView) {
        [progressView removeFromSuperview];
    }
    
}

-(void)setStyle001:(CGFloat)cornerRadius withBorderColor:(UIColor *)borderColor{
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = .5;
//    self.layer.borderWidth = 1.0;
}

-(void)setStyle002ShadowOffset:(CGSize)shadowOffset andShadowColor:(UIColor *)shadowColor andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius{
    
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.masksToBounds = NO;
}

-(void)setStyle003ShadowOffset:(CGSize)shadowOffset andShadowColor:(UIColor *)shadowColor andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius{
    
    CALayer *sublayer1 =[CALayer layer];
    sublayer1.shadowOffset = shadowOffset;
    sublayer1.shadowColor = shadowColor.CGColor;
    sublayer1.shadowOpacity = shadowOpacity;
    sublayer1.shadowRadius = shadowRadius;
    sublayer1.masksToBounds = NO;
    [self.layer insertSublayer:sublayer1 atIndex:1];
}

-(void)setStyle003WithSatrtPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor{
    [self layoutIfNeeded];
    [self updateConstraints];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    if (ScreenWidth ==414.0) {
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) +40, CGRectGetHeight(self.frame));
    }else{
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top andTag:(int)tag{
    [self layoutIfNeeded];
    
    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
    waringTip.tag = tag;
    
    if ([self viewWithTag:tag]) {
        waringTip = (RWWaringTip002 *)[self viewWithTag:tag];
        if (title.length != 0) waringTip.title.text = title;
        if (icon) waringTip.icon.image = icon;
        return;
    }
    if (title.length != 0) waringTip.title.text = title;
    if (icon) waringTip.icon.image = icon;
    [self addSubview:waringTip];
    
    waringTip.frame = CGRectMake(0, top, self.width, self.height - top);
    [waringTip updateConstraints];
}

-(void)removeDefaultViewWithTag:(int)tag{
    
    UIView *temp = [self viewWithTag:tag];
    
    if (temp) {
        [UIView animateWithDuration:.2 animations:^{
            temp.alpha = 0;
        } completion:^(BOOL finished) {
            [[self viewWithTag:tag] removeFromSuperview];
        }];
    }
    
}

-(void)addDefaultPageWithoutGetView:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top andTag:(int)tag{
    [self layoutIfNeeded];
    
    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
    waringTip.tag = tag;
                     
    if (title.length != 0) waringTip.title.text = title;
    if (icon) waringTip.icon.image = icon;
    [self addSubview:waringTip];
    
    waringTip.frame = CGRectMake(0, top, self.width, self.height - top);
    [waringTip updateConstraints];
}

-(void)setStyle004{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:@"9acc35"].CGColor, (__bridge id)[UIColor colorWithHex:@"79bd50"].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
    if (ScreenWidth ==414.0) {
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) +40, CGRectGetHeight(self.frame));
    }else{
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
}
//-----------------
/**
 CAShapeLayer，UIImageView 通过CABasicAnimation，CAKeyframeAnimation实现动画，CAAnimationGroup实现组合动画，UIBezierPath 绘制移动路径
 */
- (void)shape{
    
    //    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"进度发光点"]];
    
    CAShapeLayer  *_trackLayer = [CAShapeLayer layer];//创建一个track shape layer
    _trackLayer.frame = self.bounds;
    //    [imageView.layer addSublayer:_trackLayer];
    [self.layer addSublayer:_trackLayer];
    _trackLayer.fillColor = [UIColor clearColor].CGColor;
    _trackLayer.strokeColor =[UIColor whiteColor].CGColor;//指定path的渲染颜色
    _trackLayer.opacity = 0;
    _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
    
    //    imageView.layer.mask =_trackLayer;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width /2, self.bounds.size.height /2) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-200) endAngle:degreesToRadians(20) clockwise:YES];
    //    imageView.frame =CGRectMake(path.currentPoint.x, path.currentPoint.y, 40, 40);
    //    imageView.layer.position = imageView.frame.origin;
    //    [self addSubview:imageView];
    _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    
    //增加动画
    //    CAKeyframeAnimation *pathAnimation=[CAKeyframeAnimation animationWithKeyPath:@"stokeEnd"];
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3;
    //    pathAnimation.keyPath =path.CGPath;
    
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    pathAnimation.repeatCount = NO;
    //    imageView.frame =CGRectMake(path.currentPoint.x, path.currentPoint.y,imageView.bounds.size.width, imageView.bounds.size.height);
    //    [_trackLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    CABasicAnimation *showViewAnn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    showViewAnn.fromValue = [NSNumber numberWithFloat:0.0];
    showViewAnn.toValue = [NSNumber numberWithFloat:1.0];
    //    showViewAnn.duration = kAnimationDuration;
    showViewAnn.fillMode = kCAFillModeForwards;
    showViewAnn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    showViewAnn.removedOnCompletion = NO;
    //    [_trackLayer addAnimation:showViewAnn forKey:@"myShow"];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:pathAnimation,showViewAnn, nil]];
    group.duration = 3.0f;
    //    group.delegate = self;
    //    [group setValue:_trackLayer forKey:@"imageViewBeingAnimated"];
    
    [_trackLayer addAnimation:group forKey:@"savingAnimation"];
    //开始动画函数 ，准备动画的开始工作
    //    [UIView beginAnimations:nil context:nil];
    //
    //    [UIView setAnimationDuration:5];
    //    //动画开始的 延时 长度，秒
    //    [UIView setAnimationDelay:0];
    //    //动画的 代理对象
    //    [UIView setAnimationDelegate:self];
    //
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    //    //设置动画结果调用的函数
    //    [UIView setAnimationDidStopSelector:@selector(stopAmin)];
    //    //----动画的实际 目标结果
    //    //目标位置
    //    imageView.frame =
    //    imageView.alpha =0.7;
    //    //提交运行动画
    //    [UIView commitAnimations];
    
    
    // 淡出效果
    //    CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    //    [fadeOutAnimation setToValue:[NSNumber numberWithFloat:0.3]];
    //    fadeOutAnimation.fillMode = kCAFillModeForwards;
    //    fadeOutAnimation.removedOnCompletion = NO;
    
    UIImageView *imageViewForAnimation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"进度发光点"]];
    //    imageViewForAnimation.frame =CGRectMake(20, 130, 60, 60);
    imageViewForAnimation.alpha = 1.0f;
    //    CGRect imageFrame = imageViewForAnimation.frame;
    //frame.origin，动画开始的地方
    //    CGPoint viewOrigin = imageViewForAnimation.frame.origin;
    //    viewOrigin.y = viewOrigin.y + imageFrame.size.height / 2.0f;
    //    viewOrigin.x = viewOrigin.x + imageFrame.size.width / 2.0f;
    
    //    imageViewForAnimation.frame = imageFrame;
    //    imageViewForAnimation.layer.position = viewOrigin;
    [self addSubview:imageViewForAnimation];
    
    CAKeyframeAnimation *pathAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation2.calculationMode = kCAAnimationPaced;
    pathAnimation2.fillMode = kCAFillModeForwards;
    pathAnimation2.removedOnCompletion = NO;
    //设置动画结束点
    //    CGPoint endPoint = CGPointMake(480.0f - 30.0f, 40.0f);
    //在最后一个选项卡结束动画
    //CGPoint endPoint = CGPointMake( 320-40.0f, 480.0f);
    //    CGMutablePathRef curvedPath = CGPathCreateMutable();
    //    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
    //    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, viewOrigin.y, endPoint.x, viewOrigin.y, endPoint.x, endPoint.y);
    pathAnimation2.path = path.CGPath;
    //    CGPathRelease(curvedPath);
    
    //---------------------
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:pathAnimation2, nil]];
    group.duration = 3.0f;
    //    group.delegate = self;
    [group setValue:imageViewForAnimation forKey:@"imageViewBeingAnimated"];

    [imageViewForAnimation.layer addAnimation:group forKey:@"savingAnimation"];
    
    //设置缩放
    //    CABasicAnimation *resizeAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    //    [resizeAnimation setToValue:[NSValue valueWithCGSize:CGSizeMake(40.0f, imageFrame.size.height * (40.0f / imageFrame.size.width))]];
    //    resizeAnimation.fillMode = kCAFillModeForwards;
    //    resizeAnimation.removedOnCompletion = NO;
    
    //     设置路径运动
    //    CAKeyframeAnimation *pathAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    pathAnimation2.calculationMode = kCAAnimationPaced;
    //    pathAnimation2.fillMode = kCAFillModeForwards;
    //    pathAnimation2.removedOnCompletion = NO;
    //    //设置动画结束点
    //    CGPoint endPoint = CGPointMake(480.0f - 30.0f, 40.0f);
    //    //在最后一个选项卡结束动画
    //    //CGPoint endPoint = CGPointMake( 320-40.0f, 480.0f);
    //    CGMutablePathRef curvedPath = CGPathCreateMutable();
    //    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
    //    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, viewOrigin.y, endPoint.x, viewOrigin.y, endPoint.x, endPoint.y);
    //    pathAnimation2.path = path.CGPath;
    //    CGPathRelease(curvedPath);
    //
    //
    //    CAAnimationGroup *group = [CAAnimationGroup animation];
    //    group.fillMode = kCAFillModeForwards;
    //    group.removedOnCompletion = NO;
    //    [group setAnimations:[NSArray arrayWithObjects:pathAnimation2, nil]];
    //    group.duration = 1.0f;
    //    //    group.delegate = self;
    //    [group setValue:imageViewForAnimation forKey:@"imageViewBeingAnimated"];
    //
    //    [imageViewForAnimation.layer addAnimation:group forKey:@"savingAnimation"];
    
}

@end
