//
//  CMHHomeViewController.m
//  WebKitDemo
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 zhihuiketang. All rights reserved.
//

#import "CMHHomeViewController.h"
#import "CMHNavigationController.h"
#import "CMHDiscoverViewController.h"
#import "CMHProfileViewController.h"

@interface CMHHomeViewController ()

@end

@implementation CMHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化所有的子控制器
    [self _setupAllChildViewController];
}

#pragma mark - 初始化所有的子视图控制器
- (void)_setupAllChildViewController{
    
    NSArray *titlesArray = @[@"发现", @"我"];
    NSArray *imageNamesArray = @[@"tabbar_discover_23x23",
                                 @"tabbar_me_23x23"];
    NSArray *selectedImageNamesArray = @[@"tabbar_discoverHL_23x23",
                                         @"tabbar_meHL_23x23"];
    
    //发现
    UINavigationController *discoverNavigationVC = ({
       
        CMHDiscoverViewController *vc = [[CMHDiscoverViewController alloc] initWithParams:nil];
        
        CMHTabBarItemTagType tagtype = CMHTabBarItemTagTypeDiscover;
        
        [self _configViewController:vc imageName:imageNamesArray[tagtype] selectedImageName:selectedImageNamesArray[tagtype] title:titlesArray[tagtype] itemTag:tagtype];
        
        [[CMHNavigationController alloc] initWithRootViewController:vc];
    });
    
    //我的
    UINavigationController *profileNavigationVC = ({
        
        CMHDiscoverViewController *vc = [[CMHDiscoverViewController alloc] initWithParams:nil];
        
        CMHTabBarItemTagType tagtype = CMHTabBarItemTagTypeProfile;
        
        [self _configViewController:vc imageName:imageNamesArray[tagtype] selectedImageName:selectedImageNamesArray[tagtype] title:titlesArray[tagtype] itemTag:tagtype];
        
        [[CMHNavigationController alloc] initWithRootViewController:vc];
    });
    
    self.tabBarController.viewControllers = @[discoverNavigationVC, profileNavigationVC];
    
}

#pragma mark - 配置ViewController
- (void)_configViewController:(UIViewController *)viewController imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title itemTag:(CMHTabBarItemTagType)tagType {
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.tag = tagType;
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    viewController.tabBarItem.title = title;
    
    NSDictionary *normalAttr = @{NSForegroundColorAttributeName:MHColorFromHexString(@"#929292"),
                                 NSFontAttributeName:MHRegularFont_10};
    NSDictionary *selectedAttr = @{NSForegroundColorAttributeName:MHColorFromHexString(@"#09AA07"),
                                   NSFontAttributeName:MHRegularFont_10};
    [viewController.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [viewController.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    [viewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    [viewController.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

@end
