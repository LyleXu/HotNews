//
//  AddChannelViewController.h
//  HotNews
//
//  Created by Jason on 15/4/15.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"

@interface AddChannelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField   *txtChannelName;
@property (weak, nonatomic) IBOutlet UITextField   *txtChannelUrl;
@property (nonatomic,strong) NSMutableArray * Channels;

@end
