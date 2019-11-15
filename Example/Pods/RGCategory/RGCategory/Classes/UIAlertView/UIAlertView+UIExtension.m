//
//  UIAlertView+UIExtension.m
//  00-抽取分类
//
//  Created by rengui on 16/8/26.
//  Copyright © 2016年 rg. All rights reserved.
//

#import "UIAlertView+UIExtension.h"
#import <objc/runtime.h>

static const void *AlertHandlersKey = &AlertHandlersKey;

@interface AlertWrapper : NSObject <UIAlertViewDelegate>

@property(nonatomic,copy) AlertViewClicked cancelButtonClick;
@property(nonatomic,copy) AlertViewClicked otherButtonClick;

@end

@implementation AlertWrapper

- (instancetype)initWithcancelButtonClick:(AlertViewClicked)cancelButtonClick otherButtonClick:(AlertViewClicked)otherButtonClick {
    if (self = [super init]) {
        
        _cancelButtonClick = cancelButtonClick;
        _otherButtonClick = otherButtonClick;
    }
    return self;
}
//MARK: - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0)
{
    if(buttonIndex == 0){
        self.cancelButtonClick();
    }else{
        self.otherButtonClick();
    }
}




@end



@implementation UIAlertView (UIExtension)



+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
          cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitle:(NSString *)otherButtonTitle
          cancelButtonClick:(AlertViewClicked)cancelButtonClick
           otherButtonClick:(AlertViewClicked)otherButtonClick
{
//    return [[[self class] alloc] av_initWithTitle:title message:message];
    
  UIAlertView *alertView =  [[[self class] alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle,nil];
    
    AlertWrapper *delegate = [[AlertWrapper alloc] initWithcancelButtonClick:cancelButtonClick otherButtonClick:otherButtonClick];
    objc_setAssociatedObject(alertView, AlertHandlersKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    alertView.delegate = delegate;
    
    [alertView show];
    return alertView;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitle:(NSString *)otherButtonTitle
{
    
    self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle,nil];
    if (!self)  return nil;
    
    return self;
    
}






@end
