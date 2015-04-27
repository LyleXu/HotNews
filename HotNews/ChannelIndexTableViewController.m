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
//@synthesize builtInChannel = _builtInChannel;

//-(NSMutableArray*)builtInChannel
//{
//    if (_builtInChannel == nil) {
//        _builtInChannel =[NSMutableArray array];
//        
//        ChannelItem* channel1 = [ChannelItem new];
//        channel1.title = @"cnBeta";
//        channel1.link = @"http://www.cnbeta.com/articles/345753.htm";
//        
//        ChannelItem* channel2 = [ChannelItem new];
//        channel2.title = @"威锋网";
//        channel2.link = @"http://www.cnbeta.com/articles/345753.htm";
//        
//        ChannelItem* channel3 = [ChannelItem new];
//        channel3.title = @"博客园";
//        channel3.link = @"http://www.cnbeta.com/articles/345753.htm";
//        
//        [_builtInChannel addObject:channel1];
//        [_builtInChannel addObject:channel2];
//        [_builtInChannel addObject:channel3];
//    }
//    
//    return _builtInChannel;
//}


-(NSMutableArray*)channelData
{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SelectedChannels"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    if (self.isLoaded == NO) {
        _channelData = [NSMutableArray new];
    
        if (Utility.builtInChannel !=nil && Utility.builtInChannel.count>0) {
            for (ChannelItem *builtInItem in Utility.builtInChannel) {
                [_channelData addObject:builtInItem];
            }
        }
        
//        NSMutableArray* _storedChannels = [NSMutableArray new];
//        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
//        NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectedChannels"];
//        _storedChannels = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];
        
        if ([Utility memoryChannel] !=nil && [Utility memoryChannel].count >0) {
            for (ChannelItem *item in [Utility memoryChannel]) {
                [_channelData addObject:item];
            }
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
    
    return cell;
}
@end

