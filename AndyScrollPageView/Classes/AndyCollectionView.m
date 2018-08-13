//
//  AndyScrollPageView
//
//  Created by Andy on 16/10/24.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "AndyCollectionView.h"


@interface AndyCollectionView ()
@property (copy, nonatomic) AndyScrollViewShouldBeginPanGestureHandler gestureBeginHandler;
@end
@implementation AndyCollectionView

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (_gestureBeginHandler && gestureRecognizer == self.panGestureRecognizer) {
        return _gestureBeginHandler(self, (UIPanGestureRecognizer *)gestureRecognizer);
    }
    else {
        return [super gestureRecognizerShouldBegin:gestureRecognizer];
    }
}

- (void)setupScrollViewShouldBeginPanGestureHandler:(AndyScrollViewShouldBeginPanGestureHandler)gestureBeginHandler {
    _gestureBeginHandler = [gestureBeginHandler copy];
}

// 参考地址：https://www.cnblogs.com/lexingyu/p/3702742.html
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)gestureRecognizer;
        
        CGFloat transionX = [panGesture translationInView:panGesture.view].x;
        CGFloat locationX = [panGesture locationInView:panGesture.view].x;
//        NSLog(@"\r\nself.contentOffset.x %lf \r\ntransionX     %lf\r\nlocationX     %lf\r\n", self.contentOffset.x, transionX, locationX);
        if (self.contentOffset.x == 0 && transionX >= 0)
        {
            if (locationX <= 30)
            {
                return YES;
            }
            else
            {
//                NSLog(@"===== 探测到非边缘侧滑手势 阻止手势传递 \r\nlocationX     %lf\r\n", locationX);
                
                 return NO;
            }
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}

@end
