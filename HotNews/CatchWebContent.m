//
//  pyViewController.m
//  HotNews
//
//  Created by Jason on 15/1/4.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "CatchWebContent.h"

@interface CatchWebContent ()
@end

@implementation CatchWebContent

////使用正则匹配
//-(void)regexp:(NSString *)string
//{
//    //设置匹配规则
//    NSString *ruler = @"<div class=\"cc\">(.*?)</div>(.*?)</div>";
//    NSString *str = [self matchHTML:string withRuler:ruler];
//    
//    //输出匹配到的内容
//    //NSLog(@"%@",str);
//    //self.myText.text = str;
//}

//返回匹配好的字符串
+(NSString *)matchHTML:(NSString *)string withRuler:(NSString *)ruler
{
    //实例化正则表达式
    NSError *err = Nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:ruler options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:&err];
    
    if (err) {
        NSLog(@"匹配不模式错误");
    }
    
    //开始匹配把,要把这个匹配的内容找到才好啊
    NSTextCheckingResult *firstMatch = [regex firstMatchInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, string.length)];
    NSLog(@"%@",firstMatch);
    
    if (firstMatch) {
        //设置范围
        NSRange range = [firstMatch rangeAtIndex:1];
        //输出匹配到的内容
        NSLog(@"test matchhtml",[string substringWithRange:range]);
        return [string substringWithRange:range];
    }
    
    return  @"no validate content";
}
@end
