//
//  ContentVIew.h
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXTextStorage.h"

//
@interface ContentVIew : UIView

//定义了一个矩形区域用于存放已经进行了排版并设置好属性的文字。
@property(nonatomic,strong)NSTextContainer *container;

//NSLayoutManager用于管理NSTextStorage其中的文字内容的排版布局。
@property(nonatomic,strong)NSLayoutManager *layoutManager;
/**
 NSTextStorage保存并管理的UITextView要展示的文字内容，该类是NSMutableAttributedString的子类，由于可以灵活地往文字添加或修改属性，所以非常适用于保存并修改文字属性。
 **/
@property(nonatomic,copy)ZXTextStorage *textStorage;

@property(nonatomic,strong)UITextView *contentView;

//内容
- (void)concreteContentwithFileName:(NSString *)name ofType:(NSString *)type;

@end
