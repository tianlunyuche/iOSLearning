//
//  UIImage+ZXQRcode.h
//  Control
//
//  Created by xinying on 2016/3/24.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZXQRcode)

+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress;

+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize;

+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize
                          red: (NSUInteger)red
                        green: (NSUInteger)green
                         blue: (NSUInteger)blue;

+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize
                          red: (NSUInteger)red
                        green: (NSUInteger)green
                         blue: (NSUInteger)blue
                  insertImage: (UIImage *)insertImage;


+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize
                          red: (NSUInteger)red
                        green: (NSUInteger)green
                         blue: (NSUInteger)blue
                  insertImage: (UIImage *)insertImage
                  roundRadius: (CGFloat)roundRadius;


@end
