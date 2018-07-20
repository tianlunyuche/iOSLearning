//
//  SDWebImageManager+RWConfig.m
//  SupplyChain
//
//  Created by 刘瑾 on 2016/6/11.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "SDWebImageManager+RWConfig.h"

@implementation SDWebImageManager (RWConfig)

+(void)changeDataBase:(NSString *)Db{
    SDWebImageDownloader *manager = [SDWebImageManager sharedManager].imageDownloader;
    // X-Odoo-Db 是Odoo指定数据库时，请求头Key
    [manager setValue:Db forHTTPHeaderField:@"X-Odoo-Db"];
    [self clearCache];
    
}

+(void) clearCache{
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    [imageCache clearMemory];
    [imageCache clearDisk];
}

@end
