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
        if (item.title == channelName) {
            return [item.lastUpdateDate timeIntervalSinceNow] > 60*30;
        }
    }
    
    return isOutdate;
}

+(NSMutableArray*) GetCustomizedChannel{
    NSMutableArray* list = [NSMutableArray new];
    NSArray* resultArray = [[NSUserDefaults standardUserDefaults] objectForKey:ChannelsListCacheKey];
    for (NSData* data in resultArray) {
        ChannelItem* channelInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [list addObject:channelInfo];
    }
    
    return list;
}

//Get cached array based on cacheName
+ (NSMutableArray*) GetCachedNewsListByChanelName: (NSString*) channelName{
//    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSMutableArray* list = [NSMutableArray new];
    NSArray* resultArray = [[NSUserDefaults standardUserDefaults] objectForKey:channelName];
    for (NSData* data in resultArray) {
        CNewsInfo* newsInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [list addObject:newsInfo];
    }
    
    return list;
}

//
//+ (NSMutableArray*) GetCacheByName2: (NSString*) cacheName{
//}


//Get the latest updating date according to channel name
+ (NSDate*) GetLastUpdateDateFromChannelName: (NSString*) channelName{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSDate *latestDate = [dateFormater dateFromString:@"1970-01-01 00:00:00"];
    
    NSMutableArray* channelsList = [Utility GetCustomizedChannel];
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
+ (NSDate*) GetCurrentDate{
    NSDate *date = [NSDate date];
    NSInteger interval = [[NSTimeZone systemTimeZone] secondsFromGMTForDate: date];
    
    return [date  dateByAddingTimeInterval: interval];
}

//Restore back current array into cache
+ (void) UpdateLatestTimeByName: (NSString*)name;{
    bool* isFound = false;
    NSMutableArray* channelsList = [Utility GetCustomizedChannel];
    
    for (ChannelItem* item in channelsList) {
        if (item.title == name) {
            item.lastUpdateDate = [Utility GetCurrentDate];
            isFound = true;
            break;
        }
        
        if (!isFound) {
            ChannelItem* newItem = [ChannelItem new];
            newItem.title = name;
            newItem.lastUpdateDate = [Utility GetCurrentDate];
            [channelsList addObject:newItem];
        }
        
        [Utility SetCachedChannelList:channelsList];
    }
    return;
}

//Restore back current news list into cache
+ (void) SetCachedNewsList: (NSString*) channelName
                   list:(NSMutableArray*) list{
    NSMutableArray* myEncodedArray= [NSMutableArray new];
    for (CNewsInfo* item in list) {
        NSData* data = [NSKeyedArchiver archivedDataWithRootObject: item];
        [myEncodedArray addObject:data];
    }
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:[myEncodedArray copy] forKey:channelName];
    [defaults synchronize];
    
    return;
}

+ (void) SetCachedChannelList:(NSMutableArray*) list{
    NSMutableArray* myEncodedArray= [NSMutableArray new];
    for (ChannelItem* item in list) {
        NSData* data = [NSKeyedArchiver archivedDataWithRootObject: item];
        [myEncodedArray addObject:data];
    }
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:[myEncodedArray copy] forKey:ChannelsListCacheKey];
    [defaults synchronize];
    
    return;
}
@end
