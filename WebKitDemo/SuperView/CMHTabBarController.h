//
//  CMHTabBarController.h
//  WebKitDemo
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 zhihuiketang. All rights reserved.
//

#import "CMHViewController.h"


@interface CMHTabBarController : CMHViewController<UITabBarControllerDelegate>

/// The `tabBarController` instance
@property (nonatomic, readonly, strong) UITabBarController *tabBarController;

@end
