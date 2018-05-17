//
//  XMViewController.m
//  CoreGraphicsDemo
//
//  Created by zhangxieomeng1 on 05/17/2018.
//  Copyright (c) 2018 zhangxieomeng1. All rights reserved.
//

#import "XMViewController.h"
//#import <XM_Mediator/XM_Mediator.h>
#import "XMView.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "NSObject+name.h"
#import "XMModel.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface XMViewController ()<UIGestureRecognizerDelegate,CAAnimationDelegate>


@property (nonatomic, copy,readonly) NSString *firstName;
@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *nann;
@property (nonatomic, strong) NSThread *thread;

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation XMViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self gesture];
    //    [self logViewHierarchy:self.view];
    
    XMModel *model = [[XMModel alloc] init];
    [model setValue:@"24" forKey:@"age"];
    
    NSLog(@"runtime动态添加属性age==%@",model);
    
    void (^blockName)(NSString *str) = ^(NSString * str) {
        NSLog(@"str==%@",str);
    };
    
    blockName(@"22222");
    
    XMView *vc = [[XMView alloc] init];
    vc.frame = CGRectMake(100, 100, 200, 200);
    //    vc.nextResponder = self.view;
    //    vc.userInteractionEnabled = NO;
    vc.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:vc];
    
    
    //    UIView *view2 = [[UIView alloc] init];
    //    view2.frame = CGRectMake(0, 0, 100, 100);
    //    view2.backgroundColor = [UIColor redColor];
    //    [vc addSubview:view2];
    //
    //    {
    //        UIView *view2 = [[UIView alloc] init];
    //        view2.frame = CGRectMake(0, 10, 50, 50);
    //        view2.backgroundColor = [UIColor redColor];
    //        [vc addSubview:view2];
    //    }
    
//    iOS 中间镂空效果的View
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    maskView.backgroundColor = [UIColor grayColor];
    maskView.alpha = 0.8;
    [self.view addSubview:maskView];
//
//    //贝塞尔曲线 画一个带有圆角的矩形
//    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, self.view.frame.size.width - 20, self.view.frame.size.height - 20) cornerRadius:15];
//    //贝塞尔曲线 画一个圆形
//    [bpath appendPath:[UIBezierPath bezierPathWithArcCenter:maskView.center radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
//    //创建一个CAShapeLayer 图层
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.path = bpath.CGPath;
//    //添加图层蒙板
//    maskView.layer.mask = shapeLayer;

    
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 20) cornerRadius:15];
    
    [bpath appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH/2, 150) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    // - bezierPathByReversingPath ,反方向绘制path
    [bpath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 350, SCREEN_WIDTH - 100, 100) cornerRadius:20] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bpath.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    maskView.layer.mask = shapeLayer;
    
    
    
    
    NSLog(@"%@ call",NSStringFromSelector(_cmd));

    
    
    
    
    
    
    class_addMethod([XMView class],
                    @selector(printPerson),
                    class_getMethodImplementation([XMViewController class], @selector(find)),
                    "v@:");
    
    
    [vc performSelector:@selector(printPerson)];
    
    // Person *p = [Person alloc];
    
    // 底层的实际写法
    
    // Person *p = [Person alloc];
    
    // 底层的实际写法
    
    
    //
    //    NSObject *objc = [[NSObject alloc] init];
    //
    //    objc.name = @"123";
    //
    //    NSLog(@"runtime动态添加属性name==%@",objc.name);
    
    
    //    NSLog(@"\n\n**************串行异步***************\n\n");
    //
    //    // 串行队列
    //    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    //
    //    // 同步执行
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"串行异步1   %@",[NSThread currentThread]);
    //        }
    //    });
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"串行异步2   %@",[NSThread currentThread]);
    //        }
    //    });
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"串行异步3   %@",[NSThread currentThread]);
    //        }
    //    });
    //NSLog(@"\n\n**************end***************\n\n");
    
    
    //    NSLog(@"\n\n**************并发异步***************\n\n");
    //
    //    // 并发队列
    //    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    //
    //    // 同步执行
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"并发异步1   %@",[NSThread currentThread]);
    //        }
    //    });
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"并发异步2   %@",[NSThread currentThread]);
    //        }
    //    });
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"并发异步3   %@",[NSThread currentThread]);
    //        }
    //    });
    //    NSLog(@"\n\n**************end***************\n\n");
    //    NSLog(@"\n\n**************主队列同步，放到主线程会死锁***************\n\n");
    
    //    // 主队列
    //    dispatch_queue_t queue = dispatch_get_main_queue();
    //
    //    dispatch_sync(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"主队列同步1   %@",[NSThread currentThread]);
    //        }
    //    });
    //    dispatch_sync(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"主队列同步2   %@",[NSThread currentThread]);
    //        }
    //    });
    //    dispatch_sync(queue, ^{
    //        for (int i = 0; i < 3; i++) {
    //            NSLog(@"主队列同步3   %@",[NSThread currentThread]);
    //        }
    //    });
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [XMModel semaphoreSync];
    
    //    UIViewController *vc = [[UIViewController alloc] init];
    //    CATransition *transition = [CATransition animation];
    //    transition.duration = 0.25;
    //    transition.type = kCATransitionFromTop;
    //    transition.subtype = kCATransitionFromRight;
    //
    //
    //    [vc.view.layer addAnimation:transition forKey:nil];
    //    vc.view.backgroundColor = [UIColor redColor];
    //
    //    [self.navigationController pushViewController:vc animated:YES];
    
    //    UIViewController *vc = [UIViewController new];
    //
    //    CATransition *transition = [CATransition animation];
    //
    //    transition.duration = 0.25;
    //
    //    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    //
    //    transition.type = @"pageCurl";
    //
    //    transition.subtype = kCATransitionFromRight;
    //    transition.delegate = self;
    //    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    //
    //    //隐藏跳转的页面的导航条：实质是PUSH，所以用POP 推出
    //
    //    [self.navigationController pushViewController:vc animated:NO];
    
}

- (void)logViewHierarchy:(UIView *)superView
{
    NSLog(@"===%@", superView);
    for (UIView *subview in superView.subviews)
    {
        [self logViewHierarchy:subview];
    }
}
- (void)gesture{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.backgroundColor = [UIColor redColor];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
    //    // 1.添加点击手势
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    //    // tap.numberOfTapsRequired = 2; // 要求双击才触发事件
    //    // tap.numberOfTouchesRequired = 2; // 要求两个手指同时触摸才触发事件
    //
    //    tap.delegate = self;
    //    // 将点击手势添加到imageView上
    //    [_imageView addGestureRecognizer:tap];
    //
    // 2.添加移动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_imageView addGestureRecognizer:pan];
    pan.delegate = self;
    
    //    // 3.添加缩放手势
    //    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    //    [_imageView addGestureRecognizer:pinch];
    //    pinch.delegate = self;
    //
    //    // 4.旋转手势
    //    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    //    [_imageView addGestureRecognizer:rotation];
    //    rotation.delegate = self;
    //
    //    // 5.轻扫手势
    //    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //    // 设置轻扫的方向
    //    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    //    [_imageView addGestureRecognizer:swipe];
    //    swipe.delegate = self;
    //
    //    // 添加长按手势
    //    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    //    //设置长按时间
    //    longPress.minimumPressDuration = 0.5;
    //    [_imageView addGestureRecognizer:longPress];
    //    longPress.delegate = self;
    
}
- (void)tap:(UITapGestureRecognizer *)tap {
    NSLog(@"tap---");
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    
    if (self.imageView.frame.origin.x < 0 || self.imageView.frame.origin.x > self.view.frame.size.width - 100) {
        
    }else{
        
    }
    // 获得移动手势在self.view上面的偏移量（x, y）
    CGPoint point = [pan translationInView:self.view];
    // 让图片视图随着手指移动
    pan.view.center = CGPointMake(pan.view.center.x + point.x, pan.view.center.y);
    // 重置手势获取的偏移量
    [pan setTranslation:CGPointZero inView:self.view];
    NSLog(@"pan-====%f==%f",point.x,self.imageView.frame.origin.x);
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    // 参数一：原来的transform
    // 参数二：水平方向缩放的倍数
    // 参数三：垂直方向缩放的倍数
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    // 重置缩放倍数
    pinch.scale = 1.0;
}

- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    // 重置角度
    rotation.rotation = 0;
}

- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    NSLog(@"swipe");
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    /*
     说明：长按手势的常用状态如下
     开始：UIGestureRecognizerStateBegan
     改变：UIGestureRecognizerStateChanged
     结束：UIGestureRecognizerStateEnded
     取消：UIGestureRecognizerStateCancelled
     失败：UIGestureRecognizerStateFailed
     */
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"longPress");
    }
}


// 设置同时可以有两个手势同时识别
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//
////    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadTest) object:nil];
////    [_thread start];
//
//
////    [self bubbleSortWithArray:[@[@"1",@"7",@"3",@"5"] mutableCopy]];
//
//
////    NSMutableArray * arr = @[@16,@1,@2,@9,@7,@12,@5,@3,@8,@13,@10].mutableCopy;
////    [self quickSortArray:arr leftIndex:0 rightIndex:arr.count-1];
////    NSLog(@"%@",arr);
//
////    NSArray *arr = @[@1,@20,@30,@45,@50,@55,@60,@66,@70];
////    NSInteger x = 55,min,max,mid;
////    min = 0;
////    max = arr.count - 1;
////    mid = (min + max) / 2;
////    for (int i = 0; i < arr.count; i++){
////        if ([arr[mid] integerValue] == x){
////            NSLog(@"查找次数为--->%d次",i);
////            NSLog(@"寻找值位置为--->%ld",(long)mid);
////            return;
////        }
////        else if ([arr[mid] integerValue] > x){
////            max = mid - 1;
////            mid = (min + max) / 2;
////        }
////        else if ([arr[mid] integerValue] < x){
////            min = mid + 1;
////            mid = (min + max) / 2;
////        }
////    }
//
//#define ColorWithHex(hex,alph)      [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:(alph)]
//#define ItemBeginColor ColorWithHex(0x539FFF, 1) //柱状图渐变开始颜色
//#define ItemEndColor   ColorWithHex(0xF657FB, 1) //柱状图渐变结束颜色
//
//#define ColorWithRGB(_R,_G,_B,_A)   [UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A]
//
//
//
////    83,159,255
////    246,87,251
//
//    for (int i = 0; i < 7; i++) {
//
//        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//        gradientLayer.frame = CGRectMake(20 + i * 12, 100, 12, 200);
////        gradientLayer.position = self.view.center;
////        [self.view.layer addSublayer:gradientLayer];
//        // 颜色分配
//
//        CGFloat width = 7 * 12 + 6*30;
//        CGFloat dddd = i * (12 + 30) / width;
//        CGFloat rrrrr = (i * (12 + 30)  + 12)/ width;
//
//
//        gradientLayer.colors = @[
//                                 (__bridge id)[self quickSortArray:dddd].CGColor,
//                                 (__bridge id)[self quickSortArray:rrrrr].CGColor
//                                 ];
//        // 颜色分割线
//        gradientLayer.locations = @[@0, @1];
//        // 起始点
//        gradientLayer.startPoint = CGPointMake(0, 0);
//        // 结束点
//        gradientLayer.endPoint = CGPointMake(1, 0);
//
//        [self.view.layer addSublayer:gradientLayer];
//    }
//}
//- (UIColor *)quickSortArray:(CGFloat)aaaa{
//    CGFloat rrr = (246 - 83) *aaaa + 83;
//    CGFloat ggg = (87 - 159) *aaaa + 159;
//    CGFloat bbb = (251 - 255) *aaaa + 255;
//
//    return ColorWithRGB(rrr, ggg, bbb, 1);
//}


- (void)quickSortArray:(NSMutableArray *)array
             leftIndex:(NSInteger)left
            rightIndex:(NSInteger)right {
    if (left > right) {
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    //记录基准数 pivoty
    NSInteger key = [array[i] integerValue];
    while (i < j) {
        //首先从右边j开始查找(从最右边往左找)比基准数(key)小的值<---
        while (i < j && key <= [array[j] integerValue]) {
            j--;
        }
        //如果从右边j开始查找的值[array[j] integerValue]比基准数小，则将查找的小值调换到i的位置
        if (i < j) {
            array[i] = array[j];
        }
        
        //从i的右边往右查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 --->
        while (i < j && [array[i] integerValue] <= key) {
            i++;
        }
        //如果从i的右边往右查找的值[array[i] integerValue]比基准数大，则将查找的大值调换到j的位置
        if (i < j) {
            array[j] = array[i];
        }
    }
    //将基准数放到正确的位置，----改变的是基准值的位置(数组下标)---
    array[i] = @(key);
    //递归排序
    //将i左边的数重新排序
    [self quickSortArray:array leftIndex:left rightIndex:i - 1];
    //将i右边的数重新排序
    [self quickSortArray:array leftIndex:i + 1 rightIndex:right];
    
}
- (void)threadTest
{
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TimerTest) userInfo:nil repeats:YES];
    while (1) {
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"++++++++");
    }
}

- (void)TimerTest
{
    NSLog(@"----%@-----", [NSThread currentThread]);
}
- (void)bubbleSortWithArray:(NSMutableArray *)array {
    for (int i = 0; i < array.count - 1; i++) {
        //外层for循环控制循环次数
        for (int j = 0; j < array.count - 1 - i; j++) {
            //内层for循环控制交换次数
            if ([array[j] integerValue] > [array[j + 1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    NSLog(@"%@",array);
}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadTest) object:nil];
//    [_thread start];
//}
//
//- (void)threadTest
//{
//    NSLog(@"--%@--", [NSThread currentThread]);
//    while (1) {
//        [[NSRunLoop currentRunLoop] run];
//        NSLog(@"++++++++");
//    }
//}
////- (void)threadTest
////{
////    NSLog(@"--%@--", [NSThread currentThread]);
////    [[NSRunLoop currentRunLoop] run];
////    NSLog(@"++++++++");
////}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self performSelector:@selector(threadAgain) onThread:_thread withObject:nil waitUntilDone:NO];
//}
//
//- (void)threadAgain
//{
//    NSLog(@"--%@--", [NSThread currentThread]);
//}


//- (void)dealloc{
//
////    [super dealloc];
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    @autoreleasepool{
//
//    }
//    XMView *vc = [[XMView alloc] init];
////
//    vc.frame = CGRectMake(100, 100, 200, 200);
////    XMView *vc = [[XMView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//
//    self.view.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:vc];
//
////    [vc run];
////    [vc performSelector:@selector(run:) withObject:@10];
//
//    class_addMethod([XMView class],
//                    @selector(printPerson),
//                    class_getMethodImplementation([XMViewController class], @selector(find)),
//                    "v@:");
//
//
//    [vc performSelector:@selector(printPerson)];
//
//
//
//
//
//
//
//
//
//    //串行队列
//    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue.ys.com", DISPATCH_QUEUE_SERIAL);
//    //并行队列
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue.ys.com", DISPATCH_QUEUE_CONCURRENT);
////    dispatch_sync(serialQueue, ^{
////        NSLog(@"1========%@",[NSThread currentThread]);
////        //[self nslogCount:10000 number:1];
////    });
////    dispatch_sync(serialQueue, ^{
////        NSLog(@"2========%@",[NSThread currentThread]);
////        //[self nslogCount:10000 number:2];
////    });
////    dispatch_sync(serialQueue, ^{
////        NSLog(@"3========%@",[NSThread currentThread]);
////        //[self nslogCount:10000 number:3];
////    });
////    NSLog(@"4========%@",[NSThread currentThread]);
//
////     dispatch_async(serialQueue, ^{
////                NSLog(@"1========%@",[NSThread currentThread]);
////                //[self nslogCount:10000 number:1];
////            });
////        dispatch_async(serialQueue, ^{
////                NSLog(@"2========%@",[NSThread currentThread]);
////                //[self nslogCount:10000 number:2];
////            });
////        dispatch_async(serialQueue, ^{
////                NSLog(@"3========%@",[NSThread currentThread]);
////                //[self nslogCount:10000 number:3];
////            });
////        NSLog(@"4========%@",[NSThread currentThread]);
//
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 100, 100);
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
//    [btn addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
//    [btn addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//
////    NSLog(@"===%@",[NSRunLoop currentRunLoop]);
//
//
//}
//- (void)test1 {
//    NSLog(@"1");
//}
//- (void)test2 {
//    NSLog(@"2！");
//}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
////    NSUInteger first = [_firstName hash];
////
////    _firstName = @"123";
////    NSLog(@"===%lu==%@==%@",(unsigned long)first,_firstName,self.firstName);
//
////    Ivar *ivar = class_copyIvarList([self.xiaoming class], &count);
//
////    NSLog(@"1========%@",[NSThread currentThread]);
////    dispatch_sync(dispatch_get_main_queue(), ^{
////        NSLog(@"2========%@",[NSThread currentThread]);
////    });
////    NSLog(@"3========%@",[NSThread currentThread]);
////
////    NSLog(@"1========%@",[NSThread currentThread]);
////    dispatch_async(dispatch_get_main_queue(), ^{
////        NSLog(@"2========%@",[NSThread currentThread]);
////    });
////    NSLog(@"3========%@",[NSThread currentThread]);
//
////    NSArray *sd = @[@"1",@"2"];
////
////    NSString * str = sd[2];
////    NSLog(@"===%@",[NSRunLoop currentRunLoop]);
//
////    NSLog(@"\n\n************** GCD快速迭代 ***************\n\n");
////
////    // 并发队列
////    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
////
////    // dispatch_apply几乎同时遍历多个数字
////    dispatch_apply(7, queue, ^(size_t index) {
////        NSLog(@"dispatch_apply：%zd======%@",index, [NSThread currentThread]);
////    });
////    [self testGroup];
//}
//
//- (void)testGroup {
////    dispatch_group_t group =  dispatch_group_create();
////
////    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
////        NSLog(@"队列组：有一个耗时操作完成！");
////    });
////
////    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
////        NSLog(@"队列组：有一个耗时操作完成！");
////    });
////
////    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
////        NSLog(@"队列组：前面的耗时操作都完成了，回到主线程进行相关操作");
////    });
//
//    dispatch_group_t group1 = dispatch_group_create();
//
//    dispatch_group_async(group1, dispatch_get_global_queue(0, 0), ^{
//                NSLog(@"队列组：有一个耗时操作完成！");
//
//    });
//
//    dispatch_group_async(group1, dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"队列组：有一个耗时操作完成！");
//    });
//
//    dispatch_group_notify(group1, dispatch_get_main_queue(), ^{
//        NSLog(@"队列组：前面的耗时操作都完成了，回到主线程进行相关操作");
//    });
//}
//
//
//
//- (void)testAddDependency {
//
//    // 并发队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//    // 操作1
//    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"operation1======%@", [NSThread  currentThread]);
//        }
//    }];
//
//    // 操作2
//    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"****operation2依赖于operation1，只有当operation1执行完毕，operation2才会执行****");
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"operation2======%@", [NSThread  currentThread]);
//        }
//    }];
//
//    // 使操作2依赖于操作1
//    [operation2 addDependency:operation1];
//
//    // 把操作加入队列
//    [queue addOperation:operation1];
//    [queue addOperation:operation2];
//}
///** 串行同步 */
//- (void)syncSerial {
//
//    NSLog(@"\n\n**************串行同步***************\n\n");
//
//    // 串行队列
//    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//
//    // 同步执行
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"串行同步1   %@",[NSThread currentThread]);
//        }
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"串行同步2   %@",[NSThread currentThread]);
//        }
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"串行同步3   %@",[NSThread currentThread]);
//        }
//    });
//}
//
//-(void)answer{
//
//    unsigned int count = 0;
//
//    Ivar *ivar = class_copyIvarList([self class], &count);
//
//    NSLog(@"count==%u",count);
//
//    for (int i = 0; i < count; i++) {
//
//        Ivar var = ivar[i];
//
//        const char *varName = ivar_getName(var);
//
//        NSString *name = [NSString stringWithUTF8String:varName];
//
//        if ([name isEqualToString:@"_age"]) {
//
//            object_setIvar(self, var, @"20");
//
//            break;
//
//        }
//
//    }
//
//    NSLog(@"XiaoMing's age is %@",self.age);
//
//}
//
//
//
//
- (void)find {
    
    // Initialization code
    
    NSLog(@"=搜索==123==");
    
}
@end
