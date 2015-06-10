//
//  Utility.h
//  HotNews
//
//  Created by Jason on 15/4/27.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelItem.h"
#import "Constraint.h"
#import "CNewsInfo.h"

@interface Utility : UIViewController

+ (BOOL*) IsAlreadyExist: (NSString*)title;
+ (bool*) IsNewsListOutdate: (NSString*) channelName;

+ (NSDate*) GetCurrentDate;
+ (NSDate*) GetLastUpdateDateFromChannelName: (NSString*) channelName;
+ (NSMutableArray*) GetCachedNewsListByChanelName: (NSString*) channelName;
+ (NSMutableArray*) GetCustomizedChannel;
+ (NSString*) GetStringFromDate: (NSDate*) date;

+ (void) UpdateLatestTimeByName: (NSString*)name;
+ (void) SetCachedNewsList: (NSString*) channelName
                        list:(NSMutableArray*) list;
+ (void) SetCachedChannelList:(NSMutableArray*) list;

+ (void) ClearAllCache;
+ (void) RemoveCacheFromName: (NSString*) cacheName;
@end
