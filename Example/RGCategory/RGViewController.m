//
//  RGViewController.m
//  RGCategory
//
//  Created by 18607304107@163.com on 08/13/2019.
//  Copyright (c) 2019 18607304107@163.com. All rights reserved.
//

#import "RGViewController.h"
#import <RGCategory/MasCategary.h>
#import <RGCategory/UIView+Other.h>
#import <RGCategory/UIButton+BaseExtension.h>
#import <RGCategory/UIDevice+BaseExtension.h>
#import <RGCategory/NSString+AttributedString.h>
#import <RGCategory/CALayer+BaseExtension.h>
#import <RGCategory/NSDate+BaseExtension.h>
@interface RGViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *tttview;
@property (weak, nonatomic) IBOutlet UILabel *testLbl;

@property(nonatomic,strong) UIImageView *imgView;

@end

@implementation RGViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
//    NSDate *date = [NSDate dateWithString:@"2019-01-19" dateFormat:@"yyyy-MM-dd"];
//    NSLog(@"date = %@",date);
    
    
//    UIButton *testBtn = [UIButton ButtonWithNormalTitle:@"测试" NormalTitleColor:[UIColor redColor] FontSize:14 backgroundColor:[UIColor grayColor] supView:self.view buttonMas:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(100);
//        make.top.mas_equalTo(100);
//        make.width.height.mas_equalTo(50);
//    }];
//
    
    
    UILabel *testLbl = [UILabel LableWithText:@"" textColor:[UIColor blueColor] FontSize:15 supView:self.view lableMas:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(200);
        make.top.mas_equalTo(100);
    }];
    testLbl.attributedText = [@"测试" deleteAttributedString];
    
    return;
    
	
    self.testLbl.textColor = [UIColor blackColor];
    NSString *t = @"测试";
//    self.testLbl.attributedText  = [t underlineString];
    self.testLbl.attributedText  = [t underlineStringWithattributed:@{NSFontAttributeName : [UIFont systemFontOfSize:25],NSForegroundColorAttributeName : [UIColor blueColor]}];
    
    [self.btn addEventHandler:^(id sender) {
        NSLog(@"-----");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.tttview whenTapped:^{

         NSLog(@"---tttviewtttview--");
    }];
    //IOS-B2C-0A9B2E3C-755F-4BBD-A77D-49A119520288
 NSString *str = [[UIDevice currentDevice] uniqueDeviceIdentifier];
    NSLog(@"str = %@",str);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
