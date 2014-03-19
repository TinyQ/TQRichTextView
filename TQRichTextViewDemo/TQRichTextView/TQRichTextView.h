//
//  TQRichTextView.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 2/26/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQRichTextRun.h"
#import "TQRichTextRunURL.h"
#import "TQRichTextRunEmoji.h"

@class TQRichTextView;

typedef NS_OPTIONS(NSUInteger, TQRichTextRunTypeList)
{
    TQRichTextRunNoneType  = 0,
    TQRichTextRunURLType   = 1 << 0,
    TQRichTextRunEmojiType = 1 << 1,
};

@protocol TQRichTextViewDelegate<NSObject>

@optional
- (void)richTextView:(TQRichTextView *)view touchBeginRun:(TQRichTextRun *)run;
- (void)richTextView:(TQRichTextView *)view touchEndRun:(TQRichTextRun *)run;
- (void)richTextView:(TQRichTextView *)view touchCanceledRun:(TQRichTextRun *)run;

@end

@interface TQRichTextView : UIView

@property(nonatomic,weak) id<TQRichTextViewDelegate> delegage;

@property (nonatomic,copy  ) NSString              *text;       // default is nil
@property (nonatomic,copy  ) NSMutableAttributedString *attributedText;
@property (nonatomic,strong) UIFont                *font;       // default is nil (system font 17 plain)
@property (nonatomic,strong) UIColor               *textColor;  // default is nil (text draws black)
@property (nonatomic       ) TQRichTextRunTypeList runTypeList;
@property (nonatomic)        CGFloat               lineSpace;

+ (NSMutableAttributedString *)createAttributedStringWithText:(NSString *)text font:(UIFont *)font lineSpace:(CGFloat)lineSpace;

+ (NSArray *)createTextRunsWithAttString:(NSMutableAttributedString *)attString runTypeList:(TQRichTextRunTypeList)typeList;

+ (CGRect)boundingRectWithSize:(CGSize)size font:(UIFont *)font AttString:(NSMutableAttributedString *)attString;

+ (CGRect)boundingRectWithSize:(CGSize)size font:(UIFont *)font string:(NSString *)string lineSpace:(CGFloat )lineSpace;

@end
