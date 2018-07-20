//
//  UILabel+ZX.m
//  SupplyChain
//
//  Created by Johnson on 2016/7/12.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "UILabel+ZX.h"

@implementation UILabel (ZX)

//给UILabel设置行间距和字间距
-(void)setLabelStyle01withValue:(NSString*)str withLineSpace:(CGFloat)lineSpace{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    self.attributedText =  [[NSAttributedString alloc] initWithString:str attributes:dic];
}

@end
