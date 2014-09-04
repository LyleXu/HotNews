//
//  CNewsInfo.m
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "CNewsInfo.h"

@implementation CNewsInfo

-(void) Parse:(NSDictionary*) data
{
    self.title = [data objectForKey:@"title"] != [NSNull null] ? [[data objectForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : nil;
    self.link = [data objectForKey:@"link"] != [NSNull null] ? [[data objectForKey:@"link"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : nil;
    self.description = [data objectForKey:@"description"] != [NSNull null] ? [[data objectForKey:@"description"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : nil;
}
@end
