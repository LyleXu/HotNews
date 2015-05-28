//
//  Utility.m
//  HotNews
//
//  Created by Jason on 15/4/27.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(NSMutableArray*)builtInChannel
{
    NSMutableArray *_builtInChannel = [NSMutableArray new];
//    _builtInChannel =[NSMutableArray array];
    
    ChannelItem* channel1 = [ChannelItem new];
    channel1.title = @"cnBeta";
    channel1.link = @"http://www.cnbeta.com/articles/345753.htm";
    
    ChannelItem* channel2 = [ChannelItem new];
    channel2.title = @"威锋网";
    channel2.link = @"http://www.cnbeta.com/articles/345753.htm";
    
    ChannelItem* channel3 = [ChannelItem new];
    channel3.title = @"博客园";
    channel3.link = @"http://www.cnbeta.com/articles/345753.htm";
    
    [_builtInChannel addObject:channel1];
    [_builtInChannel addObject:channel2];
    [_builtInChannel addObject:channel3];
    
    return _builtInChannel;
}

//+(NSMutableArray*)serverChannel
//{
//    NSMutableArray *_serverChannel = [NSMutableArray new];
//    
//    ChannelItem* channel1 = [ChannelItem new];
//    channel1.title = @"cnBeta";
//    channel1.link = @"http://www.cnbeta.com/articles/345753.htm";
//    
//    ChannelItem* channel2 = [ChannelItem new];
//    channel2.title = @"威锋网";
//    channel2.link = @"http://www.cnbeta.com/articles/345753.htm";
//    
//    ChannelItem* channel3 = [ChannelItem new];
//    channel3.title = @"博客园";
//    channel3.link = @"http://www.cnbeta.com/articles/345753.htm";
//    
//    [_serverChannel addObject:channel1];
//    [_serverChannel addObject:channel2];
//    [_serverChannel addObject:channel3];
//    
//    return _serverChannel;
//}

+(NSMutableArray*) memoryChannel{
    return [Utility GetCacheByName:@"SelectedChannels"];
}

+(BOOL*) IsAlreadyExist:(NSString *)title
{
//    for (ChannelItem* item in [Utility builtInChannel]) {
//        if ([title caseInsensitiveCompare:item.title] == NSOrderedSame) {
//            return YES;
//        }
//    }
    
    for (ChannelItem* item in [Utility memoryChannel]) {
        //if ([title compare:item.title options:NSCaseInsensitiveSearch]) {
        if ([title caseInsensitiveCompare:item.title] == NSOrderedSame) {
            return YES;
        }
    }
    
    return NO;
}

//Restore back current channel list into cache
+ (void) UpdateChannelsListCache: (NSString*)channelName;
{
    return;
}

//Get cached array based on cacheName
+ (NSMutableArray*) GetCacheByName: (NSString*) cacheName
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:cacheName];
    NSMutableArray* list = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];
    
    return list;
}

//Restore back current news list into cache
+ (void) SetChannelNewsCache: (NSString*) channelName
                        list:(NSMutableArray*) list
{
    return;
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

+ (NSMutableArray*) GetChannelsListCache
{
    return [Utility GetCacheByName:@"ChannelsList"];
}
@end
