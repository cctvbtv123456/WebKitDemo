//
//  AppDelegate.h
//  WebKitDemo
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 zhihuiketang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedDelegate;

@end

