//
//  ContentVIew.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ContentVIew.h"


@implementation ContentVIew

- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if(self){
        [self creatUI];
    }
    return self;
}

- (instancetype)init{
    self =[super init];
    if(self){
        [self creatUI];
    }
    return self;
}

//内容
- (void)concreteContentwithFileName:(NSString *)name ofType:(NSString *)type{
    
    NSError *error =nil;
    NSString *str=[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type] encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        _contentView.text =str;
        
    }else{
        ZXLog(@"flyweights file open error or not exit");
    }
}

- (void)creatUI{
    CGRect textViewRect =CGRectInset(self.bounds, 10.0, 20.0);
    
    _container =[[NSTextContainer alloc] initWithSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)];
    _container.widthTracksTextView =YES;
    
    _layoutManager =[[NSLayoutManager alloc] init];
    [_layoutManager addTextContainer:_container];
    
    _textStorage =[[ZXTextStorage alloc] init];
    [_textStorage addLayoutManager:_layoutManager];
    
    
    _contentView =[[UITextView alloc] initWithFrame:textViewRect textContainer: _container];
    
    _contentView.autoresizingMask =UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _contentView.scrollEnabled =YES;
    _contentView.keyboardDismissMode =UIScrollViewKeyboardDismissModeOnDrag;
    _contentView.font =[UIFont fontWithName:_textStorage.fontName size:18.0];

    [self addSubview:_contentView];
    //通过attribute来改变文字的属性
    //        [_textStorage beginEditing];
    //        NSDictionary *attrsDic = @{NSTextEffectAttributeName: NSTextEffectLetterpressStyle};
    ////        UIKIT_EXTERN NSString *const NSTextEffectAttributeName NS_AVAILABLE_IOS(9_0);          // NSString, default nil: no text effect
    //        NSMutableAttributedString *mutableAttrString = [[NSMutableAttributedString alloc] initWithString:str attributes:attrsDic];
    //        [_textStorage setAttributedString:mutableAttrString];
    //        [_textStorage endEditing];
    //改颜色
    //        [_textStorage beginEditing];
    //        /* Dynamic Coloring Text */
    //        //    self.textStorage.bookItem = [[BookItem alloc] initWithBookName:@"Dynamic Coloring.rtf"];
    //        self.textStorage.tokens = @{@"Alice": @{NSForegroundColorAttributeName: [UIColor redColor]},
    //                                    @"Rabbit": @{NSForegroundColorAttributeName: [UIColor greenColor]},
    //                                    @"DefaultTokenName": @{NSForegroundColorAttributeName: [UIColor cyanColor]}
    //                                    };
    //        NSAttributedString *mstr =[[NSAttributedString alloc] initWithString:str];
    //        [_textStorage setAttributedString:mstr];
    //        [_textStorage endEditing];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
