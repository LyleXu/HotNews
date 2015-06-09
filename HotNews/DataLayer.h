//
//  DataLayer.h
//  HotNews
//
//  Created by gtcc on 9/3/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelCell.h"
#import "SBJson.h"
#import "Constraint.h"
#import "CNewsInfo.h"
#import "ChannelItem.h"

@interface DataLayer : NSObject
+ (NSMutableArray*) GetNewsByChannel:(NSString*)rssTitle timestamp:(NSString*)timestamp;
+(NSString*)GetRssContentByUrl:(NSString*)url;
+(NSMutableArray*) GetAllChannels:(NSString*)offset
                            count:(NSString*)count;

+(NSString*)GetRssContentByTitle:(NSString*)title;
@end
