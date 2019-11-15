//
//  UIView+Other.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Other)

/**视图截取成为图片*/
- (UIImage *)getImageWithContextSize:(CGSize)size;

- (void)whenTapped:(void (^)(void))block;

@end
