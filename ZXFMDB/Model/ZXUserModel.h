//
//  ZXUserModel.h
//  Control
//
//  Created by xinying on 2016/5/23.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXUserModel : NSObject


@property (nonatomic, copy) NSString *name;


@property (nonatomic, assign) NSInteger ID_No;

+ (instancetype)modalWith:(NSString *)name no:(NSInteger)ID_No;

@end
