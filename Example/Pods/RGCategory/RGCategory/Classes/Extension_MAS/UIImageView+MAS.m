//
//  UIImageView+MAS.m
//  crlandRent
//
//  Created by 浮生似梦、Dream on 2019/7/1.
//  Copyright © 2019年 Yongjia Liu. All rights reserved.
//

#import "UIImageView+MAS.h"

@implementation UIImageView (MAS)

+ (instancetype)imageViewWithImage:(UIImage *)image
                           supView:(UIView *)supView
                      imageViewMas:(void(^)(MASConstraintMaker *make))imageViewMas {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [supView addSubview:imageView];
    [imageView mas_makeConstraints:imageViewMas];
    return imageView;
}

@end
