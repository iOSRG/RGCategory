//
//  UIColor+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BaseExtension)

/*颜色生成图片*/
- (UIImage *)color2Image;

- (UIImage *)color2ImageSized:(CGSize)size;


+ (UIColor*) colorWithCSS: (NSString*) css;
+ (UIColor*) colorWithHex: (NSUInteger) hex;

- (uint)hex;
- (NSString*)hexString;
- (NSString*)cssString;




@end
