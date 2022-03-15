//
//  UITextField+RG.m
//  RG_Viwe
//
//  Created by koogfook on 17/5/13.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import "UITextField+RG.h"

@implementation UITextField (RG)

//+(void)a
//{
//    UITextField *fi  =[UITextField new];
//    fi.keyboardType = UIKeyboardTypeNumberPad;
//    fi.placeholder = @"";
//    fi.leftView= nil;
//    fi.leftViewMode=UITextFieldViewModeAlways;
//    fi.secureTextEntry = YES;
//     [fi setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
//}



//密码类型
-(UITextField* (^)(BOOL secureTextEntry))rg_SecureTextEntry
{
    
    return ^UITextField *(BOOL secureTextEntry){
        
        self.secureTextEntry = YES;
        
        return  nil;
        
    };
}

//键盘类型
-(UITextField* (^)(UIKeyboardType keyboardType))rg_KeyboardType
{
    
    return ^UITextField *(UIKeyboardType keyboardType){
        
        self.keyboardType = keyboardType;
        
        return self;
        
    };
}


//占位文字
-(UITextField* (^)(NSString *placeholder))rg_Placeholder
{
    
    return ^UITextField *(NSString *placeholder){
        
        self.placeholder = placeholder;
        
        return self;
        
    };
}


//}

//占位文字和颜色
-(UITextField* (^)(NSString *placeholder, UIColor *PlaceholderColor))rg_PlaceholderAndPlaceholderColor
{
    
    return ^UITextField *(NSString *placeholder, UIColor *PlaceholderColor){
        if ([placeholder isKindOfClass:[NSString class]] && [PlaceholderColor isKindOfClass:[UIColor class]]) {
                   self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:PlaceholderColor}];
        }
//        self.placeholder = placeholder;
//        [self setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
        return self;
        
    };
}


//左视图
-(UITextField* (^)(UIView *leftView))rg_LeftView{
    
    return ^UITextField *(UIView *leftView){
        
        self.leftView= leftView;
        self.leftViewMode=UITextFieldViewModeAlways;
      
        return self;
        
    };
}
//左视图和frame
-(UITextField* (^)(UIView *leftView ,CGRect frame))rg_LeftViewAndLeftViewFrame{
    
    
    return ^UITextField *(UIView *leftView ,CGRect frame){
        
        self.leftView= leftView;
        self.leftView.frame = frame;
        self.leftViewMode=UITextFieldViewModeAlways;
        
        return self;
        
    };
}


//左视图
-(UITextField* (^)(UIView *rightView))rg_RightView{
    
    return ^UITextField *(UIView *rightView){
        
        self.rightView= rightView;
        self.rightViewMode=UITextFieldViewModeAlways;
        
        return self;
        
    };
}
//右视图和frame
-(UITextField* (^)(UIView *rightView ,CGRect frame))rg_RightViewAndRightViewFrame{
    
    
    return ^UITextField *(UIView *rightView ,CGRect frame){
        
        self.rightView= rightView;
        self.rightView.frame = frame;
        self.rightViewMode=UITextFieldViewModeAlways;
        
        return self;
        
    };
}




//代理
-(UITextField* (^)(id delegate))rg_Delegate{
    
    return ^UITextField *(id delegate){
        
        self.delegate= delegate;
        return self;
        
    };
}


#pragma mark - 字体大小
-(UITextField* (^)(CGFloat fontSize))rg_fontSize{
    
    return ^UITextField *(CGFloat fontSize){
        
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
        
    };
}

-(UITextField* (^)(NSTextAlignment textAlignment))rg_textAlignment {
    
    return ^UITextField *(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
        
    };
}

#pragma mark - 字体颜色
-(UITextField* (^)(UIColor *textColor))rg_textColor{
    
    return ^UITextField *(UIColor *textColor){
        
        self.textColor = textColor;
        
        return self;
        
    };
}

#pragma mark - 一键清除
-(UITextField* (^)(UITextFieldViewMode mode))rg_clearsEditing{
    
    return ^UITextField *(UITextFieldViewMode mode){
        
        self.clearsOnBeginEditing = NO;
        self.clearButtonMode = mode;
        
        return self;
        
    };
}

#pragma mark - 光标颜色

- (UITextField* (^)(UIColor *tintColor))rg_tincolor
{
    return ^UITextField *(UIColor *tintColor){
        
        self.tintColor = tintColor;
        
        return self;
        
    };
}

#pragma mark - 边框样式

- (UITextField* (^)(UITextBorderStyle borderStyle))rg_borderStyle
{
    return ^UITextField *(UITextBorderStyle borderStyle){
        
//        UITextBorderStyleNone,
//        UITextBorderStyleLine,
//        UITextBorderStyleBezel,
//        UITextBorderStyleRoundedRect
        
        self.borderStyle = borderStyle;
        return self;
        
    };
}

#pragma mark - done按钮的样式
- (UITextField* (^)(UIReturnKeyType returnKeyType))rg_returnKeyType
{
    return ^UITextField *(UIReturnKeyType returnKeyType){
        
//        UIReturnKeyDefault,
//        UIReturnKeyGo,
//        UIReturnKeyGoogle,
//        UIReturnKeyJoin,
//        UIReturnKeyNext,
//        UIReturnKeyRoute,
//        UIReturnKeySearch,
//        UIReturnKeySend,
//        UIReturnKeyYahoo,
//        UIReturnKeyDone,
//        UIReturnKeyEmergencyCall,
//        UIReturnKeyContinue
        
        self.returnKeyType = returnKeyType;
        return self;
        
    };
}


@end
