//
//  NewsView.m
//  HotNews
//
//  Created by gtcc on 8/31/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "NewsView.h"

@implementation NewsView
- (void)viewDidLoad
{
    [super viewDidLoad];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
}

@end
