//
//  NewsDetailViewController.m
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "NewsDetailViewController.h"

@implementation NewsDetailViewController
@synthesize webView;
@synthesize newsInfo;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString: newsInfo.link];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:req];
}
@end
