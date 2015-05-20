//
//  DataLayer.m
//  HotNews
//
//  Created by gtcc on 9/3/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "DataLayer.h"

@implementation DataLayer
+ (NSString*) GetJsonString:(NSString*)serviceName
                 methodName:(NSString*)methodName
                 parameters:(NSArray*)parameters
{
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSString stringWithString:serviceName], @"serviceName",
                                    [NSString stringWithString:methodName], @"methodName",
                                    [NSArray arrayWithArray:parameters], @"parameters",
                                    nil];
    
    NSString *jsonString = [jsonDictionary JSONRepresentation];
    return jsonString;
}

//Array of CBook
+ (NSMutableArray*) GetAllChannels:(NSString*)offset
                          count:(NSString*)count
{
    NSArray* parameters = [NSArray arrayWithObjects: offset, count, nil];
    NSDictionary* result = [self FetchData:@"ChannelService" methodName:@"GetAllChannels" parameters:parameters];
    NSDictionary* datas = [result valueForKey:@"channels"];
    
    NSMutableArray *AllChannels = [NSMutableArray array];
    
    if([datas count])
    {
        for (NSDictionary *data in [datas allValues]) {
            ChannelItem* channel = [ChannelItem new];
            [channel Parse:data];
            [AllChannels addObject:channel];
        }
    }
    
    //return [AllChannels copy];
    return AllChannels;
}


+ (NSDictionary*) FetchData:(NSString*)serviceName
                 methodName:(NSString*)methodName
                 parameters:(NSArray*)parameters
{
    NSError *theError = nil;
    
    NSString* jsonString = [self GetJsonString:serviceName methodName:methodName parameters:parameters];
    NSLog(@"%@",jsonString);
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

    NSString* serverURL = [[NSString alloc] initWithFormat:@"%@%@",ServerHost,ServiceAddress];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverURL]];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];
    NSMutableString *theString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] copy];
    NSDictionary *jsonDictionaryResponse = [theString JSONValue];
    return jsonDictionaryResponse;
}

//Array of CNewsInfo
+ (NSMutableArray*) GetAllNews:(NSString*)rssUrl maxRequiredCount:(NSString*)maxCount
{
    NSArray* parameters = [NSArray arrayWithObjects: rssUrl, maxCount, nil];
    NSDictionary* result = [self FetchData:@"RssService" methodName:@"GetRssFeeds" parameters:parameters];
    NSDictionary* datas = [result valueForKey:@"rss"];
    
    NSMutableArray *AllNews = [NSMutableArray array];
    
    if([datas count])
    {
        for (NSDictionary *data in [datas allValues]) {
            CNewsInfo* news = [CNewsInfo new];
            [news Parse:data];
            [AllNews addObject:news];
        }
    }
    
    return [AllNews copy];
}

+(NSString*)GetRssContentByUrl:(NSString*)url
{
    NSArray* parameters = [NSArray arrayWithObjects: url, nil];
    NSDictionary* result = [self FetchData:@"RssNewsService" methodName:@"GetRssContentByUrl" parameters:parameters];
    NSString* rssContent = [result valueForKey:@"rss"];
    
    return rssContent;
}

@end
