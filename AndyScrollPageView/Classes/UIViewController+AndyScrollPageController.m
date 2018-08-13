//
//  UIViewController+UIViewController_AndyScrollPageController.m
//  AndyScrollPageView
//
//  Created by Andy on 16/6/7.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "UIViewController+AndyScrollPageController.h"
#import "AndyScrollPageViewDelegate.h"
#import <objc/runtime.h>
char AndyIndexKey;
@implementation UIViewController (AndyScrollPageController)

//@dynamic andy_scrollViewController;

- (UIViewController *)andy_scrollViewController {
    UIViewController *controller = self;
    while (controller) {
        if ([controller conformsToProtocol:@protocol(AndyScrollPageViewDelegate)]) {
            break;
        }
        controller = controller.parentViewController;
    }
    return controller;
}

- (void)setAndy_currentIndex:(NSInteger)andy_currentIndex {
    objc_setAssociatedObject(self, &AndyIndexKey, [NSNumber numberWithInteger:andy_currentIndex], OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)andy_currentIndex {
    return [objc_getAssociatedObject(self, &AndyIndexKey) integerValue];
}


@end
