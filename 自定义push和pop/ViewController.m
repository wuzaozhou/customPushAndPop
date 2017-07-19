//
//  ViewController.m
//  自定义push和pop
//
//  Created by 吴灶洲 on 2016/11/29.
//  Copyright © 2016年 吴灶洲. All rights reserved.
//

#import "ViewController.h"
#import "PushAnimation.h"
#import "TwoViewController.h"
#import "PopAnimation.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}
- (IBAction)push:(id)sender {
    TwoViewController *viewController = [[TwoViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return [[PushAnimation alloc]init];
    }
    if (operation == UINavigationControllerOperationPop) {
        return [[PopAnimation alloc] init];
    }
    return nil;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
