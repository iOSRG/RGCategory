//
//  UIView+RG.m
//  链式变成思想
//
//  Created by koogfook on 17/5/12.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import "UIView+RG.h"

@implementation UIView (RG)


-(UIView* (^)(UIColor *backgroundColor))rg_backgroundColor
{

    return ^(UIColor *backgroundColor){
        
        self.backgroundColor = backgroundColor;
        return self;
        
    };
}

-(UIView* (^)(CGFloat alpha))rg_alpha
{
    
    return ^(CGFloat  alpha){
        
        self.alpha = alpha;
        return self;
        
    };
}




#pragma mark - 设置父view

-(UIView * (^)(UIView* supView))rg_supView
{
    
    return ^(UIView* supView){
        
        [supView addSubview:self];
        return self;
        
    };
}


#pragma mark - 设置圆角
-(UIView* (^)(CGFloat cornerRadius))rg_CornerRadius
{
    
    
    return ^(CGFloat cornerRadius){
        
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
        
        return self;
        
    };
}


#pragma mark - 设置边框
-(UIView* (^)( CGFloat borderWidth ,UIColor *borderColor ))rg_borderWidthAndBorderColor
{
    
    
    
    return ^(CGFloat borderWidth ,UIColor *borderColor){
        
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = borderWidth;
        return self;
        
    };
}

#pragma mark - 设置模式
- (UIView * (^)(UIViewContentMode  contentMode))rg_contentMode
{
    
    return ^(UIViewContentMode contentMode){
        
        self.contentMode = contentMode;
        return self;
    };
}


#pragma mark - hidden设置
-(UIView* (^)(BOOL hidden))rg_hidden
{
    return ^(BOOL  hidden){
        self.hidden = hidden;
        return self;
    };
}

#pragma mark - 设置tag
-(UIView* (^)(NSInteger tag))rg_tag
{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

#pragma mark - 设置userInteractionEnabled
-(UIView* (^)(BOOL userInteractionEnabled))rg_userInteractionEnabled
{
    return ^(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}




@end
