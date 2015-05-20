//
//  SingleNewsSiteViewController.m
//  HotNews
//
//  Created by gtcc on 8/12/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "SingleSiteViewController.h"

@implementation SingleSiteViewController
@synthesize sectionData = _sectionData;

-(NSMutableArray*)sectionData
{
    if(_sectionData == nil)
    {
        _sectionData =  [DataLayer GetNewsByChannel:self.currentChannel.link timestamp:@""];
    }
    
//    if (_sectionData == nil || _sectionData.count == 0) {
//        _sectionData = [NSMutableArray array];
//        
//        CNewsInfo* news = [CNewsInfo new];
//        news.title = @"鲜果关闭RSS订阅服务 转向移动应用";
//        news.description = @"鲜果网于今日宣布将于12月12日关闭RSS订阅服务，今后将更关注与鲜果客户端的发展，而RSS阅读器用户仍可以通过鲜果网导出订阅数据。";
//        news.link = @"http://www.cnbeta.com/articles/345753.htm";
//        //news.link = @"http://site.douban.com/blooming/widget/notes/5354166/note/247683834/";
//    
//        
//        [_sectionData addObject:news];
//    }
    
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
