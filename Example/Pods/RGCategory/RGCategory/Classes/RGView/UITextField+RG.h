//
//  UITextField+RG.h
//  RG_Viwe
//
//  Created by koogfook on 17/5/13.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (RG)

//密码类型
-(UITextField* (^)(BOOL secureTextEntry))rg_SecureTextEntry;

//占位文字和颜色
-(UITextField* (^)(NSString *placeholder, UIColor *PlaceholderColor))rg_PlaceholderAndPlaceholderColor;
//左视图
-(UITextField* (^)(UIView *leftView))rg_LeftView;
//左视图和Frame
-(UITextField* (^)(UIView *leftView ,CGRect frame))rg_LeftViewAndLeftViewFrame;


//占位文字
-(UITextField* (^)(NSString *placeholder))rg_Placeholder;

//键盘类型
-(UITextField* (^)(UIKeyboardType keyboardType))rg_KeyboardType;
//代理
-(UITextField* (^)(id delegate))rg_Delegate;

//右视图和Frame
-(UITextField* (^)(UIView *rightView ,CGRect frame))rg_RightViewAndRightViewFrame;

//右视图
-(UITextField* (^)(UIView *rightView))rg_RightView;

/**
 * 字体大小
 *
 */
-(UITextField* (^)(CGFloat fontSize))rg_fontSize;

/**
 * 字体大小
 *
 */
-(UITextField* (^)(UIColor *textColor))rg_textColor;
/**一键清除*/
-(UITextField* (^)(UITextFieldViewMode mode))rg_clearsEditing;
/**光标颜色*/
- (UITextField* (^)(UIColor *tintColor))rg_tincolor;


/**边框样式*/
- (UITextField* (^)(UITextBorderStyle borderStyle))rg_borderStyle;

/**done按钮的样式*/
- (UITextField* (^)(UIReturnKeyType returnKeyType))rg_returnKeyType;

@end
