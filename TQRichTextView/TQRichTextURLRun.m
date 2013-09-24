//
//  TQRichTextURLRun.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-23.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextURLRun.h"

@implementation TQRichTextURLRun

//-- 替换基础文本
- (void)replaceTextWithAttributedString:(NSMutableAttributedString*) attributedString
{
    [attributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:(id)[UIColor blueColor].CGColor range:self.range];
    [super replaceTextWithAttributedString:attributedString];
}

//-- 绘制内容
- (void)drawRunWithRect:(CGRect)rect
{
    
}

+ (NSString *)analyzeText:(NSString *)string runsArray:(NSMutableArray **)runArray
{
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch = [string substringWithRange:match.range];
        TQRichTextURLRun *urlRun = [[TQRichTextURLRun alloc] init];
        urlRun.range = match.range;
        urlRun.originalText = substringForMatch;
        
        [*runArray addObject:urlRun];
        
        NSLog(@"Extracted URL: %@",substringForMatch);
    }
    
    return [string copy];
}

@end
