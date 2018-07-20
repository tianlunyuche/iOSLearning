//
//  UIImage+RoundRectImage.h
//  Control
//
//  Created by xinying on 2016/3/24.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundRectImage)

+ (UIImage *)imageOfRoundRectWithImage: (UIImage *)image
                                  size: (CGSize)size
                                radius: (CGFloat)radius;

@end
