//
//  LoopQueue.h
//  Control
//
//  Created by xinying on 2016/4/1.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoopQueue : NSObject

- (instancetype)initWithItem:(NSObject *)item andCapcity:(NSUInteger)capacity;
- (instancetype)init;
- (void)enqueue:(NSObject *)item;
- (NSObject *)dequeue;

@end
