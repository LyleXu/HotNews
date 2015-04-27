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
    _builtInChannel =[NSMutableArray array];
    
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

+(NSMutableArray*) memoryChannel{
    NSMutableArray* _storedChannels = [NSMutableArray new];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectedChannels"];
    _storedChannels = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];
    
    return _storedChannels;
}

+(BOOL*) isAlreadyExist:(NSString *)title
{
    NSLog([NSString stringWithFormat:@"isAlreadyExist, title is: %@", title]);
    
    for (ChannelItem* item in [Utility builtInChannel]) {
        if ([title caseInsensitiveCompare:item.title] == NSOrderedSame) {
            return YES;
        }
    }
    
    for (ChannelItem* item in [Utility memoryChannel]) {
        //if ([title compare:item.title options:NSCaseInsensitiveSearch]) {
        if ([title caseInsensitiveCompare:item.title] == NSOrderedSame) {
            return YES;
        }
    }
    
    return NO;
}


@end
