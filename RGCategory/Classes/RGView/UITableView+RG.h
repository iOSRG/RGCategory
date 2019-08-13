//
//  UITableView+RG.h
//  RG_Viwe
//
//  Created by koogfook on 17/5/13.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (RG)

/**分割线样式*/
-(UITableView* (^)(UITableViewCellSeparatorStyle separatorStyle))rg_separatorStyle;

/**注册cell和设置Identifier*/
-(UITableView* (^)(Class registerClass,NSString *Identifier))rg_registerClassAndIdentifier;


-(UITableView* (^)(Class registerClass,NSString *Identifier))rg_registerHeaderFooterClassAndIdentifier;

/**delegate和dataSource*/
-(UITableView* (^)(id dataSource ,id delegate))rg_dataSourceAndDelegate;
-(UITableView* (^)(id dataSource))rg_dataSource;
-(UITableView* (^)(id delegate))rg_delegate;

/**行高*/
-(UITableView* (^)(CGFloat rowHeight))rg_rowHeight;

/**头部View*/
-(UITableView* (^)(UIView *tableHeaderView))rg_tableHeaderView;

/**尾部View*/
-(UITableView* (^)(UIView *tableFooterView))rg_tableFooterView;

@end
