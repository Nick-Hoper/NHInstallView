# NHInstallView

>Object - C编写安装进度视图

![test.jpg](https://github.com/Nick-Hoper/NHInstallView/blob/master/test.jpg)


## Features

- 集成使用简单，二次开发扩展强大

## Requirements

- iOS 9+
- Xcode 9+
- Object-C
- iPhone

## Example

        //1、加载安装效果
        NHInstallView *installView = [[NHInstallView alloc] initWithFrame:CGRectMake(120, 200, 50, 50)];
        [self.view addSubview:installView];
        self.installView = installView;
        
        
        //2、增加定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

        //3、判断是否循环
        - (void)timerAction{
            _installView.progress += 1;
            if (_installView.progress >= 30) {
                // [self removeTimer];
                NSLog(@"完成");
            }
        }
        
        //4、销毁定时器
        - (void)removeTimer{
            [_timer invalidate];
            _timer = nil;
        }
        

更详细集成方法，根据实际的例子请查看源代码中的demo



