//
//  PushAnimation.m
//  自定义push和pop
//
//  Created by 吴灶洲 on 2016/11/29.
//  Copyright © 2016年 吴灶洲. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

/** 动画时间 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    UIViewController *fromeViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect toFrame = [transitionContext finalFrameForViewController:toViewController];
//    CGRect fromFrame = [transitionContext initialFrameForViewController:fromeViewController];
    
    toViewController.view.frame = CGRectOffset(toFrame, 0, -toFrame.size.height);
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = toFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
}


@end
