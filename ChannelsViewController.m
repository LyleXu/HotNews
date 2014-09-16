//
//  ChannelsViewController.m
//  HotNews
//
//  Created by gtcc on 9/15/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "ChannelsViewController.h"
#import "ChannelAddViewController.h"

@implementation ChannelsViewController
@synthesize sectionData = _sectionData;

-(NSArray*)allChannels
{
   return [self.sectionData allKeys];
}

-(NSDictionary*)sectionData
{
    if(_sectionData == nil)
    {
        //_sectionData =  [DataLayer GetAllNews:@"0"];
        
        NSMutableArray* a1 = [NSMutableArray new];
        NSMutableArray* a2 = [NSMutableArray new];
        NSMutableArray* a3 = [NSMutableArray new];
        [a1 addObject:@"a1.1"];
        [a1 addObject:@"a1.2"];
        [a1 addObject:@"a1.3"];
        [a2 addObject:@"a2.1"];
        [a2 addObject:@"a2.2"];
        [a2 addObject:@"a2.3"];
        [a3 addObject:@"a3.1"];
        [a3 addObject:@"a3.2"];
        [a3 addObject:@"a3.3"];
        
        NSMutableDictionary* temp = [NSMutableDictionary new];
        [temp setObject:[a1 copy] forKey:@"科技"];
        [temp setObject:[a2 copy] forKey:@"娱乐"];
        [temp setObject:[a3 copy] forKey:@"体育"];
        
        _sectionData = [temp copy];
    }
    
    return _sectionData;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToSingleChannel"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        
        ChannelAddViewController* controller = segue.destinationViewController;
        //controller.sites =  self.sectionData[self.allChannels indexOfObject:indexPath.row];
        NSString* channelName = [self.allChannels objectAtIndex:indexPath.row];
        controller.sites = [self.sectionData objectForKey: channelName];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.sectionData = nil;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allChannels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * tableIdentifier=@"ChannelCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }

    cell.textLabel.text = [self.allChannels objectAtIndex:indexPath.row];
    return cell;
}
@end
