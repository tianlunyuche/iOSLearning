//
//  SDWebImageManager+RWConfig.h
//  SupplyChain
//
//  Created by 刘瑾 on 2016/6/11.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "SDWebImageManager.h"

@interface SDWebImageManager (RWConfig)

+(void)changeDataBase:(NSString *)Db;
+(void) clearCache;

@end
