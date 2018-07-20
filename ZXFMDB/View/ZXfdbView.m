//
//  ZXfdbView.m
//  Control
//
//  Created by xinying on 2016/5/23.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXfdbView.h"

@implementation ZXfdbView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self layoutUI];
    }
    return self;
}


- (void)layoutUI{
    
    _card_idTextField =[[UITextField alloc] initWithFrame:CGRectMake(10, 60, 100, 40)];
    _card_idTextField.text =@"20";
    [self addSubview:_card_idTextField];
    
    _nickNameTextField =[[UITextField alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    _nickNameTextField.text =@"小猫";
    [self addSubview:_nickNameTextField];
}

@end
