//
//  UIDevice+BaseExtension.m
//  RGCategory_Example
//
//  Created by 浮生似梦、Dream on 2019/8/21.
//  Copyright © 2019年 18607304107@163.com. All rights reserved.
//

#import "UIDevice+BaseExtension.h"
#import <SSKeychain/SSKeychain.h>

static NSString *memoryUUID = nil;

@implementation UIDevice (BaseExtension)


#pragma mark - Public Methods

//注 ： UUID 每次删除APP重新下载会重置，因此可以保存到钥匙串， 保存到钥匙串内容即使删除APP的内容也不会受到影响， 需要结合SSKeychain使用
- (NSString *)uniqueDeviceIdentifier{
    @synchronized(self){
        if (memoryUUID == nil || [memoryUUID isEqualToString:@""]) {
            
            NSString *defaultUUID = [[NSUserDefaults standardUserDefaults] stringForKey:UUID_KEY];
            if (defaultUUID == nil || [defaultUUID isEqualToString:@""]) {
                
                return [self readOfKeychain];
                
            }
            memoryUUID = defaultUUID;
            return defaultUUID;
        }
        
        return memoryUUID;
    }
}



-(NSString *)readOfKeychain
{
    
    
    NSString *keyChainUUID = [SSKeychain passwordForService:SERVER_NAME account:UUID_KEY error:nil];
    NSLog(@"+++++++++++++++++++++deviceid:%@",keyChainUUID);
    if (keyChainUUID == nil || [keyChainUUID isEqualToString:@""]){
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        keyChainUUID = [NSString stringWithFormat:@"IOS-B2C-%@",(NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef))];
        [SSKeychain setPassword:keyChainUUID forService:SERVER_NAME account:UUID_KEY error:nil];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:keyChainUUID forKey:UUID_KEY];
    memoryUUID = keyChainUUID;
    
    return keyChainUUID;
}



@end
