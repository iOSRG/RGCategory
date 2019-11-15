//
//  UIButton+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BaseExtension)

+(instancetype)ButtonWithNormalTitle:(NSString *)normalTitle
                    NormalTitleColor:(UIColor *)NormalTitleColor
                         selectTitle:(NSString *)selectTitle
                    selcetTitleColor:(UIColor *)selectTitleColor;

+(instancetype)ButtonWithNormalTitle:(NSString *)normalTitle  NormalTitleColor:(UIColor *)NormalTitleColor;


-(void)setBtnTitle:(NSString *)title   tilteColor:(UIColor *)color forState:(UIControlState)state;

- (void)setFontSize:(CGFloat)fontSize;

- (void)setSelectedImage:(UIImage *)selectedImage;

//快速实现点击事件
- (void)addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;


@end
