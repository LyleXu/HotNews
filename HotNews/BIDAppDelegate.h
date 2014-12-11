//
//  BIDAppDelegate.h
//  HotNews
//
//  Created by gtcc on 6/26/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "WeiboSDK-Prefix.pch"
@interface BIDAppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>
{
    NSString* wbtoken;
}
@property (strong, nonatomic) NSString *wbtoken;
@property (strong, nonatomic) NSString *wb_uid;

@property (strong, nonatomic) UIWindow *window;

@end
