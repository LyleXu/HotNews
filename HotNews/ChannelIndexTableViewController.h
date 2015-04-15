//
//  ChannelIndexTableViewController.h
//  HotNews
//
//  Created by Jason on 15/4/12.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelIndexTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray * channelData;
@end
