//
//  DeviceInfoViewController.m
//  DeviceInfo
//
//  Created by cxl on 12-8-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "DeviceInfoViewController.h"
#import "UIDevice-Hardware.h"

@implementation DeviceInfoViewController
@synthesize platform, cpuType, cpuFrequency, cpuCount, cpuUsage, totalMemory, freeMemory, totalDiskSpace, freeDiskSpace, batteryLevel, bluetoothCheck, isJailBreak;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [self.platform release];
    [self.cpuType release];
    [self.cpuFrequency release];
    [self.cpuCount release];
    [self.cpuUsage release];
    [self.totalMemory release];
    [self.freeMemory release];
    [self.totalDiskSpace release];
    [self.freeDiskSpace release];
    [self.batteryLevel release];
    [self.bluetoothCheck release];
    [self.isJailBreak release];
    [super dealloc];
}

- (void)refresh
{
    UIDevice *device = [UIDevice currentDevice];
    NSArray *usage = [device cpuUsage];
    NSMutableString *usageStr = [NSMutableString stringWithFormat:@""];
//    for (NSNumber *u in usage) {
        NSNumber *u = [usage objectAtIndex:0];
        [usageStr appendString:[NSString stringWithFormat:@"%.1f%%", [u floatValue]]];
//    }
    self.cpuUsage.text = usageStr;
    float mm = (float)[device freeMemoryBytes] / (float)[device totalMemoryBytes];
    self.freeMemory.text = [NSString stringWithFormat:@"%.1f%%", mm*100];
    self.freeDiskSpace.text = [NSString stringWithFormat:@"%uM", [device freeDiskSpaceBytes] / (1024*1024)];
    self.batteryLevel.text = [NSString stringWithFormat:@"%f%%", [device batteryLevel] * 100];
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    UIDevice *device = [UIDevice currentDevice];
    
    //平台型号
    UILabel *label;
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 150, 20)];
    label.text = @"平台型号:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 35, 120, 20)];
    label.text = [device platformString];
    [self.view addSubview:label];
    self.platform = label;
    [label release];
    
    //cpu型号
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 150, 20)];
    label.text = @"cpu型号:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 60, 120, 20)];
    label.text = [device cpuType];
    [self.view addSubview:label];
    self.cpuType = label;
    [label release];
    
    //cpu频率
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 85, 150, 20)];
    label.text = @"cpu频率:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 85, 120, 20)];
    label.text = [device cpuFrequency];
    [self.view addSubview:label];
    self.cpuFrequency = label;
    [label release];
    
    //cpu核数
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 110, 150, 20)];
    label.text = @"cpu核数:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 110, 120, 20)];
    label.text = [NSString stringWithFormat:@"%u", [device cpuCount]];
    [self.view addSubview:label];
    self.cpuCount = label;
    [label release];
    
    //cpu使用率
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 135, 150, 20)];
    label.text = @"cpu使用率:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 135, 120, 20)];
    NSArray *usage = [device cpuUsage];
    NSMutableString *usageStr = [NSMutableString stringWithFormat:@""];
//    for (NSNumber *u in usage) {
//        [usageStr appendString:[NSString stringWithFormat:@"%f%% ", [u floatValue]]];
//    }
    NSNumber *u = [usage objectAtIndex:0];
    [usageStr appendString:[NSString stringWithFormat:@"%.1f%%", [u floatValue]]];
    
    label.text = usageStr;
    [self.view addSubview:label];
    self.cpuUsage = label;
    [label release];
    
    //总内存
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 150, 20)];
    label.text = @"总内存:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 160, 120, 20)];
    label.text = [NSString stringWithFormat:@"%uM", [device totalMemoryBytes] / (1024*1024)];
    [self.view addSubview:label];
    self.totalMemory = label;
    [label release];
    
    //可用内存
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 185, 150, 20)];
    label.text = @"可用内存:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 185, 120, 20)];
    float mm = (float)[device freeMemoryBytes] / (float)[device totalMemoryBytes];
    label.text = [NSString stringWithFormat:@"%.1f%%", mm*100];
    [self.view addSubview:label];
    self.freeMemory = label;
    [label release];
    
    //硬盘总空间
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 210, 150, 20)];
    label.text = @"硬盘总空间:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 210, 120, 20)];
    label.text = [NSString stringWithFormat:@"%lluM", [device totalDiskSpaceBytes] / (1024*1024)];
    [self.view addSubview:label];
    self.totalDiskSpace = label;
    [label release];
    
    //可用硬盘空间
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 235, 150, 20)];
    label.text = @"可用硬盘空间:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 235, 120, 20)];
    label.text = [NSString stringWithFormat:@"%lluM", [device freeDiskSpaceBytes] / (1024*1024)];
    [self.view addSubview:label];
    self.freeDiskSpace = label;
    [label release];
    
    //电池电量
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 150, 20)];
    label.text = @"电池电量:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 260, 120, 20)];
    device.batteryMonitoringEnabled = YES;
    label.text = [NSString stringWithFormat:@"%f%%", [device batteryLevel] * 100];
    [self.view addSubview:label];
    self.batteryLevel = label;
    [label release];
    
    //是否支持蓝牙
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 285, 150, 20)];
    label.text = @"是否支持蓝牙:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 285, 120, 20)];
    label.text = [NSString stringWithFormat:@"%@", [device bluetoothCheck] ? @"YES" : @"NO"];
    [self.view addSubview:label];
    self.bluetoothCheck = label;
    [label release];
    
    //是否越狱
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 310, 150, 20)];
    label.text = @"是否越狱:";
    [self.view addSubview:label];
    [label release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(170, 310, 120, 20)];
    label.text = [NSString stringWithFormat:@"%@", [device isJailBreak] ? @"YES" : @"NO"];
    [self.view addSubview:label];
    self.isJailBreak = label;
    [label release];
    

    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
