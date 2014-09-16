//
//  ChannelAddViewController.m
//  HotNews
//
//  Created by gtcc on 9/16/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "ChannelAddViewController.h"
#import "SiteAddCell.h"

@implementation ChannelAddViewController

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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"ToDetailNews"]) {
//        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
//    
//        //        NewsDetailViewController* controller = segue.destinationViewController;
//        //        controller.newsInfo =  self.sectionData[indexPath.row];
//    }
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.sites = nil;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sites count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * tableIdentifier=@"SiteCell";
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
//    
//    if(cell==nil)
//    {
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
//    }
//    
//    cell.textLabel.text = [self.sites objectAtIndex:indexPath.row];
    
    SiteAddCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell==nil)
    {
        cell=[[SiteAddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }

    cell.lblTitle.text = [self.sites objectAtIndex:indexPath.row];
    return cell;
}

@end
