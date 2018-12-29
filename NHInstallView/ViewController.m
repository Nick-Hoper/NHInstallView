//
//  ViewController.m
//  NHInstallView
//
//  Created by Nick luo on 2018/12/29.
//  Copyright © 2018 Nick. All rights reserved.
//

#import "ViewController.h"
#import "NHInstallView.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) NHInstallView *installView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建控件
    [self creatControl];
    
    //添加定时器
    [self addTimer];
}

- (void)creatControl{

    //加载安装效果
    NHInstallView *installView = [[NHInstallView alloc] initWithFrame:CGRectMake(120, 200, 50, 50)];
    [self.view addSubview:installView];
    self.installView = installView;
}

- (void)addTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction{
    _installView.progress += 1;
    if (_installView.progress >= 30) {
        // [self removeTimer];
        NSLog(@"完成");
    }
}

- (void)removeTimer{
    
    [_timer invalidate];
    _timer = nil;
}

@end
