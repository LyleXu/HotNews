//
//  Utility.h
//  HotNews
//
//  Created by Jason on 15/4/27.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelItem.h"

@interface Utility : UIViewController

+ (BOOL*) IsAlreadyExist: (NSString*)title;
+ (bool*) IsNewsListOutdate: (NSString*) channelName;

+ (NSDate*) GetCurrentDate;
+ (NSDate*) GetLastUpdateDateFromChannelName: (NSString*) channelName;
+ (NSMutableArray*) GetChannelsListCache;
+ (NSMutableArray*) GetCacheByName: (NSString*) cacheName;
+ (NSMutableArray*) GetCustomizedChannel;

+ (void) UpdateChannelsListCache: (NSMutableArray*)list;
+ (void) SetChannelNewsCache: (NSString*) channelName
                        list:(NSMutableArray*) list;
@end
