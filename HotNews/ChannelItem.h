//
//  ChannelItem.h
//  HotNews
//
//  Created by Jason on 15/4/15.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelItem : NSObject<NSCoding>

@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain) NSString *link;
@property(nonatomic,retain) NSDate *lastUpdateDate;

-(void) Parse:(NSDictionary*) data;
@end
