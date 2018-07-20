//
//  LoopQueue.m
//  Control
//
//  Created by xinying on 2016/4/1.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "LoopQueue.h"

#define DEFAULT_SIZE 10

@interface LoopQueue()

@property(nonatomic)int first;
@property(nonatomic)int last;
@property(nonatomic)NSUInteger capacity;
@property(nonatomic)NSMutableArray *elementData;

@end

@implementation LoopQueue

- (instancetype)initWithItem:(NSObject *)item andCapcity:(NSUInteger)capacity{
    
    self.first= -1;
    self.last = -1;
    self.capacity=capacity;
    self.elementData =[NSMutableArray arrayWithCapacity:capacity];
    if (item ==nil) {
        return self;
    }
    [self.elementData addObject:item];
    
    return self;
}

- (instancetype)init{
    self =[[LoopQueue alloc] initWithItem:nil andCapcity:DEFAULT_SIZE];
    
    return self;
}

- (BOOL)isFull{
    
    return (_first ==0 && _last == _capacity -1) || _first==_last+1;
}

- (BOOL)isEmpty{
    
    return self.first ==-1;
}

- (void)enqueue:(NSObject *)item{
    
    if (![self isFull]) {
        if (_last == _capacity -1 || _last ==-1) {
            self.elementData[0] =item;
            _last =0;
            
            if (_first ==-1) {
                _first =0;
            }
        }else{
            self.elementData[++_last] =item;
        }
    }else{
        self.capacity++;
        self.last++;
        [self.elementData addObject:item];
    }
}

- (NSObject *)dequeue{
    
    if (![self isEmpty]) {
        NSObject *tmp =self.elementData[_first];
        if (_first ==_last) {
            _last =_first= -1;
        }
        else if(_first ==_capacity -1){
            _first =0;
        }else{
            _first++;
        }
        return tmp;
    }else{
        NSLog(@"fail: Queue is Empty");
        return nil;
    }
}




@end
