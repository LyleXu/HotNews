//
//  ChannelIndexTableViewController.m
//  HotNews
//
//  Created by Jason on 15/4/12.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "ChannelIndexTableViewController.h"
#import "SingleSiteViewController.h"
#import "ChannelCell.h"
#import "ChannelItem.h"

@implementation ChannelIndexTableViewController
@synthesize channelData = _channelData;

-(NSMutableArray*)channelData
{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SelectedChannels"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    //if (_channelData == nil) {
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectedChannels"];
        _channelData = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];
    //}
    
    if (_channelData != nil && _channelData.count>0) {
        return _channelData;
    }
    
    //In case, the memory cache is empty, then initialize a array
    if (_channelData == nil){
        _channelData = [NSMutableArray array];
    
    ChannelItem* channel1 = [ChannelItem new];
    channel1.title = @"cnBeta";
    channel1.link = @"http://www.cnbeta.com/articles/345753.htm";
            
    ChannelItem* channel2 = [ChannelItem new];
    channel2.title = @"威锋网";
    channel2.link = @"http://www.cnbeta.com/articles/345753.htm";
            
    ChannelItem* channel3 = [ChannelItem new];
    channel3.title = @"博客园";
    channel3.link = @"http://www.cnbeta.com/articles/345753.htm";
            
    [_channelData addObject:channel1];
    [_channelData addObject:channel2];
    [_channelData addObject:channel3];
    }
    
    return _channelData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(IBAction) doneTapped:(id) sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SingleSiteViewController *controller = segue.destinationViewController;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.channelData = nil;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.channelData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * tableIdentifier=@"ChannelCell";
    ChannelCell *cell=[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if(cell==nil){
        // first load
        cell=[[ChannelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    CNewsInfo* news = [self.channelData objectAtIndex:indexPath.row];
    cell.lblTitle.text = news.title;
    
    NSLog(news.title);
    
    return cell;
}
@end

