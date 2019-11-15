//
//  UIView+Other.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UIView+Other.h"
#import <objc/runtime.h>

static const void *GestureRecognizerKey = &GestureRecognizerKey;

#pragma mark Private
@interface ViewWrapper : NSObject <NSCopying>

@property (nonatomic) UIControlEvents controlEvents;
@property (nonatomic, copy) void (^block)();

@end


@implementation ViewWrapper


-(id)initWithHandler:(void (^)(void))block
{
    
    if (self = [super init]) {
        
        self.block = block;
    }
    
    return self;
}


- (id)copyWithZone:(NSZone *)zone
{
    return [[ViewWrapper alloc] initWithHandler:self.block];
}

-(void)tapClick:(id)sender
{
    self.block(sender);
}

@end


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

- (void)whenTouches:(NSUInteger)numberOfTouches tapped:(NSUInteger)numberOfTaps handler:(void (^)(void))block
{
    ViewWrapper *viewWra = [[ViewWrapper alloc] initWithHandler:block];
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:viewWra action:@selector(tapClick:)];
    objc_setAssociatedObject(self, GestureRecognizerKey, viewWra, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addGestureRecognizer:tapGr];
    
}

- (void)whenTapped:(void (^)(void))block
{   self.userInteractionEnabled = YES;
    [self whenTouches:1 tapped:1 handler:block];
}

@end
