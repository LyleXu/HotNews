//
//  NewsDetailViewController.h
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNewsInfo.h"

@interface NewsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView* webView;
@property (weak,nonatomic) CNewsInfo* newsInfo;
@end
