//
//  ChairDecorator.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ChairDecorator.h"

@implementation ChairDecorator

-(double)totalMoney{
    return self.house.totalMoney+100;
}

-(NSString *)detialInfo{
    return [NSString stringWithFormat:@"%@--椅子",self.house.detialInfo];
}

@end
