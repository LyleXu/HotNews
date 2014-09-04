//
//  CNewsInfo.h
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNewsInfo : NSObject
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain) NSString *description;
@property(nonatomic,retain) NSString *link;

-(void) Parse:(NSDictionary*) data;
@end
