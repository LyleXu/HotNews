//
//  NewsDetailViewController.m
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "CatchWebContent.h"
#import "DataLayer.h"

@implementation NewsDetailViewController
@synthesize webView;
@synthesize newsInfo;

-(NSString *) getNewsTemplate
{
    return @"<html><head><h4 style=\"text-align:center;color:blue;\">%@</h4></head><body>%@</body></html>";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString * targetWebContent = [DataLayer GetRssContentByUrl:newsInfo.link];
    [self.webView loadHTMLString:targetWebContent baseURL:nil];
}
@end
