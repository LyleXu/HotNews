//
//  NewsDetailViewController.m
//  HotNews
//
//  Created by gtcc on 8/14/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "CatchWebContent.h"

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
    
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
//    self.webView.scalesPageToFit = YES;
//    [self.webView loadRequest:req];
    
    //<article class=\"cb_box article\">(.*?)</article>
    //Get full html content from url
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0f];
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSString *fullHtmlContent = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            NSLog(fullHtmlContent);
            
            NSString * ruler = @"<article class=\"cb_box article\">(.*?)</article>";
//            NSString * ruler = @"<div class=\"cc\">(.*?)</div>(.*?)</div>";
            NSString * targetWebContent = [CatchWebContent matchHTML:fullHtmlContent withRuler:ruler];
            [self.webView loadHTMLString:targetWebContent baseURL:nil];
        }];
}
@end
