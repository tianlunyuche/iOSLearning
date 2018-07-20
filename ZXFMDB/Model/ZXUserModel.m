//
//  ZXUserModel.m
//  Control
//
//  Created by xinying on 2016/5/23.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXUserModel.h"

@implementation ZXUserModel


+ (instancetype)modalWith:(NSString *)name no:(NSInteger)ID_No {
    ZXUserModel *modal = [[ZXUserModel alloc] init];
    modal.name = name;
    modal.ID_No = ID_No;
    return modal;
}

@end
