//
//  TQViewController.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-12.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQViewController.h"
#import "TQRichTextView.h"

@interface TQViewController ()

@end

@implementation TQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TQRichTextView *richTextView = [[TQRichTextView alloc] initWithFrame:CGRectMake(0, 22, 320, 320)];
    richTextView.text = @"＋一＋二三四＋＋五bounding＋box协议是＋一种具体形式的接口或协议是一种＋具体形式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的接口或协议是＋一种具体形式的接口＋＋或＋协议是一种具体形式的接的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的口或＋协议是一种＋具体形式的接口或协议＋是一种具体形式的＋接口或口或协议是一种具体形式的接口或协议是一种具体的接口或bounding bounding bounding bounding nding口或＋协议是一接口或协议＋是一口或＋协议是一体形式的接";
    richTextView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:richTextView];
    
}

@end
