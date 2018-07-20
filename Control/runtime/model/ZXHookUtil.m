//
//  ZXHookUtil.m
//  Control
//
//  Created by xinying on 2016/12/2.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXHookUtil.h"
#import <objc/runtime.h>

@implementation ZXHookUtil

+(void)swizzlingInClass:(Class)cls originSel:(SEL)origSel swizzedSel:(SEL)swizzedSel{
    
    Class class =cls;
//    Method orginMethod =class_getInstanceMethod(class, origSel);
//    Method swizzledMethod =class_getInstanceMethod(class, origSel);
//
//    BOOL didAddMethod =class_addMethod(class, origSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//
//    if(didAddMethod){
//        class_replaceMethod(class, swizzedSel, method_getImplementation(orginMethod), method_getTypeEncoding(orginMethod));
//    }else{
//        method_exchangeImplementations(orginMethod, swizzledMethod);
//    }
    
    
    Method originalMethod = class_getInstanceMethod(class, origSel);
    Method swizzledMethod = class_getInstanceMethod(class, swizzedSel);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    origSel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzedSel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
