//
//  NewsTableViewCell.m
//  HotNews
//
//  Created by gtcc on 8/18/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import "NewsTabViewCell.h"

@implementation NewsTabViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
