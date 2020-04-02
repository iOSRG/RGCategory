//
//  UIView+MAS.m
//  MyCategary
//
//  Created by HaoShiZai on 2018/2/5.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import "UIView+MAS.h"

@implementation UIView (MAS)

#pragma mark - 单纯的背景
+ (instancetype)viewWithBackgroundColor:(UIColor *)color
                                supView:(UIView *)supView
                                viewMas:(void(^)(MASConstraintMaker *make))viewMas
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    [supView addSubview:view];
    [view mas_makeConstraints:viewMas];
    return view;
    
}
#pragma mark - 带边框的View
+ (instancetype)viewWithBorderColor:(UIColor *)borderColor
                        BorderWidth:(CGFloat)borderWidth
                    BackgroundColor:(UIColor *)color
                            supView:(UIView *)supView
                            viewMas:(void(^)(MASConstraintMaker *make))viewMas
{
    
    UIView *view = [self viewWithBackgroundColor:color supView:supView viewMas:viewMas];
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
    return view;
    
}

#pragma mark - 带圆角的View
+ (instancetype)viewWithCornerRadius:(CGFloat)cornerRadius
                     BackgroundColor:(UIColor *)color
                             supView:(UIView *)supView
                             viewMas:(void(^)(MASConstraintMaker *make))viewMas
{
    UIView *view = [self viewWithBackgroundColor:color supView:supView viewMas:viewMas];
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    return view;
}

- (void)addsubview:(UIView *)subView viewMas:(void(^)(MASConstraintMaker *make))viewMas {
    [self addSubview:subView];
    [subView mas_makeConstraints:viewMas];
}

@end
