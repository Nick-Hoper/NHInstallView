//
//  HWInstallView.m
//  NHInstallView
//
//  Created by Nick luo on 2018/12/29.
//  Copyright © 2018 Nick. All rights reserved.
//

#import "NHInstallView.h"

#define KNHInstallViewMargin 10
#define KNHInstallViewColor [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]

@implementation NHInstallView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - KNHInstallViewMargin;
    
//    //背景遮罩
    [KNHInstallViewColor set];
//    CGFloat lineW = MAX(rect.size.width, rect.size.height) * 0.5;
//    CGContextSetLineWidth(context, lineW);
//    CGContextAddArc(context, xCenter, yCenter, radius + lineW * 0.5 + 5, 0, M_PI * 2, 1);
//    CGContextStrokePath(context);
//
    //进程圆
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, xCenter, yCenter);
    CGContextAddLineToPoint(context, xCenter, 0);
    CGFloat endAngle = - M_PI * 0.5 + _progress * M_PI * 2/30 + 0.001;
    CGContextAddArc(context, xCenter, yCenter, radius, - M_PI * 0.5, endAngle, 1);
    CGContextFillPath(context);
}

@end

