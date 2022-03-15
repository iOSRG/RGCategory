//
//  UIFont+Swizzing.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/22.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UIFont+Swizzing.h"
#import <objc/runtime.h>

void class_swizzleInstanceMethod(Class class, SEL originalSEL, SEL replacementSEL)
{
    
    Method originMethod = class_getInstanceMethod(class, originalSEL);
    Method replaceMethod = class_getInstanceMethod(class, replacementSEL);

    if(class_addMethod(class, originalSEL, method_getImplementation(replaceMethod),method_getTypeEncoding(replaceMethod)))
    {
        class_replaceMethod(class,replacementSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else {
        method_exchangeImplementations(originMethod, replaceMethod);
    }
}

@implementation UIFont (Swizzing)

+ (void)load {
    
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"phoneVersion = %@",phoneVersion);
    if ([phoneVersion floatValue] < 10) {
        //iOS10以下有些字体是没有的
        Class class2 = object_getClass(self);
        class_swizzleInstanceMethod(class2, @selector(fontWithName:size:), @selector(RG_FontWithName:size:));
    }
    
}

+ (UIFont *)RG_FontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:fontSize];
    
}

@end
