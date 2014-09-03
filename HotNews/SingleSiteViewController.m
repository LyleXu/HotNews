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

@implementation SingleSiteViewController
@synthesize sectionData = _sectionData;

-(NSMutableArray*)sectionData
{
    if(_sectionData == nil)
    {
        _sectionData = [[NSMutableArray alloc] init];
        CNewsInfo* news1 = [[CNewsInfo alloc] init];
        news1.title = @"cnBeta中文业界资讯站";
        news1.content = @"imcontent";
        news1.linkUrl = @"http://www.cnbeta.com";
        
        CNewsInfo* news2 = [[CNewsInfo alloc] init];
        news2.title = @"CocoChina";
        news2.content = @"imcontent";
        news2.linkUrl = @"http://www.cocoachina.com";
        
        CNewsInfo* news3 = [[CNewsInfo alloc] init];
        news3.title = @"今日头条";
        news3.content = @"imcontent";
        news3.linkUrl = @"http://www.toutiao.com";
    
        [_sectionData addObject:news1];
        [_sectionData addObject:news2];
        [_sectionData addObject:news3];
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
//    self.iconName.text = [[self.iconPath lastPathComponent] stringByDeletingPathExtension];
//    self.newsTitle.textLabel.text =[[self.iconPath lastPathComponent] stringByExpandingTildeInPath];
//    //[self.newsTitle.textLabel.backgroundColor]
//    //self.newsTitle.selectedBackgroundView = [[[UIView alloc] initWithFrame:self.newsTitle.frame] autorelease];
//    self.newsTitle.textLabel.backgroundColor = [UIColor redColor];
//    self.newsTitle.textLabel.highlightedTextColor = [UIColor blueColor];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//        
//        UIImage *image = [UIImage imageWithContentsOfFile:self.iconPath];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            self.iconView.image = image;
//        });
//    });
    
	// Do any additional setup after loading the view.
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
    
    NSArray* model = self.sectionData;
    news = model[indexPath.row];
    cell.lblTitle.text = news.title;
    
    return cell;
}
@end
