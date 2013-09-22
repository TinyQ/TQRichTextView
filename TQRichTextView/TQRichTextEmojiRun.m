//
//  TQRichTextEmojiRun.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-21.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextEmojiRun.h"

@implementation TQRichTextEmojiRun

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)drawRunWithRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSString *emojiString = [NSString stringWithFormat:@"%@.png",self.originalText];
    
    UIImage *image = [UIImage imageNamed:emojiString];
    if (image)
    {
        CGContextDrawImage(context, rect, image.CGImage);
    }
    
    NSLog(@"%f",rect.size.width);
}

+ (NSArray *) emojiStringArray
{
    return [NSArray arrayWithObjects:@"[smile]",@"[cry]",nil];
}

+ (NSString *)analyzeText:(NSString *)string runsArray:(NSMutableArray **)runArray
{
    NSString *markL = @"[";
    NSString *markR = @"]";
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    
    NSMutableString *newString = [[NSMutableString alloc] initWithCapacity:string.length];
    
    for (int i = 0; i < string.length; i++)
    {
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        
        if (([s isEqualToString:markL]) || ((stack.count > 0) && [stack[0] isEqualToString:markL]))
        {
            if (([s isEqualToString:markL]) && ((stack.count > 0) && [stack[0] isEqualToString:markL]))
            {
                for (NSString *c in stack)
                {
                    [newString appendString:c];
                }
                [stack removeAllObjects];
            }
            
            [stack addObject:s];
            
            if ([s isEqualToString:markR] || (i == string.length - 1))
            {
                NSMutableString *emojiStr = [[NSMutableString alloc] init];
                for (NSString *c in stack)
                {
                    [emojiStr appendString:c];
                }
                
                if ([[TQRichTextEmojiRun emojiStringArray] containsObject:emojiStr])
                {
                    TQRichTextEmojiRun *emoji = [[TQRichTextEmojiRun alloc] init];
                    emoji.range = NSMakeRange(i + 1 - emojiStr.length, emojiStr.length);
                    emoji.originalText = emojiStr;
                    [*runArray addObject:emoji];
                    
                    NSMutableString * spaceStr = [[NSMutableString alloc] init];
                    for (int i = 0; i < emojiStr.length; i++)
                    {
                        [spaceStr appendString:@" "];
                    }
                    [newString appendString:spaceStr];
                }
                else
                {
                    [newString appendString:emojiStr];
                }
                
                [stack removeAllObjects];
            }
        }
        else
        {
            [newString appendString:s];
        }
        
//        if ([s isEqualToString:@"＋"])
//        {
//            NSRange range = NSMakeRange(i, 1);
//            string = [string stringByReplacingCharactersInRange:range withString:@" "];
//            
//            TQRichTextEmojiRun *emoji = [[TQRichTextEmojiRun alloc] init];
//            emoji.range = range;
//            emoji.originalText = @"＋";
//            [*runArray addObject:emoji];
//        }
    }
    //http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?
//^[a-zA-Z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\s*)?$
    
//    NSError *error;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\[.*?|]" options:NSRegularExpressionCaseInsensitive error:&error];
//    
//    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
//    
//    NSMutableArray *arrayOfURLs = [[NSMutableArray alloc] init];
//    
//    for (NSTextCheckingResult *match in arrayOfAllMatches)
//    {
//        NSString* substringForMatch = [string substringWithRange:match.range];
//        NSLog(@"Extracted URL: %@",substringForMatch);
//        
//        [arrayOfURLs addObject:substringForMatch];
//    }
    
    return newString;
}

@end
