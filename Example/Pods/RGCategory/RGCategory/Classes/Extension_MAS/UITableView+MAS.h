//
//  UITableView+MAS.h
//  MyCategary
//
//  Created by HaoShiZai on 2018/3/9.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface UITableView (MAS)

/**设置table的代理,数据源,背景色和一些默认的属性*/
+ (UITableView *)TableViewWithdelegateAndDataSource:(id<UITableViewDelegate,UITableViewDataSource>)delegateAndDataSource
                                    backgroundColor:(UIColor *)backgroundColor
                                            supView:(UIView *)supView
                                       TableViewMas:(void(^)(MASConstraintMaker *make))tabMas;

@end
