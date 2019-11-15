//
//  UIDevice+BaseExtension.h
//  RGCategory_Example
//
//  Created by 浮生似梦、Dream on 2019/8/21.
//  Copyright © 2019年 18607304107@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define SERVER_NAME        @"SERVER_NA"
#define UUID_KEY           @"UUID_KEY"

@interface UIDevice (BaseExtension)

- (NSString *)uniqueDeviceIdentifier;

@end

NS_ASSUME_NONNULL_END
