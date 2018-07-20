//
//  CommercialHouse.h
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "House.h"


//House的子类CommercialHouse，被装饰对象:
@interface CommercialHouse : House
-(double)totalMoney;

-(NSString *)detialInfo;
@end
