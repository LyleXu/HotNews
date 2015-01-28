//
//  BIDPListOperate.m
//  HotNews
//
//  Created by gtcc on 1/14/15.
//  Copyright (c) 2015 xc. All rights reserved.
//

#import "BIDPListOperate.h"

@implementation BIDPListOperate

-(void)Init:(NSString *)fileName keyName:(NSString *)key
{
    self.fileName = fileName;
    self.keyName = key;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:fileName];
    //判断是否以创建文件
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        //此处可以自己写显示plist文件内容
        NSLog(@"文件已存在");
    }
    else
    {
        //如果没有plist文件就自动创建
        NSMutableDictionary *dictplist = [[NSMutableDictionary alloc ] init];
        NSMutableDictionary *dicttxt = [[NSMutableDictionary alloc ] init];
        [dictplist setObject:dicttxt forKey:key];
        //写入文件
        [dictplist writeToFile:plistPath atomically:YES];
    }
}

-(NSMutableDictionary*) Modify:(NSString *)key value:(NSString *)theValue
{
    NSString* path = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:self.fileName];
    NSMutableDictionary* appList = [[[NSMutableDictionary alloc] initWithContentsOfFile:path] mutableCopy];
    NSMutableDictionary* info = [appList objectForKey:self.keyName];
    NSString* value1 = [info objectForKey:key];
    value1 = theValue;
    [info setValue:value1 forKey:key];
    [appList setValue:info forKey:self.keyName];
    
    [appList writeToFile:path atomically:YES];
    
    NSLog(@"key = %@", key);
    NSLog(@"value = %@",theValue);
    
    return appList;
}

-(NSMutableDictionary*) Delete:(NSString *)key
{
    NSString* path = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:self.fileName];
    NSMutableDictionary* appList = [[[NSMutableDictionary alloc] initWithContentsOfFile:path] mutableCopy];
    NSMutableDictionary* info = [appList objectForKey:self.keyName];
    
    [info removeObjectForKey:key];
    [appList setValue:info forKey:self.keyName];
    
    [appList writeToFile:path atomically:YES];
    
    return appList;
}


@end
