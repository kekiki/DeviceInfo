//
//  DeviceInfoViewController.h
//  DeviceInfo
//
//  Created by cxl on 12-8-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DeviceInfoViewController : UIViewController {
    
}

@property (nonatomic, retain) UILabel *platform;            //平台型号
@property (nonatomic, retain) UILabel *cpuType;             //cpu型号
@property (nonatomic, retain) UILabel *cpuFrequency;        //cpu频率
@property (nonatomic, retain) UILabel *cpuCount;            //cpu核数
@property (nonatomic, retain) UILabel *cpuUsage;            //cpu使用率
@property (nonatomic, retain) UILabel *totalMemory;         //总内存
@property (nonatomic, retain) UILabel *freeMemory;          //可用内存
@property (nonatomic, retain) UILabel *totalDiskSpace;      //硬盘总空间
@property (nonatomic, retain) UILabel *freeDiskSpace;       //可用硬盘空间
@property (nonatomic, retain) UILabel *batteryLevel;        //电池电量
@property (nonatomic, retain) UILabel *bluetoothCheck;      //是否支持蓝牙
@property (nonatomic, retain) UILabel *isJailBreak;         //是否越狱

@end
