//
//  DataLayer.h
//  HotNews
//
//  Created by gtcc on 9/3/14.
//  Copyright (c) 2014 xc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataLayer : NSObject
+(NSMutableArray*) GetAllNews:(NSString*)newsName;
@end
