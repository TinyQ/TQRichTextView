//
//  TQRichTextView.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 2/26/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, TQRichTextRunTypeList)
{
    TQRichTextRunNoneType  = 0,
    TQRichTextRunURLType   = 1 << 0,
    TQRichTextRunEmojiType = 1 << 1,
};

@interface TQRichTextView : UIView

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
