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
    NSURL *url = [NSURL URLWithString: newsInfo.linkUrl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}
@end
