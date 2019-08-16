//
//  UIView+MAS.h
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasHeader.h"

@interface UIView (MAS)

/**单纯的背景*/
+ (instancetype)viewWithBackgroundColor:(UIColor *)color
                                supView:(UIView *)supView
                              viewMas:(void(^)(MASConstraintMaker *make))viewMas;
/**带边框的View*/
+ (instancetype)viewWithBorderColor:(UIColor *)borderColor
                        BorderWidth:(CGFloat)borderWidth
                    BackgroundColor:(UIColor *)color
                            supView:(UIView *)supView
                            viewMas:(void(^)(MASConstraintMaker *make))viewMas;

/**带圆角的View*/
+ (instancetype)viewWithCornerRadius:(CGFloat)cornerRadius
                     BackgroundColor:(UIColor *)color
                             supView:(UIView *)supView
                             viewMas:(void(^)(MASConstraintMaker *make))viewMas;


@end
