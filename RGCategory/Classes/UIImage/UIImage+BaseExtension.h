//
//  UIImage+BaseExtension.h
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SavedPhotosAlbumBeforeBlock)(void);

typedef void(^SavedPhotosAlbumFinishBlock)(NSError *error);

@interface UIImage (BaseExtension)

/**图片写入相册*/
- (void)SavedPhotosAlbumWithBeforBlock:(SavedPhotosAlbumBeforeBlock)beforeBlock  FinishBlock:(SavedPhotosAlbumFinishBlock)finishBlock;

@end
