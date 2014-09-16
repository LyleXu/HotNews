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
@synthesize allAddedSites = _allAddedSites;

-(NSArray*)allAddedSites
{
    _allAddedSites = nil;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSString *addedSites = [defaults objectForKey:@"addedSites"];
    if (addedSites != nil) {
        _allAddedSites = [addedSites componentsSeparatedByString:@"|"];
    }
    
    return _allAddedSites;
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
    bool* isAdded = false;
    NSString * tableIdentifier=@"SiteCell";
    SiteAddCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    NSString* currentTitle = [self.sites objectAtIndex:indexPath.row];
    cell.lblTitle.text = currentTitle;

    if (self.allAddedSites != nil && [self.allAddedSites containsObject: currentTitle]) {
        isAdded = true;
    } ;
    
    //Bind click event
    [cell.btnAdd setTitle: isAdded ? @"√": @"+" forState:UIControlStateNormal];
    [cell.btnAdd setEnabled: !isAdded];
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
//        NSInteger* tRow = indexPath.row +1;
//        NSString *titileString = [NSString stringWithFormat:@"Current index equals: %ld", tRow];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"imtitle" message:titileString delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
//        [alert show];
        
        //Update the status of current cell
        SiteAddCell* currentCell = [self.tableView cellForRowAtIndexPath:indexPath];
        [currentCell.btnAdd setEnabled: false];
        [currentCell.btnAdd setTitle:@"√" forState:UIControlStateNormal];

        //保存数据：
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        NSString* addedSites = [defaults objectForKey:@"addedSites"];
        addedSites = addedSites == nil? currentCell.lblTitle.text :
        [NSString stringWithFormat: @"%@|%@", addedSites, currentCell.lblTitle.text];
        [defaults setObject:addedSites forKey:@"addedSites"];
        
        //[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"addedSites"];
        [defaults synchronize];
        
//        //获得UIImage实例
//        UIImage *image=[[UIImage alloc]initWithContentsOfFile:@"photo.jpg"];
//        NSData *imageData = UIImageJPEGRepresentation(image, 100);//UIImage对象转换成NSData
//        [defaults synchronize];//用synchronize方法把数据持久化到standardUserDefaults数据库
        
//        //读取数据：
//        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
//        NSString *name = [defaults objectForKey:@"name"];//根据键值取出name
//        NSData *imageData = [defaults dataForKey:@"image"];
//        UIImage *Image = [UIImage imageWithData:imageData];//NSData转换为UIImage
        
//        //Delete user data
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"test"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        
//        //Remove all user data
//        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"dontClearHXCache"])
//        {
//            NSString *appDomainStr = [[NSBundle mainBundle] bundleIdentifier];
//            [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomainStr];
//            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"dontClearHXCache"];
//            [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//        else
//        {
//            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"dontClearHXCache"];
//            [[NSUserDefaults standardUserDefaults]synchronize];
//            
//        }
        
    }
}
@end
