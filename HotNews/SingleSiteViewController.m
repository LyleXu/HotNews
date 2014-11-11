//
//  SingleNewsSiteViewController.m
//  HotNews
//
//  Created by gtcc on 8/12/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "SingleSiteViewController.h"
#import "NewsDetailViewController.h"
#import "DataLayer.h"

@implementation SingleSiteViewController
@synthesize sectionData = _sectionData;

-(NSMutableArray*)sectionData
{
    if(_sectionData == nil)
    {
        _sectionData =  [DataLayer GetAllNews:@"cnbeta"];
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
    if ([segue.identifier isEqualToString:@"ToDetailNews"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];

        NewsDetailViewController* controller = segue.destinationViewController;
        controller.newsInfo =  self.sectionData[indexPath.row];
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
    return [self.sectionData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * tableIdentifier=@"NewsCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    CNewsInfo* news = [self.sectionData objectAtIndex:indexPath.row];
    cell.textLabel.text = news.title;
    
    return cell;
}
@end
