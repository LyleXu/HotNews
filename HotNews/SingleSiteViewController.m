//
//  SingleNewsSiteViewController.m
//  HotNews
//
//  Created by gtcc on 8/12/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "SingleSiteViewController.h"
#import "NewsDetailViewController.h"
#import "NewsTabViewCell.h"
#import "DataLayer.h"

@implementation SingleSiteViewController
@synthesize sectionData = _sectionData;

-(NSMutableArray*)sectionData
{
    if(_sectionData == nil)
    { 
        _sectionData =  [DataLayer GetAllNews:@"0"];
    }
    
    return _sectionData;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"identifier:", segue.identifier);
//    if ([segue.identifier isEqualToString:@"ToDetailNews"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        
//        CNewsInfo* currentCell =
        NewsDetailViewController* controller = segue.destinationViewController;
        controller.newsInfo =  self.sectionData[indexPath.row];
//    }
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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    //return [self.sectionData count];
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sectionData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CNewsInfo* news =nil;
    NSString * tableIdentifier=@"NewsCell";
    NewsTabViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell==nil)
    {
        // first load
        cell=[[NewsTabViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
//    NSArray* model = self.sectionData;
//    news = model[indexPath.row];
    NSUInteger row = [indexPath row];
    news = [self.sectionData objectAtIndex:row];
    cell.lblTitle.text = news.title;
    
    return cell;
}
@end
