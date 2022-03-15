//
//  UIView+Frame.h
//  MVCDemo
//
//  Created by 浮生似梦、Dream on 2018/6/25.
//  Copyright © 2018年 浮生似梦、Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;


@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

- (CGFloat)maxWidth;
- (CGFloat)maxHeight;

@end
