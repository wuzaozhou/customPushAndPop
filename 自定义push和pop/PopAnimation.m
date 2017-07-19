//
//  PopAnimation.m
//  自定义push和pop
//
//  Created by 吴灶洲 on 2016/11/29.
//  Copyright © 2016年 吴灶洲. All rights reserved.
//

#import "PopAnimation.h"

@implementation PopAnimation


/** 动画时间 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect toRect = [transitionContext finalFrameForViewController:toViewController];
    
    toViewController.view.frame = CGRectOffset(toRect, 0, toRect.size.height);
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = toRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}


@end




