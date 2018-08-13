//
//  AndyScrollPageView.m
//  AndyScrollPageView
//
//  Created by Andy on 16/5/6.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "AndyScrollPageView.h"
#import "UIView+Andy.h"

@interface AndyScrollPageView ()
@property (strong, nonatomic) AndySegmentStyle *segmentStyle;
@property (weak, nonatomic) AndyScrollSegmentView *segmentView;
@property (weak, nonatomic) AndyContentView *contentView;

@property (weak, nonatomic) UIViewController *parentViewController;
@property (strong, nonatomic) NSArray *childVcs;
@property (strong, nonatomic) NSArray *titlesArray;

@end
@implementation AndyScrollPageView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame segmentStyle:(AndySegmentStyle *)segmentStyle titles:(NSArray<NSString *> *)titles parentViewController:(UIViewController *)parentViewController delegate:(id<AndyScrollPageViewDelegate>) delegate {
    if (self = [super initWithFrame:frame]) {
        self.segmentStyle = segmentStyle;
        self.delegate = delegate;
        self.parentViewController = parentViewController;
        self.titlesArray = titles.copy;
        [self commonInit];
        
        self.clipsToBounds = YES;
    }
    return self;
}


- (void)commonInit {
    
    // 触发懒加载
    self.segmentView.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    NSLog(@"ZJScrollPageView--销毁");
}

#pragma mark - public helper

/** 给外界设置选中的下标的方法 */
- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    [self.segmentView setSelectedIndex:selectedIndex animated:animated];
}

/**  给外界重新设置视图内容的标题的方法 */
- (void)reloadWithNewTitles:(NSArray<NSString *> *)newTitles {
    
    self.titlesArray = nil;
    self.titlesArray = newTitles.copy;
    
    [self.segmentView reloadTitlesWithNewTitles:self.titlesArray];
    [self.contentView reload];
}

- (void)updateWithNewTitles:(NSArray<NSString *> *)newTitles {
    self.titlesArray = nil;
    self.titlesArray = newTitles.copy;
    [self.segmentView updateTitlesWithNewTitles:self.titlesArray];
}


#pragma mark - getter ---- setter

- (AndyContentView *)contentView {
    if (!_contentView) {
        AndyContentView *content = [[AndyContentView alloc] initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.segmentView.frame), self.bounds.size.width, self.bounds.size.height - CGRectGetMaxY(self.segmentView.frame)) segmentView:self.segmentView parentViewController:self.parentViewController delegate:self.delegate];
        [self addSubview:content];
        _contentView = content;
    }
    
    return  _contentView;
}


- (AndyScrollSegmentView *)segmentView {
    if (!_segmentView) {
        __weak typeof(self) weakSelf = self;
        AndyScrollSegmentView *segment = [[AndyScrollSegmentView alloc] initWithFrame:CGRectMake(0, 0, (self.segmentStyle.segmentViewWith ?: self.bounds.size.width), self.segmentStyle.segmentHeight) segmentStyle:self.segmentStyle delegate:self.delegate titles:self.titlesArray titleDidClick:^(AndyTitleView *titleView, NSInteger index) {
            
            [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0.0) animated:weakSelf.segmentStyle.isAnimatedContentViewWhenTitleClicked];
            
        }];
        [self addSubview:segment];
        _segmentView = segment;
    }
    return _segmentView;
}


- (NSArray *)childVcs {
    if (!_childVcs) {
        _childVcs = [NSArray array];
    }
    return _childVcs;
}

- (NSArray *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = [NSArray array];
    }
    return _titlesArray;
}

- (void)setExtraBtnOnClick:(ExtraBtnOnClick)extraBtnOnClick {
    _extraBtnOnClick = extraBtnOnClick;
    self.segmentView.extraBtnOnClick = extraBtnOnClick;
}

@end
