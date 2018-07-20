//
//  ZXfmdbTool.h
//  Control
//
//  Created by xinying on 2016/5/23.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

typedef void(^ZXDBBlock)(FMDatabase *nn_db);

@interface ZXfmdbTool : NSObject

+ (instancetype)sharedInstance;

- (void)execSqlInFmdb:(NSString *)fileName dbFileName:(NSString *)dbName dbHandler:(ZXDBBlock)block;

@end
