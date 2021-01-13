//
//  CALayer+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/27.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "CALayer+BaseExtension.h"
#import <UIKit/UIKit.h>
@implementation CALayer (BaseExtension)

#pragma mark - 截取图片
- (UIImage *)captureImageWithSize:(CGSize)size opaque:(BOOL)opaque  scale:(CGFloat)scale
{
    //opaque 不透明  size大小   scale比例
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    [self renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (UIImage *)captureOriginImageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
