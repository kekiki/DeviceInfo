//
//  DeviceInfoAppDelegate.h
//  DeviceInfo
//
//  Created by cxl on 12-8-9.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceInfoViewController.h"

@interface DeviceInfoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) DeviceInfoViewController *deviceInfoViewController;

@end
