//
//  ZXTextStorage.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXTextStorage.h"

NSString *const DefaultTokenName =@"DefaultTokenName";
@interface ZXTextStorage (){
    
    NSMutableAttributedString *_storingText;
    BOOL _dynamicTextNeedsUpdate;  //文字是否需要更新
}

@end

@implementation ZXTextStorage

- (id)init{
    
    self =[super init];
    if (self) {
        _storingText =[[NSMutableAttributedString alloc] init];
    }
    return self;
}

- (NSString *)fontName{
    
    NSArray *fontFamily =[UIFont familyNames];
    NSString *str =fontFamily[6];
    
    return str;
}

// 返回保存的文字
-(NSString *)string{
    
    return [_storingText string];
}

// 获取指定范围内的文字属性
-(NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range{
    
    return [_storingText attributesAtIndex:location effectiveRange:range];
}

// 设置指定范围内的文字属性
-(void)setAttributes:(NSDictionary *)attrs range:(NSRange)range{
    
    [self beginEditing];
    [_storingText setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
    
    [self endEditing];
}

// 修改指定范围内的文字
-(void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str{
    
    [self beginEditing];
    [_storingText replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedAttributes | NSTextStorageEditedCharacters range:range changeInLength:str.length - range.length];
    _dynamicTextNeedsUpdate = YES;
    [self endEditing];
}


@end
