//
//  SingleSiteViewController.h
//  HotNews
//
//  Created by gtcc on 8/12/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNewsInfo.h"

@interface SingleSiteViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSString *iconPath;
@property (nonatomic,strong) NSMutableArray * sectionData;
@end
