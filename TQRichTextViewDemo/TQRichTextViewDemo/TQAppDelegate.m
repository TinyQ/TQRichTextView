//
//  TQAppDelegate.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 2/26/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import "TQAppDelegate.h"
#import "TQViewController.h"
#import "TQViewController.h"
@implementation TQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[TQViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
