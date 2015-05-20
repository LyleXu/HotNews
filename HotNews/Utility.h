//
//  Utility.h
//  HotNews
//
//  Created by Jason on 15/4/27.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelItem.h"

@interface Utility : UIViewController

+ (NSMutableArray*) builtInChannel;
+ (NSMutableArray*) memoryChannel;
+ (BOOL *) isAlreadyExist: (NSString*)title;
@end
