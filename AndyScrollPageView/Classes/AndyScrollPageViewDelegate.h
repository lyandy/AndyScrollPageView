//
//  AndyScrollPageViewDelegate.h
//  AndyScrollPageView
//
//  Created by Andy on 16/6/30.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AndyContentView;
@class AndyTitleView;
@class AndyCollectionView;
@protocol AndyScrollPageViewChildVcDelegate <NSObject>

@optional

/**
 * 请注意: 如果你希望所有的子控制器的view的系统生命周期方法被正确的调用
 * 请重写父控制器的'shouldAutomaticallyForwardAppearanceMethods'方法 并且返回NO
 * 当然如果你不做这个操作, 子控制器的生命周期方法将不会被正确的调用
 * 如果你仍然想利用子控制器的生命周期方法, 请使用'AndyScrollPageViewChildVcDelegate'提供的代理方法
 * 或者'AndyScrollPageViewDelegate'提供的代理方法
 */
- (void)zj_viewWillAppearForIndex:(NSInteger)index;
- (void)zj_viewDidAppearForIndex:(NSInteger)index;
- (void)zj_viewWillDisappearForIndex:(NSInteger)index;
- (void)zj_viewDidDisappearForIndex:(NSInteger)index;

- (void)zj_viewDidLoadForIndex:(NSInteger)index;

@end


@protocol AndyScrollPageViewDelegate <NSObject>
/** 将要显示的子页面的总数 */
- (NSInteger)numberOfChildViewControllers;

/** 获取到将要显示的页面的控制器
 * -reuseViewController : 这个是返回给你的controller, 你应该首先判断这个是否为nil, 如果为nil 创建对应的控制器并返回, 如果不为nil直接使用并返回
 * -index : 对应的下标
 */
- (UIViewController<AndyScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<AndyScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index;

@optional

/**
 *  这是用于页面切换统计是点击还是滚动
 
 */

- (void)scrollPageForStatisticsWithController:(UIViewController *)scrollPageController childViewControllDidAppear:(UIViewController *)childViewController forIndex:(NSInteger)index isTitleClicked:(BOOL)isTitleClicked;

- (BOOL)scrollPageController:(UIViewController *)scrollPageController contentScrollView:(AndyCollectionView *)scrollView shouldBeginPanGesture:(UIPanGestureRecognizer *)panGesture;

- (void)setUpTitleView:(AndyTitleView *)titleView forIndex:(NSInteger)index;

/**
 *  页面将要出现

 */
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllWillAppear:(UIViewController *)childViewController forIndex:(NSInteger)index;
/**
 *  页面已经出现
 *
 */
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidAppear:(UIViewController *)childViewController forIndex:(NSInteger)index;

- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllWillDisappear:(UIViewController *)childViewController forIndex:(NSInteger)index;
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidDisappear:(UIViewController *)childViewController forIndex:(NSInteger)index;
/**
 *  页面添加到父视图时，在父视图中显示的位置
 *  @param  containerView   childController 的 self.view 父视图
 *  @return 返回最终显示的位置
 */
- (CGRect)frameOfChildControllerForContainer:(UIView *)containerView;
@end

