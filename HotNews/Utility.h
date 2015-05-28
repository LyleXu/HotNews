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

+ (NSMutableArray*) builtInChannel;
+ (NSMutableArray*) memoryChannel;
+ (BOOL *) IsAlreadyExist: (NSString*)title;
+ (NSMutableArray*) GetChannelsListCache;
+ (void) UpdateChannelsListCache: (NSMutableArray*)list;
//+ (NSMutableArray*) GetChannelNewsCache: (NSString*) channelName;
+ (void) SetChannelNewsCache: (NSString*) channelName
                              list:(NSMutableArray*) list;
+ (NSDate*) GetLastUpdateDateFromChannelName: (NSString*) channelName;
+ (NSDate*) GetCurrentDate;
+ (bool*) IsNewsListOutdate: (NSString*) channelName;
+ (NSMutableArray*) GetCacheByName: (NSString*) cacheName;
@end
