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
    float maxWidth = 0.95 * [UIScreen mainScreen].applicationFrame.size.width;
    
    NSString* targetWebContent = [DataLayer GetRssContentByTitle:newsInfo.title];
    NSString* cssString =
    [NSString stringWithFormat:@"<style type='text/css'>img {width:%fpx; height: auto;}</style>",maxWidth];
    //NSString* htmlString = [NSString stringWithFormat:@"%@%@", cssString, targetWebContent];
    NSString* htmlString = [NSString stringWithFormat:@"<html><head></head><body>%@%@</body></html>", cssString, targetWebContent];
    [self.webView loadHTMLString:htmlString baseURL:nil];
    
    
//    [self.webView stringByEvaluatingJavaScriptFromString:
//     @"var script = document.createElement('script');"
//     "script.type = 'text/javascript';"
//     "script.text = \"function ResizeImages() { "
//     "alert('aaaaa');"
//     "var myimg,oldwidth;"
//     "var maxwidth = 20.0;"
//     "for(i=0;i <document.images.length;i++){"
//     "myimg = document.images[i];"
//     "if(myimg.width > maxwidth){"
//     "oldwidth = myimg.width;"
//     "myimg.width = maxwidth;"
//     "}"
//     "}"
//     "}\";"
//     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
//    [self.webView stringByEvaluatingJavaScriptFromString:
//     @"var script = document.createElement('script');"
//     "script.type = 'text/javascript';"
//     "script.text = \"function ResizeImages() { "
//     "alert('aaaaa');"
//     "}\";"
//     "document.getElementsByTagName('head')[0].appendChild(script);"];
//    [self.webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
}
@end
