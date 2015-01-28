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
//返回匹配好的字符串
+(NSString *)matchHTML:(NSString *)rawstring withRuler:(NSString *)ruler
{
    NSString *result=@"";
    //实例化正则表达式
    NSError *err = Nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:ruler options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:&err];
    
    if (err) {
        NSLog(@"匹配不模式错误");
    }
    
    //开始匹配把,要把这个匹配的内容找到才好啊
    NSTextCheckingResult *firstMatch = [regex firstMatchInString:rawstring options:NSMatchingReportCompletion range:NSMakeRange(0, rawstring.length)];
    
    NSLog(@"%@",firstMatch);
    
    if (firstMatch) {
        NSRange range1 = [firstMatch rangeAtIndex:1];
        NSString *contents = [rawstring substringWithRange:range1];
        
        NSString *pRuler= @"<p>(.*?)</p>|<img.*?/>";
        NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:pRuler options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:&err];
        NSArray *pResults = [regex2 matchesInString:contents options:0 range:NSMakeRange(0, contents.length)];
        
        for (NSTextCheckingResult *match in pResults) {
            if (!NSEqualRanges([match rangeAtIndex:1], NSMakeRange(NSNotFound, 0))) {
                result = [NSString stringWithFormat:@"%@ <p>%@</p>", result, [contents substringWithRange:[match rangeAtIndex:1]]];
            }
//            else
//            {
//                result = [NSString stringWithFormat:@"%@ <p>%@</p>", result, [contents substringWithRange:[match rangeAtIndex:2]]];
//            }
        }
    }
    
    return  result;
}
@end
