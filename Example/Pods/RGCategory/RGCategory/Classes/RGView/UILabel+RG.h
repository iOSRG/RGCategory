//
//  UILabel+RG.h
//  链式变成思想
//
//  Created by koogfook on 17/5/12.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (RG)

-(UILabel* (^)(NSString * text))rg_text;

-(UILabel* (^)(NSTextAlignment textAlignment))rg_textAlignment;

-(UILabel* (^)(UIColor *textColor))rg_textColor;

-(UILabel* (^)(CGFloat fontSize))rg_fontSize;
/**设置行数*/
-(UILabel* (^)(NSInteger numberOfLines))rg_numberOfLines;

@end
