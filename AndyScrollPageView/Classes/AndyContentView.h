//
//  AndyContentView.h
//  AndyScrollPageView
//
//  Created by Andy on 16/5/6.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyScrollPageViewDelegate.h"
#import "AndyCollectionView.h"
#import "AndyScrollSegmentView.h"
#import "UIViewController+AndyScrollPageController.h"

@interface AndyContentView : UIView

/** 必须设置代理和实现相关的方法*/
@property(weak, nonatomic)id<AndyScrollPageViewDelegate> delegate;
@property (strong, nonatomic, readonly) AndyCollectionView *collectionView;
// 当前控制器
@property (strong, nonatomic, readonly) UIViewController<AndyScrollPageViewChildVcDelegate> *currentChildVc;

/**初始化方法
 *
 */
- (instancetype)initWithFrame:(CGRect)frame segmentView:(AndyScrollSegmentView *)segmentView parentViewController:(UIViewController *)parentViewController delegate:(id<AndyScrollPageViewDelegate>) delegate;

/** 给外界可以设置ContentOffSet的方法 */
- (void)setContentOffSet:(CGPoint)offset animated:(BOOL)animated;
/** 给外界 重新加载内容的方法 */
- (void)reload;


@end
