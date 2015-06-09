//
//  ChannelAddViewController.h
//  HotNews
//
//  Created by gtcc on 9/16/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"

@interface ChannelAddViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray * allSites;
@property (nonatomic,strong) NSMutableArray * addedSites;

- (void)AddSiteIntoMemory: (NSString *)siteName;
- (void)RemoveSiteFromMemory: (NSString *)siteName;
@end