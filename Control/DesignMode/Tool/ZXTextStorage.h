//
//  ZXTextStorage.h
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTextStorage : NSTextStorage

@property (nonatomic, strong) NSString     *fontName;
@property (nonatomic, copy)   NSDictionary *tokens; // a dictionary, keyed by text snippets（小片段）, with attributes we want to add
//@property (nonatomic, strong) BookItem     *bookItem;

-(NSString *)string; // 返回保存的文字
-(NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;// 获取指定范围内的文字属性

// Must override NSMutableAttributedString primitive method
-(void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;          // 设置指定范围内的文字属性
-(void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;// 修改指定范围内的文字
@end
