//
//  ViewController.m
//  CATransition
//
//  Created by apple on 2016/11/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic) int currentIndex;  //默认是0

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— 点击“下一张”按钮 —————
/**
 转场动画过渡效果：
 1、fade：交叉淡化过渡 kCATransitionFade；
 2、push：新视图把旧视图推出去 kCATransitionPush；
 3、moveIn：新视图移到旧视图上面 kCATransitionMoveIn；
 4、reveal：将旧视图移开，显示下面的新视图 kCATransitionReveal；
 5、cube：立方体翻滚效果；
 6、oglFlip：上下左右翻转效果；
 7、suckEffect：收缩效果，如一块布被抽走；
 8、rippleEffect：水滴效果；
 9、pageCurl：向上翻页效果；
 10、pageUnCurl：向下翻页效果；
 11、cameraIrisHollowOpen：相机镜头打开效果；
 12、cameraIrisHollowClose：相机镜头关闭效果。

 转场动画方向：
 1、kCATransitionFromRight；
 2、kCATransitionFromLeft；
 3、kCATransitionFromBottom；
 4、kCATransitionFromTop。
 */
- (IBAction)next:(id)sender
{
    self.currentIndex++;
    
    if (self.currentIndex == 9)
    {
        self.currentIndex = 0;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", self.currentIndex + 1];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    //创建转场动画
    CATransition *animation = [CATransition animation];
    
    //设置转场动画的类型
    animation.type = @"moveIn";
    
    //设置转场动画的方向
    animation.subtype = kCATransitionFromRight;
    
    //设置转场动画的持续时间
    animation.duration = 1;
    
    //设置转场动画的起点（在整体动画的百分比）
    animation.startProgress = 0.1;
    
    //设置转场动画的终点（在整体动画的百分比）
    animation.endProgress = 0.9;
    
    [self.imageView.layer addAnimation:animation forKey:nil];
}

#pragma mark ————— 点击“上一张”按钮 —————
- (IBAction)previous:(id)sender
{
    self.currentIndex--;
    
    if (self.currentIndex == -1)
    {
        self.currentIndex = 8;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", self.currentIndex + 1];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    CATransition *animation = [CATransition animation];
    animation.type = @"pageCurl";
    animation.subtype = kCATransitionFromLeft;
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:nil];
}

@end
