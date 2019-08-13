//
//  UIImage+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UIImage+BaseExtension.h"
#import <objc/runtime.h>

static const void *BeforeBlockKey = &BeforeBlockKey;
static const void *FinishBlockKey = &FinishBlockKey;

@implementation UIImage (BaseExtension)

#pragma mark - 图片写入相册
- (void)SavedPhotosAlbumWithBeforBlock:(SavedPhotosAlbumBeforeBlock)beforeBlock  FinishBlock:(SavedPhotosAlbumFinishBlock)finishBlock
{
    
    if (beforeBlock) {
        beforeBlock();
    }
    
    if (finishBlock) {
        objc_setAssociatedObject(self, FinishBlockKey, finishBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    SavedPhotosAlbumFinishBlock block = objc_getAssociatedObject(self, FinishBlockKey);
    block(error);
    
}

@end
