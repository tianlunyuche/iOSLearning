//
//  UIControl+userStatistics.m
//  Control
//
//  Created by xinying on 2016/12/2.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "UIControl+userStatistics.h"
#import "ZXHookUtil.h"

@implementation UIControl (userStatistics)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        SEL orginSel =@selector(sendAction:to:forEvent:);
        SEL swizzledSel =@selector(swiz_sendAction:to:forEvent:);
        [ZXHookUtil swizzlingInClass:self.class originSel:orginSel swizzedSel:swizzledSel];
        
        SEL orginSel2 =@selector(addTarget:action:forControlEvents:);
        SEL swizzledSel2 =@selector(swiz_addTarget:action:forControlEvents:);
        [ZXHookUtil swizzlingInClass:self.class originSel:orginSel2 swizzedSel:swizzledSel2];
    });
}
    
- (void)swiz_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    
    //插入埋点代码
    [self performUserStaticAciton:action to:target forEvent:event];
    [self swiz_sendAction:action to:target forEvent:event];
}
    
-(void)performUserStaticAciton:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    
    NSString *eventID =nil;
    //统计触摸结束时
    if(event.allTouches.anyObject.phase == UITouchPhaseEnded){
        
        NSString *actionStr =NSStringFromSelector(action);
        NSString *targetName =NSStringFromClass([target class]);
        NSDictionary *dic =[self dictFromPlist];
        
        eventID =dic[targetName][@"ControlEventIDs"][actionStr];
    }
    if(eventID !=nil){
        ZXLog(@"%@",eventID);
    }
}

-(void)swiz_addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    [self performUserStaticTarget:target action:action forControlEvents:controlEvents];
    [self swiz_addTarget:target action:action forControlEvents:controlEvents];
}

    
-(void)performUserStaticTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    ZXLog(@"performUserStaticTarget %@ %@",target,NSStringFromSelector(action));
}
    
-(NSDictionary *)dictFromPlist{
    
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"userForVistingVCID" ofType:@"plist"];
    NSDictionary *dic =[NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return dic;
}
    
@end
