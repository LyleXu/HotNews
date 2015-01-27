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
    NSURL *url = [NSURL URLWithString: newsInfo.link];
    
    //Get full html content from url
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0f];
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSString *fullHtmlContent = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSString * ruler = @"<section class=\"article_content\">(.*?)</section>";
            NSString * targetWebContent = [NSString stringWithFormat:[self getNewsTemplate], newsInfo.title,[CatchWebContent matchHTML:fullHtmlContent withRuler:ruler]];
            [self.webView loadHTMLString:targetWebContent baseURL:nil];
        }];
}
@end
