//
//  BIDPListOperate.h
//  HotNews
//
//  Created by gtcc on 1/14/15.
//  Copyright (c) 2015 xc. All rights reserved.
//

@interface BIDPListOperate : NSObject
-(void) Init:(NSString*)fileName keyName:(NSString*)key;
-(NSMutableDictionary*) Modify:(NSString*)key value:(NSString*)theValue;
-(NSMutableDictionary*) Delete:(NSString*)key;
@property (nonatomic) NSString* fileName;
@property (nonatomic) NSString* keyName;

@end
