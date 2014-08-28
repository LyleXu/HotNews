//
//  MKPhotoCell.m
//  HotNews
//
//  Created by gtcc on 7/29/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "MKPhotoCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation MKPhotoCell
-(void) awakeFromNib {
    
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
    
    self.photoView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.photoView.layer.borderWidth = 5.0f;
    
    [super awakeFromNib];
}
@end
