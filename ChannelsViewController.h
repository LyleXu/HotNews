//
//  ChannelsViewController.h
//  HotNews
//
//  Created by gtcc on 9/15/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelsViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSDictionary * sectionData;
@property (nonatomic,strong) NSArray * allChannels;
@end
