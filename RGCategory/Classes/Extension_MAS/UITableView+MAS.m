//
//  UITableView+MAS.m
//  MyCategary
//
//  Created by HaoShiZai on 2018/3/9.
//  Copyright © 2018年 kajiter. All rights reserved.
//

#import "UITableView+MAS.h"

@implementation UITableView (MAS)

+ (UITableView *)TableViewWithdelegateAndDataSource:(id<UITableViewDelegate,UITableViewDataSource>)delegateAndDataSource
                           backgroundColor:(UIColor *)backgroundColor
                                   supView:(UIView *)supView
                         TableViewMas:(void(^)(MASConstraintMaker *make))tabMas
{
    
    UITableView *tabeleView = ({
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [supView addSubview:tableView];
        tableView.delegate = delegateAndDataSource;
        tableView.dataSource = delegateAndDataSource;
        //自己设置默认的属性
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView;
        
    });
    
    return tabeleView;
    
}



//self.automaticallyAdjustsScrollViewInsets = NO;
//self.tableView = ({
//
//    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
//    [self.view addSubview:tableView];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.showsVerticalScrollIndicator = NO;
//    tableView.showsHorizontalScrollIndicator = NO;
//    tableView;
//
//});
//
//[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

@end
