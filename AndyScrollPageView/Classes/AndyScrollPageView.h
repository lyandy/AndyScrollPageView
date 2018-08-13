//
//  AndyScrollPageView.h
//  AndyScrollPageView
//
//  Created by Andy on 16/5/6.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyContentView.h"
#import "AndyTitleView.h"


@interface AndyScrollPageView : UIView
typedef void(^ExtraBtnOnClick)(UIButton *extraBtn);

@property (copy, nonatomic) ExtraBtnOnClick extraBtnOnClick;
@property (weak, nonatomic, readonly) AndyContentView *contentView;
@property (weak, nonatomic, readonly) AndyScrollSegmentView *segmentView;

/** 必须设置代理并且实现相应的方法*/
@property(weak, nonatomic)id<AndyScrollPageViewDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame segmentStyle:(AndySegmentStyle *)segmentStyle titles:(NSArray<NSString *> *)titles parentViewController:(UIViewController *)parentViewController delegate:(id<AndyScrollPageViewDelegate>) delegate ;

/** 给外界设置选中的下标的方法 */
- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;

/**  给外界重新设置的标题的方法(同时会重新加载页面的内容) */
- (void)reloadWithNewTitles:(NSArray<NSString *> *)newTitles;

/**  给外界重新设置的标题的方法(同时会重新加载页面的内容) */
- (void)updateWithNewTitles:(NSArray<NSString *> *)newTitles;
@end
