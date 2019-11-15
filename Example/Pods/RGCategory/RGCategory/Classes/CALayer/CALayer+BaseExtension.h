//
//  CALayer+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/27.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CALayer (BaseExtension)


/**截取图片*/
- (UIImage *)captureImageWithSize:(CGSize)size opaque:(BOOL)opaque  scale:(CGFloat)scale;

- (UIImage *)captureOriginImageWithSize:(CGSize)size;

@end
