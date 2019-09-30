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

@interface RGViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *tttview;

@end

@implementation RGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    
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
