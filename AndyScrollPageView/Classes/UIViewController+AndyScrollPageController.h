//
//  UIViewController+UIViewController_AndyScrollPageController.h
//  AndyScrollPageView
//
//  Created by Andy on 16/6/7.
//  Copyright © 2016年 Andy. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface UIViewController (AndyScrollPageController)
/**
 *  所有子控制的父控制器, 方便在每个子控制页面直接获取到父控制器进行其他操作
 */
@property (nonatomic, weak, readonly) UIViewController *andy_scrollViewController;

@property (nonatomic, assign) NSInteger andy_currentIndex;




@end
