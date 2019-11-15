//
//  UILabel+BaseExtension.m
//  Base-BaseCategery
//
//  Created by 浮生似梦、Dream on 2018/11/26.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "UILabel+BaseExtension.h"

static NSInteger const DefaultFontSize = 17;

@implementation UILabel (BaseExtension)

+(instancetype)Lable{
    
    UILabel *lable = [[self alloc]init];
    lable.backgroundColor = [UIColor clearColor];
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:DefaultFontSize];
    lable.clipsToBounds = YES;
    return lable;
}


+(instancetype)LableWithText:(NSString *)text  textColor:(UIColor *)textColor  FontSize:(NSInteger)fontSzie
{
    
    UILabel *lable = [[self alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.font = [UIFont systemFontOfSize:fontSzie];
    lable.backgroundColor = [UIColor clearColor];
    
    return lable;
}

@end
