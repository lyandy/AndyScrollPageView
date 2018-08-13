//
//  ZJScrollView.h
//  AndyScrollPageView
//
//  Created by Andy on 16/10/24.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AndyCollectionView : UICollectionView

typedef BOOL(^AndyScrollViewShouldBeginPanGestureHandler)(AndyCollectionView *collectionView, UIPanGestureRecognizer *panGesture);

- (void)setupScrollViewShouldBeginPanGestureHandler:(AndyScrollViewShouldBeginPanGestureHandler)gestureBeginHandler;

@end
