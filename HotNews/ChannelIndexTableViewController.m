//
//  ChannelIndexTableViewController.m
//  HotNews
//
//  Created by Jason on 15/4/12.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "ChannelIndexTableViewController.h"

@implementation ChannelIndexTableViewController
@synthesize channelData = _channelData;

-(NSMutableArray*)channelData
{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SelectedChannels"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    if (self.isLoaded == NO) {
        _channelData = [NSMutableArray new];
        
        _channelData = [DataLayer GetAllChannels:@"" count:@""];
        for (ChannelItem *item in [Utility GetCustomizedChannel]) {
            [_channelData addObject:item];
        }
        
        self.isLoaded = YES;
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
    
    if ([segue.identifier isEqualToString:@"ToSingleChannel"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        ChannelItem* selectedChannel = nil;
        if(indexPath != nil)
            selectedChannel = self.channelData[indexPath.row];
    
        controller.currentChannel = selectedChannel;
    }
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
    self.isLoaded = NO;
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
    
    self.selChannelUrl = news.link;
    
    return cell;
}
@end

