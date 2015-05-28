//
//  AddChannelViewController.m
//  HotNews
//
//  Created by Jason on 15/4/15.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "AddChannelViewController.h"
#import "ChannelItem.h"

@implementation AddChannelViewController
@synthesize Channels = _channels;
@synthesize txtChannelName, txtChannelUrl;

-(NSMutableArray*)Channels{
    if (_channels == nil) {
        _channels = [Utility GetCacheByName:@"SelectedChannels"];
    }
    
    return _channels;
}

- (void)AddChannelIntoMemory: (ChannelItem *)c
{
    if (self.Channels == nil) {
        self.Channels = [[NSMutableArray alloc] init];
    }
    
    [self.Channels addObject: c];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.Channels] forKey:@"SelectedChannels"];
    
    [defaults synchronize];
}

-(IBAction)addChannelBtn:(id)sender
{
    ChannelItem *c = [ChannelItem new];
    c.title = self.txtChannelName.text;
    c.link = self.txtChannelUrl.text;
    c.lastUpdateDate = nil;
    
    if ([Utility IsAlreadyExist: c.title]) {
        NSString* warningMSG = [NSString stringWithFormat:@"The channel [%@] is already exist!", c.title];
        UIAlertView *alertWarning = [[UIAlertView alloc] initWithTitle:@"" message: warningMSG delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertWarning show];
        return;
    }
    
    [self AddChannelIntoMemory: c ];
    
    NSString* msg = [NSString stringWithFormat:@"Add [%@] successfully!", self.txtChannelName.text];
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert1 show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

@end
