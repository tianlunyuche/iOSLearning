//
//  UIButton+RWStyleConfiguration.m
//  SupplyChain
//
//  Created by Lucky.Liu on 2016/4/27.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "UIButton+RWStyleConfiguration.h"

@implementation UIButton (RWStyleConfiguration)

-(void)setButtonStyle001{
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.height/2;
    self.layer.masksToBounds = YES;
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:@"9acc35"].CGColor, (__bridge id)[UIColor colorWithHex:@"79bd50"].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
    if (ScreenWidth ==414.0) {
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) +40, CGRectGetHeight(self.frame));
    }else{
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) , CGRectGetHeight(self.frame));
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

-(void)setButtonStyle002{
    [self layoutIfNeeded];
    [self updateConstraints];
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

-(void)setButtonStyle003{
    [self setTitleColor:[UIColor colorWithHex:@"6BB400"] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:@"9ACC35" alpha:0.1] size:self.bounds.size] forState:UIControlStateHighlighted];
    
}

-(void)setButtonStyle004{
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.height/2;
    self.layer.masksToBounds = YES;
    self.layer.borderColor =[UIColor colorWithHex:@"CCCCCC"].CGColor;
}

@end
