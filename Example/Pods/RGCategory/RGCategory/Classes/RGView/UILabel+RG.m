//
//  UILabel+RG.m
//  链式变成思想
//
//  Created by koogfook on 17/5/12.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import "UILabel+RG.h"

@implementation UILabel (RG)


-(UILabel* (^)(NSString * text))rg_text
{
    return ^(NSString * text){
    
        self.text = text;
        return self;
    
    };
}


-(UILabel* (^)(NSInteger numberOfLines))rg_numberOfLines
{
    
    return ^(NSInteger numberOfLines){
        
        self.numberOfLines = numberOfLines;
        return self;
        
    };
}



-(UILabel* (^)(NSTextAlignment textAlignment))rg_textAlignment
{
    
    return ^(NSTextAlignment textAlignment){
        
        self.textAlignment = textAlignment;
        return self;
        
    };
}


-(UILabel* (^)(UIColor *textColor))rg_textColor{
    
    return ^(UIColor *textColor){
        
        self.textColor = textColor;
        return self;
        
    };
}


-(UILabel* (^)(CGFloat fontSize))rg_fontSize
{
    
    return ^(CGFloat fontSize){
        
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
        
    };
}


@end
