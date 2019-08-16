//
//  UIImageView+MAS.h
//  crlandRent
//
//  Created by 浮生似梦、Dream on 2019/7/1.
//  Copyright © 2019年 Yongjia Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (MAS)

+ (instancetype)imageViewWithImage:(UIImage *)image
                           supView:(UIView *)supView
                      imageViewMas:(void(^)(MASConstraintMaker *make))imageViewMas;

@end



NS_ASSUME_NONNULL_END
