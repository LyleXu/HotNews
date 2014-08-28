//
//  NewsTableViewCell.h
//  HotNews
//
//  Created by gtcc on 8/18/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTabViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel* lblTitle;
@property (nonatomic,weak) IBOutlet UILabel* lblContent;
@end
