//
//  UIButton+MAS.h
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface UIButton (MAS)

/**正常的文字、文字颜色、背景色、字体*/
+(instancetype)ButtonWithNormalTitle:(NSString *)normalTitle
                    NormalTitleColor:(UIColor *)NormalTitleColor
                            FontSize:(CGFloat)FontSize
                     backgroundColor:(UIColor *)backgroundColor
                             supView:(UIView *)supView
                           buttonMas:(void(^)(MASConstraintMaker *make))btnMas;


/**包含正常和选中的文字、文字颜色、背景色、字体*/
+(instancetype)ButtonWithselectTitle:(NSString *)selectTitle
                    selcetTitleColor:(UIColor *)selectTitleColor 
                         NormalTitle:(NSString *)normalTitle
                    NormalTitleColor:(UIColor *)NormalTitleColor
                     backgroundColor:(UIColor *)backgroundColor
                            FontSize:(CGFloat)FontSize
                             supView:(UIView *)supView
                           buttonMas:(void(^)(MASConstraintMaker *make))btnMas;



/**选中时的图片和正常的图片、背景色*/
+(instancetype)ButtonWithSelectedImage:(UIImage *)selectedImage
                           NormalImage:(UIImage *)normalImage
                       backgroundColor:(UIColor *)backgroundColor
                               supView:(UIView *)supView
                             buttonMas:(void(^)(MASConstraintMaker *make))btnMas;
/**只有一张正常的图片、背景色*/
+(instancetype)ButtonWithNormalImage:(UIImage *)normalImage
                       backgroundColor:(UIColor *)backgroundColor
                               supView:(UIView *)supView
                             buttonMas:(void(^)(MASConstraintMaker *make))btnMas;



@end
