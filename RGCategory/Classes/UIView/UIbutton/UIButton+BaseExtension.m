//
//  UIButton+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UIButton+BaseExtension.h"
#import <objc/runtime.h>

static const void *ControlHandlersKey = &ControlHandlersKey;

//MARK: - ControlWrapper

@interface ControlWrapper : NSObject <NSCopying>

- (id)initWithHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

@property (nonatomic) UIControlEvents controlEvents;
@property (nonatomic, copy) void (^handler)(id sender);

@end


@implementation ControlWrapper

-(id)initWithHandler:(void (^)(id))handler forControlEvents:(UIControlEvents)controlEvents
{
    
    if (self = [super init]) {
        
        self.controlEvents = controlEvents;
        self.handler = handler;
    }
    
    return self;
}


- (id)copyWithZone:(NSZone *)zone
{
    return [[ControlWrapper alloc] initWithHandler:self.handler forControlEvents:self.controlEvents];
}

-(void)btnClick:(id)sender
{
    self.handler(sender);
}

@end


//MARK: - UIButton

@implementation UIButton (BaseExtension)
+(instancetype)Button{
    
    UIButton *button = nil;
    
    button = [[self alloc]init];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    return button;
}



+(instancetype)ButtonWithNormalTitle:(NSString *)normalTitle  NormalTitleColor:(UIColor *)NormalTitleColor
{
    
    
    UIButton *btn = [self Button];
    [btn  setTitle:normalTitle forState:UIControlStateNormal];
    [btn  setTitleColor:NormalTitleColor forState:UIControlStateNormal];
    return btn;
}


+(instancetype)ButtonWithNormalTitle:(NSString *)normalTitle
                    NormalTitleColor:(UIColor *)NormalTitleColor
                         selectTitle:(NSString *)selectTitle
                    selcetTitleColor:(UIColor *)selectTitleColor

{
    
    UIButton *btn = [self ButtonWithNormalTitle:normalTitle NormalTitleColor:NormalTitleColor];
    [btn  setTitle:selectTitle forState:UIControlStateSelected];
    [btn  setTitleColor:selectTitleColor forState:UIControlStateSelected];
    return btn;
}



-(void)setBtnTitle:(NSString *)title   tilteColor:(UIColor *)color forState:(UIControlState)state
{
    
    [self setTitleColor:color forState:state];
    [self setTitle:title forState:state];
}

- (void)setFontSize:(CGFloat)fontSize
{
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    [self setImage:selectedImage forState:UIControlStateSelected];
}


- (void)addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents
{
    ControlWrapper *controlW = [[ControlWrapper alloc] initWithHandler:handler forControlEvents:controlEvents];
    objc_setAssociatedObject(self, ControlHandlersKey, controlW, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:controlW action:@selector(btnClick:) forControlEvents:controlEvents];
    
}

@end
