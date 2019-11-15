//
//  UIAlertView+UIExtension.h
//  00-抽取分类
//
//  Created by rengui on 16/8/26.
//  Copyright © 2016年 rg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertViewClicked)(void);

@interface UIAlertView (UIExtension)

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
       cancelButtonTitle:(NSString *)cancelButtonTitle
        otherButtonTitle:(NSString *)otherButtonTitle
       cancelButtonClick:(AlertViewClicked)cancelButtonClick
        otherButtonClick:(AlertViewClicked)otherButtonClick;
@end
