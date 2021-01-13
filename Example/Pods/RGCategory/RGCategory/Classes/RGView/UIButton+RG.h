//
//  UIButton+RG.h
//  RG_Viwe
//
//  Created by koogfook on 17/5/13.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (RG)


/**
 * 默认的背景图片
 *
 */
-(UIButton* (^)(NSString *imageName))rg_NormalBackImageName;

/**
 * 选择的背景图片
 *
 */
-(UIButton* (^)(NSString *imageName))rg_SelectedBackImageName;

/**
 * 默认的图片
 *
 */
-(UIButton* (^)(NSString *imageName))rg_NormalImageName;

/**
 * 选择状态的图片
 *
 */
-(UIButton* (^)(NSString *imageName))rg_SelectedImageName;

/**
 * 自定义图片和状态
 *
 */
-(UIButton* (^)(NSString *imageName , UIControlState controlState))rg_ControlStateAndImageName;

/**
 * 选中状态下的标题
 *
 */
-(UIButton* (^)(NSString *title))rg_SelectedTitle;

/**
 * 正常状态下的标题
 *
 */
-(UIButton* (^)(NSString *title))rg_NormalTitle;

-(UIButton* (^)(NSAttributedString *attributedTitle))rg_NormalAttributedTitle;

-(UIButton* (^)(NSAttributedString *attributedTitle))rg_SelectedAttributedTitle;

/**
 * 自定义标题,颜色和状态
 *
 */
-(UIButton* (^)(NSString *title , UIColor *color,UIControlState controlState))rg_ControlStateForTitleAndColor;


/**
 * 标题字体大小
 *
 */
-(UIButton* (^)(CGFloat titleFontSize))rg_titleFontSize;

/**
 * 选中状态下的文字颜色
 *
 */
-(UIButton* (^)(UIColor *color))rg_SelectedTitleColor;

/**
 * 正常状态下的文字颜色
 *
 */
-(UIButton* (^)(UIColor *color))rg_NormalTitleColor;


/**
 * 是否能使用
 *
 */
-(UIButton* (^)(BOOL enabled))rg_userInteractionEnabled;


/**
 * 不可选状态下的文字
 *
 */
-(UIButton* (^)(NSString *title))rg_DisabledTitle;
/**不可选状态下的文字颜色*/
-(UIButton* (^)(UIColor *color))rg_DisabledTitleColor;



@end
