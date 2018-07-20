//
//  UIColor+RWCustomConfiguration.h
//  SupplyChain
//
//  Created by 刘瑾 on 2016/12/27.
//  Copyright © 2016年 libin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ColorSingleton [UIColor sharedInstance]

#define RWBackGroudViewAlpha 0.4

@interface UIColor (RWCustomConfiguration)

SINGLETON_H(UIColor)

//视图背景颜色
+(UIColor *)colorIsViewBackground;
//小区域范围突出显示颜色
+(UIColor *)colorIsSmallShowView;
//大区域范围突出显示颜色
+(UIColor *)colorIsShowView;
//导航栏字体颜色
+(UIColor *)colorIsFontOfNavigateBar;
//导航栏分割线颜色
+(UIColor *)colorIsLineOfNavigateBar;
//分页菜单正常状态颜色
+(UIColor *)colorIsNormalOfPageMenu;
//分页 菜单选择状态颜色
+(UIColor *)colorIsSelectedOfPageMenu;
//浅色字体颜色
+(UIColor *)colorIsFontOf99999;
//灰色背景
+(UIColor *)colorIsAlertBackground;
// 导航栏
@property (nonatomic, readonly) UIColor * nacTitleColor;
@property (nonatomic, readonly) UIColor * sepe;


@end
