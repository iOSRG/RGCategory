//
//  NSObject+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "NSObject+BaseExtension.h"
#import <objc/runtime.h>

static const void *Saveresult = &Saveresult;

@implementation NSObject (BaseExtension)

-(NSString*)JSONString {
    if (!self)return nil;
    
    if (![self isKindOfClass:[NSDictionary class]]) return @"";
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *string = nil;
    
    if (!error&&data.length) {
        string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        NSLog(@"转为字符串失败....");
    }
    
    return string;
}


//MARK: - 倒计时
+ (void)makeTimerWithTimeout:(NSInteger)time  eventBlock:(void (^)(id result))eventBlock  timeoutBlock:(void (^)())timeoutBlock
{
    
    __block NSInteger timeout=time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //1.创建source
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    //定时器事件
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            //取消定时器
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //超时操作
                timeoutBlock();
                
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                //定时操作
                eventBlock(strTime);
                [UIView commitAnimations];
                
            });
            timeout--;
        }
    });
    //开始定时
    dispatch_resume(_timer);
    
    
}

//MARK: - 图片写入相册
- (void)ImageWriteToSavedPhotosAlbum:(UIImage *)image result:(void(^)(NSError *error))result {
    
    objc_setAssociatedObject(self, Saveresult, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    
    void (^saveResult)(NSError *error) = objc_getAssociatedObject(self, Saveresult);
    saveResult(error);
    
}

@end
