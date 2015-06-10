//
//  Utility.m
//  HotNews
//
//  Created by Jason on 15/4/27.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(BOOL*) IsAlreadyExist:(NSString *)title{
    for (ChannelItem* item in [Utility GetCustomizedChannel]) {
        if ([title caseInsensitiveCompare:item.title] == NSOrderedSame) {
            return YES;
        }
    }
    
    return NO;
}

//To verify whether the news list is out of date
+ (bool*) IsNewsListOutdate: (NSString*) channelName{
    BOOL* isOutdate = true;
    NSMutableArray* channelList = [Utility GetCustomizedChannel];
    for (ChannelItem *item in channelList) {
        if ([item.title isEqualToString: channelName]) {
            return [item.lastUpdateDate timeIntervalSinceNow] > 60*30;
        }
    }
    
    return isOutdate;
}

+(NSMutableArray*) GetCustomizedChannel{
    NSData* result = [[NSUserDefaults standardUserDefaults] objectForKey:ChannelsListCacheKey];
    NSArray* list = [NSKeyedUnarchiver unarchiveObjectWithData:result];
    return list == nil ? [NSMutableArray new] : [list mutableCopy];
}

+ (NSMutableArray*) GetCachedNewsListByChanelName: (NSString*) channelName{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSArray* myList = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:channelName]];
    return myList == nil? [NSMutableArray new]:[myList mutableCopy];
}

+ (NSDate*) GetLastUpdateDateFromChannelName: (NSString*) channelName{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSDate *latestDate = [dateFormater dateFromString:@"1970-01-01 00:00:00"];
    
    NSMutableArray* channelsList = [Utility GetCustomizedChannel];
    for (ChannelItem* item in channelsList) {
        if ([item.title isEqualToString: channelName]) {
            if (item.lastUpdateDate != nil) {
                latestDate = item.lastUpdateDate;
            }
            
            return latestDate;
        }
    }
    
    return latestDate;
}

+ (NSDate*) GetCurrentDate{
    NSDate *date = [NSDate date];
//    NSInteger interval = [[NSTimeZone systemTimeZone] secondsFromGMTForDate: date];
    
    //return [date dateByAddingTimeInterval: interval];
    return date;
}

+ (NSString*) GetStringFromDate: (NSDate*) date{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

//Restore back current array into cache
+ (void) UpdateLatestTimeByName: (NSString*)name;{
    bool* isFound = false;
    NSMutableArray* channelsList = [Utility GetCustomizedChannel];
    
    for (ChannelItem* item in channelsList) {
        if ([item.title isEqualToString:name]) {
            item.lastUpdateDate = [Utility GetCurrentDate];
            isFound = true;
            break;
        }
    }
    
    if (!isFound) {
        ChannelItem* newItem = [ChannelItem new];
        newItem.title = name;
        newItem.lastUpdateDate = [Utility GetCurrentDate];
        
        [channelsList addObject:newItem];
    }
    
    [Utility SetCachedChannelList:channelsList];
}

//Restore back current news list into cache
+ (void) SetCachedNewsList: (NSString*) channelName
                   list:(NSMutableArray*) list{
    [Utility RemoveCacheFromName:channelName];
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSData* myData = [NSKeyedArchiver archivedDataWithRootObject: [list copy]];
    [defaults setObject: myData forKey:channelName];
    [defaults synchronize];
}

+ (void) SetCachedChannelList:(NSMutableArray*) list{
    [Utility RemoveCacheFromName:ChannelsListCacheKey];
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject: [NSKeyedArchiver archivedDataWithRootObject:[list copy]] forKey:ChannelsListCacheKey];
    [defaults synchronize];
}

+ (void) ClearAllCache{
    NSString* appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

+ (void) RemoveCacheFromName: (NSString*) cacheName{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:cacheName];
        [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
