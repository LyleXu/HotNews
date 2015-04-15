//
//  ChannelCell.m
//  HotNews
//
//  Created by Jason on 15/4/14.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "ChannelCell.h"

@implementation ChannelCell

@synthesize lblTitle;

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
