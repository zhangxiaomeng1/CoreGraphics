//
//  XMView.m
//  XM_Mediator_Example
//
//  Created by zhangxiaomeng on 2018/4/25.
//  Copyright © 2018年 zhangxieomeng1. All rights reserved.
//

#import "XMView.h"

#import <objc/runtime.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

CGPoint pointArray[5];// 获取我们滑动手指时的五个点，用来做三次贝塞尔曲线
NSInteger pointIndex;// 点的下标

@interface XMView()

@property (nonatomic, strong) NSString *age;
@property (strong, nonatomic) UIBezierPath *bezierPath;

@end

@implementation XMView

//- (instancetype)initWithFrame:(CGRect)frame{
//
//    if (self = [super initWithFrame:frame]) {
//        _age = @"20";
//    }
//    return self;
//}

//- (void) drawRect:(CGRect)rect {
//
//    // 1. 随便画一个路径出来.
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint: CGPointMake(10, 10)];
//    [path addLineToPoint: CGPointMake(80, 40)];
//    [path addLineToPoint: CGPointMake( 40,  80)];
//    [path addLineToPoint: CGPointMake(40, 40)];
//    path.lineWidth = 3;
//
//    // 2. 为这条路径制作一个反转路径
//    UIBezierPath *reversingPath = [path bezierPathByReversingPath];
//    reversingPath.lineWidth = 3;
//
//    // 3. 为了避免两条路径混淆在一起, 我们为第一条路径做一个位移
//    CGAffineTransform transform = CGAffineTransformMakeTranslation(200, 0);
//    [path applyTransform: transform];
//
//    // 4. 两条路径分别添加一条直接到 self.center
//    [path addLineToPoint: CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5)];
//    [reversingPath addLineToPoint: CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5)];
//
//    // 5. 设置颜色, 并绘制路径
//    [[UIColor redColor] set];
//    [path stroke];
//
//    [[UIColor greenColor] set];
//    [reversingPath stroke];
//}
//- (void) drawRect:(CGRect)rect {

//    // 1. 先创建三条路径, 有对比更有助于理解
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint: CGPointMake(0, 40)];
//    [path addLineToPoint: CGPointMake(self.frame.size.width, 40)];
//    path.lineWidth = 2;
//
//    // 2.  这部分是配置三条路径虚线的规格, 重点主要是这部分.
//    CGFloat dashLineConfig[] = {8.0, 4.0};
//    [path setLineDash: dashLineConfig
//                count: 2
//                phase: 0];
//
//    // 3. 绘制
//    [[UIColor orangeColor] set];
//    [path stroke];

    
    
//    UIColor *color = [UIColor redColor];
//    [color set];//设置线条颜色
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
//    aPath.lineWidth = 5.0;
//    aPath.lineCapStyle = kCGLineCapRound;//线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound;//终点处理
//    [aPath moveToPoint:CGPointMake(20, 100)];
//    [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];
//    [aPath addQuadCurveToPoint:CGPointMake(180, 200) controlPoint:CGPointMake(80, 0)];
//
//    [aPath stroke];

//    // 1. 获取当前控件的图形上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    // 2. 描述绘画图形内容
//    // a. 创建图形起始点
//    CGContextMoveToPoint(context, 0, 0);
//    // b. 添加控制点和终点,控制点(300,200)，终点(0,250)
//    CGContextAddQuadCurveToPoint(context, 300, 50, 0, 100);
//    // 3. 设置图形上下文状态
//    // 设置颜色
//    [[UIColor redColor] set];
//    // 设置线宽
//    CGContextSetLineWidth(context, 10);
//    // 4. 渲染图形上下文
//    CGContextStrokePath(context);
//
//
//    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
//    [[UIColor redColor] setStroke];
//    bezierPath.lineWidth = 11;
//    bezierPath.lineCapStyle = kCGLineCapButt;
//    bezierPath.lineJoinStyle = kCGLineJoinRound;
//    [bezierPath moveToPoint:CGPointMake(100, 100)];
//    [bezierPath addLineToPoint:CGPointMake(200, 100)];
//    [bezierPath stroke];
    
    // 画圆
//    UIBezierPath *bezierPath2 = [[UIBezierPath alloc] init];
//    [[UIColor redColor] setStroke];
////    [bezierPath2 moveToPoint:CGPointMake(150, 250)];
//    bezierPath2.lineCapStyle = kCGLineCapSquare;
//    [bezierPath2 addArcWithCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    [bezierPath2 stroke];
//
//    UIBezierPath *bezierPath3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(110, 100) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
//    [[UIColor orangeColor] setFill];
//    [bezierPath3 fill];
    
//    // 画矩形
//    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
//    [[UIColor redColor] setStroke];
//    bezierPath.lineWidth = 11;
//    bezierPath.lineCapStyle = kCGLineCapButt;
//    bezierPath.lineJoinStyle = kCGLineJoinRound;
//    [bezierPath moveToPoint:CGPointMake(100, 100)];
//    [bezierPath addLineToPoint:CGPointMake(200, 100)];
//    [bezierPath addLineToPoint:CGPointMake(200, 200)];
//    [bezierPath addLineToPoint:CGPointMake(100, 200)];
//    [bezierPath closePath];// 或者[bezierPath addLineToPoint:CGPointMake(100, 100)];
//    [bezierPath stroke];
 
    
//    UIBezierPath *bezierPath3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    [[UIColor redColor] setStroke];
//    bezierPath3.lineWidth = 11;
//    CGFloat pattern3[] = {1, 10};
//    [bezierPath3 setLineDash:pattern3 count:2 phase:0];
//    [bezierPath3 stroke];
//
//
//
//}


//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [super drawRect:rect];
//}
//
//- (instancetype)init{
//    if (self = [super init]) {
//        NSLog(@"===%@",NSStringFromClass([self class]));
//        NSLog(@"===%@",NSStringFromClass([super class]));
//    }
//    return self;
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super initWithCoder:aDecoder]) {
//
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//
//    }
//    return self;
//}
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//- (void)layoutSubviews{
//    [super layoutSubviews];
//
//}

//- (void)initWithdate {
//
//    // Initialization code
//}
//void aaa(id self, SEL _cmd, NSNumber *meter) {
//    
//    NSLog(@"跑了%@米", meter);
//    
//}
//
//// 任何方法默认都有两个隐式参数,self,_cmd（当前方法的方法编号）
//
//// 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
//
//// 作用:动态添加方法,处理未实现
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//
//{
//    
//    // [NSStringFromSelector(sel) isEqualToString:@"run"];
//    
//    if (sel == NSSelectorFromString(@"run:")) {
//        
//        // 动态添加run方法
//        
//        // class: 给哪个类添加方法
//        
//        // SEL: 添加哪个方法，即添加方法的方法编号
//        
//        // IMP: 方法实现 => 函数 => 函数入口 => 函数名（添加方法的函数实现（函数地址））
//        
//        // type: 方法类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
//        
//        class_addMethod(self, sel, (IMP)aaa, "v@:@");
//        
//        return YES;
//        
//    }
//    
//    return [super resolveInstanceMethod:sel];
//    
//}

//// 手指移动就会调用这个方法
//// 这个方法调用非常频繁
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    // 想让控件随着手指移动而移动,监听手指移动
//    // 获取UITouch对象
//    UITouch *touch = [touches anyObject];
//    // 获取当前点的位置
//    CGPoint curP = [touch locationInView:self];
//    // 获取上一个点的位置
//    CGPoint preP = [touch previousLocationInView:self];
//    // 获取它们x轴的偏移量,每次都是相对上一次
//    CGFloat offsetX = curP.x - preP.x;
//    // 获取y轴的偏移量
//    CGFloat offsetY = curP.y - preP.y;
//    // 修改控件的形变或者frame,center,就可以控制控件的位置
//    // 形变也是相对上一次形变(平移)
//    // CGAffineTransformMakeTranslation:会把之前形变给清空,重新开始设置形变参数
//    // make:相对于最原始的位置形变
//    // CGAffineTransform t:相对这个t的形变的基础上再去形变
//    // 如果相对哪个形变再次形变,就传入它的形变
//    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
//    NSLog(@"哎呀，不要拽人家！");
//}
//// 开始触摸时就会调用一次这个方法
//
//// 手指离开屏幕时就会调用一次这个方法
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"手放开还能继续玩耍！");
//}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"hitTest");
//    UIView *view = [super hitTest:point withEvent:event];
////    if (view == self) {
////        return nil;
////    }
//
//    for (int i = 0; i < self.subviews.count; ++i) {
//
////        NSLog(@"hitTest=%@",self.subviews[i]);
//
//    }
//
//
//    return self;
//
//}
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"鞍山市=%s", __PRETTY_FUNCTION__);
//    CGRect bounds = CGRectInset(self.bounds, -50, -50);
//    return CGRectContainsPoint(bounds, point);
//}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"摸我干啥！");
    UIViewController *VC = [[UIViewController alloc] init];
    [[self parentController].navigationController pushViewController:VC animated:YES];
}
-(UIViewController*)parentController{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.bezierPath = [[UIBezierPath alloc] init];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        panGesture.maximumNumberOfTouches = 1;// 一个指头画
        [self addGestureRecognizer:panGesture];
    }
    
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)panGesture {
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        
        pointIndex = 0;
        
        // 获取到第一个点
        CGPoint currentPoint = [panGesture locationInView:self];
        pointArray[0] = currentPoint;
        
        // 设置起始点
        [self.bezierPath moveToPoint:pointArray[0]];
    }else if (panGesture.state == UIGestureRecognizerStateChanged) {
        
        pointIndex ++;
        
        // 获取平移到的点
        CGPoint currentPoint = [panGesture locationInView:self];
        pointArray[pointIndex] = currentPoint;
        
        if (pointIndex <= 4) {// 获取够五个点了
            
            // 重新设置3点
            pointArray[3] = CGPointMake((pointArray[2].x + pointArray[4].x) / 2.0, (pointArray[2].y + pointArray[4].y) / 2.0);
            
            // 通过三次贝塞尔曲线而不是-addLineToPoint:连接平移的点，可以使得线条有更少的锯齿，更加平滑
            [self.bezierPath addCurveToPoint:pointArray[3] controlPoint1:pointArray[1] controlPoint2:pointArray[2]];
        }
        
        // 获取下一波的四个点
        pointIndex = 1;
        pointArray[0] = pointArray[3];
        pointArray[1] = pointArray[4];
    }
    
    // 触发-drawRect:方法
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    self.bezierPath.lineWidth = 1;// 笔的粗细

    // 笔的颜色
    [[UIColor redColor] setStroke];
    
    // 渲染出曲线
    [self.bezierPath stroke];
}
//- (void)drawRect:(CGRect)rect
//{
//    /****************1、实心圆***********************/
//    //获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //画图
//    CGContextAddEllipseInRect(ctx, CGRectMake(20, 20, 100, 100));
//    [[UIColor redColor] set];
//    //渲染
//    CGContextFillPath(ctx);
//
//    /****************2、空心圆***********************/
//    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(ctx, CGRectMake(20, 200, 80, 100));
//    [[UIColor yellowColor] set];
//    //渲染
//    CGContextStrokePath(ctx1);
//
//    /****************3、直线***********************/
//    CGContextMoveToPoint(ctx1, 200, 200);
//    CGContextAddLineToPoint(ctx1, 300, 300);
//    [[UIColor redColor] set];
//    CGContextSetLineWidth(ctx1, 5);
//    CGContextSetLineCap(ctx1, kCGLineCapRound);// 起点和重点圆角
//    CGContextSetLineJoin(ctx1, kCGLineJoinRound);// 转角圆角
//    CGContextStrokePath(ctx1);//渲染（直线只能绘制空心的，不能调用CGContextFillPath(ctx);）
//    /****************4、三角形**********************/
//    CGContextMoveToPoint(ctx1, 250, 64);//第一个点
//    CGContextAddLineToPoint(ctx1,250, 300);//第二个点
//    CGContextAddLineToPoint(ctx1, 350, 380);//第三个点
//
//    [[UIColor greenColor] set];
//    CGContextClosePath(ctx1);//关闭曲线
//    CGContextStrokePath(ctx1);
//    /****************5、矩形**********************/
//    CGContextAddRect(ctx1, CGRectMake(150, 0, 40, 80));
//    [[UIColor orangeColor] set];
//    CGContextStrokePath(ctx1);
//    /***************6、弧线*********************/
//    CGContextAddArc(ctx1, 200, 170, 50, 0, M_PI/2, 1);
//    [[UIColor greenColor] set];
//    CGContextClosePath(ctx1);
//    CGContextFillPath(ctx1);
//
//    /****************7、文字**********************/
//    NSString *str = @"CoreGraphics的用法总结";
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = [UIColor yellowColor];
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:18];
//
//    [str drawInRect:CGRectMake(100, 80, 300, 300) withAttributes:dict];
//
//    /****************8、图片**********************/
//    UIImage *img = [UIImage imageNamed:@"hover"];
//    [img drawAsPatternInRect:CGRectMake(20, 280, 300, 300)]; // 多个平铺
//    //[img drawAtPoint:CGPointMake(20, 280)]; // 绘制到指定点，图片有多大就显示多大
////    [img drawInRect:CGRectMake(0, 0, 85, 85)];// 拉伸
//
//}


@end

