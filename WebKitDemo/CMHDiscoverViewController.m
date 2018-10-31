//
//  CMHDiscoverViewController.m
//  WebKitDemo
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 zhihuiketang. All rights reserved.
//

#import "CMHDiscoverViewController.h"
#import "CMHProfileButton.h"
#import "CMHExampleViewController.h"
#import "CMHPingTransition.h"
#import "CMHPresentTransition.h"
#import "CMHDismissTransition.h"
#import "CMHInteractiveTransition.h"

@interface CMHDiscoverViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic , readwrite , strong) CMHProfileButton *profileBtn;
/// 侧滑Dismiss
@property (nonatomic , readwrite , strong) CMHInteractiveTransition *interactiveDissmiss;

@end

@implementation CMHDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置导航栏
    [self _setupNavigationItem];
}

#pragma mark - 设置导航栏
- (void)_setupNavigationItem{
    /// 设置个人中心
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.profileBtn];
    
//    /// 添加按钮
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem mh_systemItemWithTitle:nil titleColor:nil imageName:@"barbuttonicon_add_30x30" target:self selector:@selector(_addMore) textType:NO];
}

#pragma mark - 事件处理Or辅助方法
- (void)_profileBtnDidClciked:(UIButton *)sender{
    
    /// 设置动画
    self.navigationController.delegate = self;
    CMHExampleViewController *example04 = [[CMHExampleViewController alloc] initWithParams:nil];
    [self.navigationController pushViewController:example04 animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    /// 过滤一下下
    if (![toVC isKindOfClass:CMHExampleViewController.class]) {
        return nil;
    }
    if (operation == UINavigationControllerOperationPush) {
        CMHPingTransition *ping = [[CMHPingTransition alloc] init];
        return ping;
    }
    
    return nil;
    
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [CMHPresentTransition new];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [CMHDismissTransition new];
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveDissmiss.interacting ? self.interactiveDissmiss : nil;
}



#pragma mark - Setter & Getter
- (CMHProfileButton *)profileBtn{  /// 44 X 44
    if (_profileBtn == nil) {
        /// profileBtn
        /// CoderMikeHe Fixed Bug :
        /// 这里不能用系统的UIButton，否则我们即使设置了按钮的固定大小，到时候展示网络图片的时候，按钮大小会跟随图片大小，解决方案：详见`CMHProfileButton`
        _profileBtn = [[CMHProfileButton alloc] init];
        [_profileBtn setImage:MHImageNamed(@"avata_default_my") forState:UIControlStateNormal];
        [_profileBtn yy_setImageWithURL:[NSURL URLWithString:@"http://tva3.sinaimg.cn/crop.0.6.264.264.180/93276e1fjw8f5c6ob1pmpj207g07jaa5.jpg"] forState:UIControlStateNormal placeholder:MHImageNamed(@"fts_default_headimage_36x36") options:CMHWebImageOptionAutomatic completion:NULL];
        _profileBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_profileBtn addTarget:self action:@selector(_profileBtnDidClciked:) forControlEvents:UIControlEventTouchUpInside];
        [_profileBtn sizeToFit];
    }
    return _profileBtn;
}

- (CMHInteractiveTransition *)interactiveDissmiss{
    if (_interactiveDissmiss == nil) {
        _interactiveDissmiss  = [[CMHInteractiveTransition alloc] init];
    }
    return _interactiveDissmiss ;
}

@end
