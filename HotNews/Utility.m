//
//  Utility.m
//  HotNews
//
//  Created by Jason on 15/4/27.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(NSMutableArray*) GetCustomizedChannel{
    return [Utility GetCacheByName:@"SelectedChannels"];
}

+(BOOL*) IsAlreadyExist:(NSString *)title
{
    for (ChannelItem* item in [Utility GetCustomizedChannel]) {
        if ([title caseInsensitiveCompare:item.title] == NSOrderedSame) {
            return YES;
        }
    }
    
    return NO;
}

//To verify whether the news list is out of date
+ (bool*) IsNewsListOutdate: (NSString*) channelName
{
    BOOL* isOutdate = true;
    NSMutableArray* channelList = [Utility GetChannelsListCache];
    for (ChannelItem *item in channelList) {
        if (item.title == channelName) {
            return [item.lastUpdateDate timeIntervalSinceNow] > 60*30;
        }
    }
    
    return isOutdate;
}

//Get cached array based on cacheName
+ (NSMutableArray*) GetCacheByName: (NSString*) cacheName
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:cacheName];
    NSMutableArray* list = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];
    
    return list;
}

//Get the latest updating date according to channel name
+ (NSDate*) GetLastUpdateDateFromChannelName: (NSString*) channelName
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSDate *latestDate = [dateFormater dateFromString:@"1970-01-01 00:00:00"];
    
    NSMutableArray* channelsList = [Utility GetChannelsListCache];
    for (ChannelItem* item in channelsList) {
        if (item.title == channelName) {
            if (item.lastUpdateDate != nil) {
                latestDate = item.lastUpdateDate;
            }
            
            return latestDate;
        }
    }
    
    return latestDate;
}

//Get current date
+ (NSDate*) GetCurrentDate
{
    NSDate *date = [NSDate date];
    NSInteger interval = [[NSTimeZone systemTimeZone] secondsFromGMTForDate: date];
    
    return [date  dateByAddingTimeInterval: interval];
}

+ (NSMutableArray*) GetChannelsListCache
{
    return [Utility GetCacheByName:@"ChannelsList"];
}

//Restore back current news list into cache
+ (void) SetChannelNewsCache: (NSString*) channelName
                        list:(NSMutableArray*) list
{
    return;
}

//Restore back current channel list into cache
+ (void) UpdateChannelsListCache: (NSString*)channelName;
{
    return;
}
@end
