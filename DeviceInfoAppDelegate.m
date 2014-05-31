//
//  DeviceInfoAppDelegate.m
//  DeviceInfo
//
//  Created by cxl on 12-8-9.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "DeviceInfoAppDelegate.h"

@implementation DeviceInfoAppDelegate

@synthesize window=_window;
@synthesize deviceInfoViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    UIDevice *device = [UIDevice currentDevice];
//    //平台型号
//    NSLog(@"平台型号:%@", [device platformString]);
//    //cpu型号
//    NSLog(@"cpu型号:%@", [device cpuType]);
//    //cpu频率
//    NSLog(@"cpu频率:%@", [device cpuFrequency]);
//    //cpu核数
//    NSLog(@"%@", [NSString stringWithFormat:@"cpu核数:%u", [device cpuCount]]);
//    //cpu使用率
//    NSLog(@"%@", [NSString stringWithFormat:@"cpu使用率:%.1f%", [device cpuUsage]]);
//    //手机总内存
//    NSLog(@"%@", [NSString stringWithFormat:@"手机总内存:%u", [device totalMemoryBytes] / (1024)]);
//    //可用内存
    
    DeviceInfoViewController *viewController = [[DeviceInfoViewController alloc] init];
    self.deviceInfoViewController = viewController;
    [viewController release];
    self.window.rootViewController = self.deviceInfoViewController;
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [self.deviceInfoViewController release];
    [_window release];
    [super dealloc];
}

@end
