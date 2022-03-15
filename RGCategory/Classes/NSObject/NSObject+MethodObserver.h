//
//  NSObject+MethodObserver.h
//  TESTRuntime
//
//  Created by 浮生似梦、Dream on 2019/8/23.
//  Copyright © 2019年 Dream. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MethodObserver)


- (void)ObserverSelector:(SEL)aselector  observerName:(NSString *)observerName callBack:(void(^)(NSArray *arguments))callBack;

- (void)removeObserverWithName:(NSString *)observerName selector:(SEL)aselector;

@end

NS_ASSUME_NONNULL_END
