//
//  UIView+Other.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UIView+Other.h"

@implementation UIView (Other)


//MARK: - 截图
- (UIImage *)getImageWithContextSize:(CGSize)size
{
 UIGraphicsBeginImageContextWithOptions(CGSizeMake((NSInteger)size.width, (NSInteger)size.height), NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //        NSData *imageData = UIImageJPEGRepresentation(image, 0.75f);
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
    image = [UIImage imageWithData:imageData];
    
    return image;
    
}

@end
