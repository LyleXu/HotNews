//
//  SingleSiteViewController.h
//  HotNews
//
//  Created by gtcc on 8/12/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNewsInfo.h"
#import "NewsDetailViewController.h"
#import "DataLayer.h"
#import "ChannelItem.h"
#import "Utility.h"

@interface SingleSiteViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray * sectionData;
@property(nonatomic,retain) ChannelItem *currentChannel;
@end
