//
//  BIDViewController.m
//  HotNews
//
//  Created by gtcc on 6/26/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "MKViewController.h"
#import "MKPhotoCell.h"
#import "SingleSiteViewController.h"
#import "CNewsInfo.h"
#import "SBJson.h"
#import "SBJsonWriter.h"
#import "DataLayer.h"

@interface MKViewController ()
@property (strong, nonatomic) NSArray *photosList;
@property (strong, nonatomic) NSMutableDictionary *photosCache;
@end

@implementation MKViewController
//Array of CNewsInfo
+ (NSMutableArray*) GetAllNews
{
//    NSMutableArray* allBooks = [DataLayer GetAllBooks:@"0" count:@""];
    
    
    NSMutableArray *NewsArray = [NSMutableArray array];
    
    CNewsInfo* news = [[CNewsInfo alloc] init];
    news.title = @"imtitle1";
    news.description = @"imcontent";
    
    [NewsArray addObject:news];
    [NewsArray addObject:news];
    [NewsArray addObject:news];

    return [NewsArray copy];
}

-(NSString*) photosDirectory {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Icons"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray * photosArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self photosDirectory] error:nil];
    self.photosList = nil;
    self.photosCache = [NSMutableDictionary dictionary];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        [photosArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSString *path = [[self photosDirectory] stringByAppendingPathComponent:obj];
            CGSize size = [UIImage imageWithContentsOfFile:path].size;}];
        
        dispatch_async(dispatch_get_current_queue(), ^{
            
            self.photosList = photosArray;
            [self.collectionView reloadData];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.photosCache = [NSMutableDictionary dictionary];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *selectedIndexPath = sender;
    NSString *iconName = [self.photosList objectAtIndex:selectedIndexPath.row];
    
    SingleSiteViewController *controller = segue.destinationViewController;
    controller.iconPath = [[self photosDirectory] stringByAppendingPathComponent:iconName];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photosList count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MKPhotoCell";
    
    MKPhotoCell *cell = (MKPhotoCell*) [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *photoName = [self.photosList objectAtIndex:indexPath.row];
    NSString *photoFilePath = [[self photosDirectory] stringByAppendingPathComponent:photoName];
    //cell.nameLabel.text =[photoName stringByDeletingPathExtension];
    
    __block UIImage* thumbImage = [self.photosCache objectForKey:photoName];
    cell.photoView.image = thumbImage;
    
    if(!thumbImage) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            UIImage *image = [UIImage imageWithContentsOfFile:photoFilePath];
                UIGraphicsBeginImageContext(CGSizeMake(180.0f, 120.0f));
                [image drawInRect:CGRectMake(0, 0, 180.0f, 120.0f)];
                thumbImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.photosCache setObject:thumbImage forKey:photoName];
                cell.photoView.image = thumbImage;
            });
        });
    }
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"ToSingleNewsSite" sender:indexPath];
}
@end
