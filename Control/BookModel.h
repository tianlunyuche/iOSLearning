//
//  BookModel.h
//  Control
//
//  Created by xinying on 2016/2/12.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
//书名
@property(retain,nonatomic)NSString* mBookName;
//图片价格
@property(retain,nonatomic)NSString* mBookPrice;
//出版社
@property(retain,nonatomic)NSString* mPublisher;
//图片地址
@property(retain,nonatomic)NSString* mImageURL;

@end
