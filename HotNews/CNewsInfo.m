//
//  CNewsInfo.m
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "CNewsInfo.h"

@implementation CNewsInfo
@synthesize title,link,description;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.link forKey:@"link"];
    [encoder encodeObject:self.description forKey:@"description"];
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.link = [decoder decodeObjectForKey:@"link"];
        self.description = [decoder decodeObjectForKey:@"description"];
    }
    return  self;
}

-(void) Parse:(NSDictionary*) data
{
    self.title = [data objectForKey:@"title"] != [NSNull null] ? [[data objectForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : nil;
    self.link = [data objectForKey:@"link"] != [NSNull null] ? [[data objectForKey:@"link"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : nil;
    self.description = [data objectForKey:@"description"] != [NSNull null] ? [[data objectForKey:@"description"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : nil;
}
@end
