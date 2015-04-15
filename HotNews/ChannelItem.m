//
//  ChannelItem.m
//  HotNews
//
//  Created by Jason on 15/4/15.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "ChannelItem.h"

@implementation ChannelItem
@synthesize title, link;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.link forKey:@"link"];
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.link = [decoder decodeObjectForKey:@"link"];
    }
    return  self;
}
@end
