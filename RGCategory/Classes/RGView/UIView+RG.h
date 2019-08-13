//
//  UIView+RG.h
//  链式变成思想
//
//  Created by koogfook on 17/5/12.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RG)

-(UIView* (^)(UIColor *backgroundColor))rg_backgroundColor;

-(UIView* (^)(UIView* supView))rg_supView;
/**
 * 设置圆角
 *
 */
-(UIView* (^)(CGFloat cornerRadius))rg_CornerRadius;
/**
 * 设置边框大小和颜色
 *
 */
-(UIView* (^)( CGFloat borderWidth ,UIColor *borderColor ))rg_borderWidthAndBorderColor;


/**
 * 设置填充方式
 *
 */

- (UIView * (^)(UIViewContentMode  contentMode))rg_contentMode;

/**设置透明度*/
-(UIView* (^)(CGFloat alpha))rg_alpha;

/**设置hidden*/
-(UIView* (^)(BOOL hidden))rg_hidden;

/**设置tag*/
-(UIView* (^)(NSInteger tag))rg_tag;

/**设置userInteractionEnabled*/
-(UIView* (^)(BOOL userInteractionEnabled))rg_userInteractionEnabled;

@end
