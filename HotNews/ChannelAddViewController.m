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
    SiteAddCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    cell.lblTitle.text = [self.sites objectAtIndex:indexPath.row];

    //Bind click event
    [cell.btnAdd setTitle:indexPath.row == 0 ? @"√": @"+" forState:UIControlStateNormal];
    [cell.btnAdd setEnabled: indexPath.row == 0 ? false: true];
    [cell.btnAdd addTarget:self action:@selector(myBtnClick:event:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)myBtnClick:(id)sender event:(id)event
{
    //Get the location according to touch, and then find current row
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:currentTouchPosition];

    if(indexPath != nil)
    {
        NSInteger* tRow = indexPath.row +1;
        NSString *titileString = [NSString stringWithFormat:@"Current index equals: %ld", tRow];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"imtitle" message:titileString delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        SiteAddCell* currentCell = [self.tableView cellForRowAtIndexPath:indexPath];
        [currentCell.btnAdd setEnabled: false];
        [currentCell.btnAdd setTitle:@"√" forState:UIControlStateNormal];
        
        [alert show];
    }
}
@end
