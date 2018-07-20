//
//  ChairDecorator.h
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "HouseDecorator.h"
#import "House.h"

@interface ChairDecorator : HouseDecorator

@property(nonatomic,strong)House *house;
@end
