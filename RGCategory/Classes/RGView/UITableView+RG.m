//
//  UITableView+RG.m
//  RG_Viwe
//
//  Created by koogfook on 17/5/13.
//  Copyright © 2017年 zhubaoshang. All rights reserved.
//

#import "UITableView+RG.h"

@implementation UITableView (RG)


#pragma mark - 分割线样式
-(UITableView* (^)(UITableViewCellSeparatorStyle separatorStyle))rg_separatorStyle{
    
    return ^UITableView *(UITableViewCellSeparatorStyle separatorStyle){
        
        self.separatorStyle= separatorStyle;
        
        return self;
        
    };
}

#pragma mark - 注册cell
-(UITableView* (^)(Class registerClass,NSString *Identifier))rg_registerClassAndIdentifier{

        return ^UITableView *(Class registerClass,NSString *Identifier){
        
            [self registerClass:registerClass forCellReuseIdentifier:Identifier];
        
        return self;
        
    };
}


#pragma mark - 注册组View
-(UITableView* (^)(Class registerClass,NSString *Identifier))rg_registerHeaderFooterClassAndIdentifier{
    
    return ^UITableView *(Class registerClass,NSString *Identifier){
        
        [self registerClass:registerClass forHeaderFooterViewReuseIdentifier:Identifier];
        
        return self;
        
    };
}




#pragma mark - delegate和dataSource
-(UITableView* (^)(id dataSource ,id delegate))rg_dataSourceAndDelegate{
    
    return ^UITableView *(id dataSource ,id delegate){
        
        self.delegate = delegate;
        self.dataSource = dataSource;
        
        return self;
        
    };
}


-(UITableView* (^)(id dataSource))rg_dataSource{
    
    return ^UITableView *(id dataSource){
    
        self.dataSource = dataSource;
        
        return self;
        
    };
}


-(UITableView* (^)(id delegate))rg_delegate{
    
    return ^UITableView *(id delegate){
        
        self.delegate = delegate;
        return self;
        
    };
}


#pragma mark - 行高
-(UITableView* (^)(CGFloat rowHeight))rg_rowHeight{
    
    return ^UITableView *(CGFloat rowHeight){
        
        self.rowHeight = rowHeight;
        
        return self;
        
    };
}


#pragma mark - 头部View
-(UITableView* (^)(UIView *tableHeaderView))rg_tableHeaderView{
    
    return ^UITableView *(UIView *tableHeaderView){
        self.tableHeaderView = tableHeaderView;
        return self;
        
    };
}


#pragma mark - 尾部View
-(UITableView* (^)(UIView *tableFooterView))rg_tableFooterView{
    
    return ^UITableView *(UIView *tableFooterView){
        
        self.tableFooterView = tableFooterView;
        
        return self;
        
    };
}




@end
