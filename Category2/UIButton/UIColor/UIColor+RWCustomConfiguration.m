//
//  UIColor+RWCustomConfiguration.m
//  SupplyChain
//
//  Created by 刘瑾 on 2016/12/27.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "UIColor+RWCustomConfiguration.h"

@implementation UIColor (RWCustomConfiguration)


SINGLETON_M(UIColor)

+(UIColor *)colorIsViewBackground{
    return [UIColor colorWithHex:@"f5f5f5"];
    
}

+(UIColor *)colorIsSmallShowView{
    return [UIColor colorWithHex:@"86c900"];
}

+(UIColor *)colorIsShowView{
    return [UIColor colorWithHex:@"9acc35"];
}

+(UIColor *)colorIsFontOfNavigateBar{
    return [UIColor colorWithHex:@"3d4245"];
}

+(UIColor *)colorIsLineOfNavigateBar{
    return [UIColor colorWithHex:@"ababab"];
}

+(UIColor *)colorIsNormalOfPageMenu{
//    return [UIColor colorWithHex:@"2e2e2e"];
    return [UIColor colorWithHex:@"666666"];
}

+(UIColor *)colorIsSelectedOfPageMenu{
//    return [UIColor colorWithHex:@"86c900"];
    return [UIColor colorWithHex:@"4BB400"];
}

//浅色字体颜色
+(UIColor *)colorIsFontOf99999{
    return [UIColor colorWithHex:@"999999"];
}

+(UIColor *)colorIsAlertBackground{
    return [UIColor colorWithHex:@"000000" alpha:0.4];
    
}

@end
