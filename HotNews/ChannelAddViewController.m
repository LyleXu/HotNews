//
//  ChannelAddViewController.m
//  HotNews
//
//  Created by gtcc on 9/16/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

//Class to be removed
#import "ChannelAddViewController.h"
#import "SiteAddCell.h"

@implementation ChannelAddViewController
@synthesize addedSites = _addedSites;


-(NSMutableArray*)addedSites
{
    return [Utility GetCachedNewsListByChanelName:@"addedSites"];
}

- (void)AddSiteIntoMemory: (NSString *)siteName
{
    if (self.addedSites == nil) {
        self.addedSites = [[NSMutableArray alloc] init];
    }
    
    [self.addedSites addObject: siteName];
    [Utility SetCachedNewsList:@"addedSites" list:self.addedSites];
}

- (void)RemoveSiteFromMemory: (NSString *)siteName
{
    if ([self.addedSites containsObject: siteName]) {
        [self.addedSites removeObject: siteName];
        
        [Utility SetCachedNewsList:@"addedSites" list:self.addedSites];
    }
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.allSites = nil;
    self.addedSites = nil;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allSites count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    bool* isAdded = false;
    NSString * tableIdentifier=@"SiteCell";
    SiteAddCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    NSString* currentTitle = [self.allSites objectAtIndex:indexPath.row];
    cell.lblTitle.text = currentTitle;

    if (self.addedSites != nil && [self.addedSites containsObject: currentTitle]) {
        isAdded = true;
    } ;
    
    //Bind click event
    [cell.btnAdd setTitle: isAdded ? @"√": @"+" forState:UIControlStateNormal];
    [cell.btnAdd addTarget:self action:@selector(addBtnClick:event:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)addBtnClick:(id)sender event:(id)event
{
    //Get the location according to touch, and then find current row
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:currentTouchPosition];

    if(indexPath != nil)
    {
        //Update title, and restore data into memory
        SiteAddCell* currentCell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        if (currentCell.btnAdd.titleLabel.text == @"√") {
            [currentCell.btnAdd setTitle:@"+" forState:UIControlStateNormal];
            [self RemoveSiteFromMemory: currentCell.lblTitle.text];
        }
        else {
            [currentCell.btnAdd setTitle:@"√" forState:UIControlStateNormal];
            [self AddSiteIntoMemory: currentCell.lblTitle.text ];
        }
    }
}
@end
