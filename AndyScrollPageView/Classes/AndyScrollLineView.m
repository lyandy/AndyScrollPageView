//
//  ScrollLineView.m
//  17xue
//
//  Created by Andy on 2018/8/2.
//  Copyright © 2018年 Andy. All rights reserved.
//

#import "AndyScrollLineView.h"
#import "UIColor+Andy.h"
#import "UIView+Andy.h"

@implementation AndyScrollLineView

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.clipsToBounds = NO;
        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self andy_drawShadowWithColor:[UIColor andy_colorWithHexString:[self.backgroundColor andy_hexString] alpha:0.5] edgeInset:UIEdgeInsetsMake(0, 0.0, -2.0f, 0) offset:CGSizeZero];
}

@end
