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
        [a1 addObject:@"CocoaChina"];
        [a1 addObject:@"IT之家"];
        [a1 addObject:@"cnBeta"];
        [a2 addObject:@"娱乐八卦"];
        [a2 addObject:@"豆瓣影评"];
        [a2 addObject:@"八卦娱"];
        [a3 addObject:@"NBA"];
        [a3 addObject:@"CBA"];
        [a3 addObject:@"英超"];
        
        NSMutableDictionary* temp = [NSMutableDictionary new];
        [temp setObject:[a1 copy] forKey:@"科技"];
        [temp setObject:[a2 copy] forKey:@"娱乐"];
        [temp setObject:[a3 copy] forKey:@"体育"];
        
        _sectionData = [temp copy];
    }
    
    return _sectionData;
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
        controller.sites = [self.sectionData objectForKey: [self.allChannels objectAtIndex:indexPath.row]];
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
