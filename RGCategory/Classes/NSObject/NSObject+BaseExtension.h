//
//  NSObject+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/23.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NSObject (BaseExtension)

-(NSString*)JSONString;

/*倒计时*/
+ (void)makeTimerWithTimeout:(NSInteger)time  eventBlock:(void (^)(id result))eventBlock  timeoutBlock:(void (^)(void))timeoutBlock;

///图片写入相册
- (void)ImageWriteToSavedPhotosAlbum:(UIImage *)image result:(void(^)(NSError *error))result;

@end
