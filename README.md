# CoreGraphicsDemo

[![CI Status](https://img.shields.io/travis/zhangxieomeng1/CoreGraphicsDemo.svg?style=flat)](https://travis-ci.org/zhangxieomeng1/CoreGraphicsDemo)
[![Version](https://img.shields.io/cocoapods/v/CoreGraphicsDemo.svg?style=flat)](https://cocoapods.org/pods/CoreGraphicsDemo)
[![License](https://img.shields.io/cocoapods/l/CoreGraphicsDemo.svg?style=flat)](https://cocoapods.org/pods/CoreGraphicsDemo)
[![Platform](https://img.shields.io/cocoapods/p/CoreGraphicsDemo.svg?style=flat)](https://cocoapods.org/pods/CoreGraphicsDemo)


## 简书介绍
[CoreGraphics与UIBezierPath](https://www.jianshu.com/p/f0dd0f6ca98b)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## UIBezierPath对象
// 创建基本路径
+ (instancetype)bezierPath;
// 创建矩形路径
+ (instancetype)bezierPathWithRect:(CGRect)rect;
// 创建椭圆路径
+ (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
// 创建圆角矩形
+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
// 创建指定位置圆角的矩形路径
+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
// 创建弧线路径
+ (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
// 通过CGPath创建
+ (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;

//反方向绘制path
- (UIBezierPath *)bezierPathByReversingPath;
// 设置画笔起始点
- (void)moveToPoint:(CGPoint)point;
// 从当前点到指定点绘制直线
- (void)addLineToPoint:(CGPoint)point;
// 添加弧线
- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);
// center弧线圆心坐标 radius弧线半径 startAngle弧线起始角度 endAngle弧线结束角度 clockwise是否顺时针绘制
//添加贝塞尔曲线
- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
// endPoint终点 controlPoint控制点
- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
// endPoint终点 controlPoint1、controlPoint2控制点
// 移除所有的点，删除所有的subPath
- (void)removeAllPoints;
//填充
- (void)fill;
// 路径绘制
- (void)stroke;
//使用一条直线闭合路径的起点和终点, 该方法同时也会更新当前点到新直线的终点(即路径的起点)
//- (void)closePath


## CoreGraphics

- (void)drawRect:(CGRect)rect
{
/****************1、实心圆***********************/
//获取上下文
CGContextRef ctx = UIGraphicsGetCurrentContext();
//画图
CGContextAddEllipseInRect(ctx, CGRectMake(20, 20, 100, 100));
[[UIColor redColor] set];
//渲染
CGContextFillPath(ctx);

/****************2、空心圆***********************/
CGContextRef ctx1 = UIGraphicsGetCurrentContext();
CGContextAddEllipseInRect(ctx, CGRectMake(20, 200, 80, 100));
[[UIColor yellowColor] set];
//渲染
CGContextStrokePath(ctx1);

/****************3、直线***********************/
CGContextMoveToPoint(ctx1, 200, 200);
CGContextAddLineToPoint(ctx1, 300, 300);
[[UIColor redColor] set];
CGContextSetLineWidth(ctx1, 5);
CGContextSetLineCap(ctx1, kCGLineCapRound);// 起点和重点圆角
CGContextSetLineJoin(ctx1, kCGLineJoinRound);// 转角圆角
CGContextStrokePath(ctx1);//渲染（直线只能绘制空心的，不能调用CGContextFillPath(ctx);）
/****************4、三角形**********************/
CGContextMoveToPoint(ctx1, 250, 64);//第一个点
CGContextAddLineToPoint(ctx1,250, 300);//第二个点
CGContextAddLineToPoint(ctx1, 350, 380);//第三个点

[[UIColor greenColor] set];
CGContextClosePath(ctx1);//关闭曲线
CGContextStrokePath(ctx1);
/****************5、矩形**********************/
CGContextAddRect(ctx1, CGRectMake(150, 0, 40, 80));
[[UIColor orangeColor] set];
CGContextStrokePath(ctx1);
/***************6、弧线*********************/
CGContextAddArc(ctx1, 200, 170, 50, 0, M_PI/2, 1);
[[UIColor greenColor] set];
CGContextClosePath(ctx1);
CGContextFillPath(ctx1);

/****************7、文字**********************/
NSString *str = @"CoreGraphics的用法总结";
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
dict[NSForegroundColorAttributeName] = [UIColor yellowColor];
dict[NSFontAttributeName] = [UIFont systemFontOfSize:18];

[str drawInRect:CGRectMake(100, 80, 300, 300) withAttributes:dict];

/****************8、图片**********************/
UIImage *img = [UIImage imageNamed:@"配送验收hover"];
//[img drawAsPatternInRect:CGRectMake(20, 280, 300, 300)]; // 多个平铺
//[img drawAtPoint:CGPointMake(20, 280)]; // 绘制到指定点，图片有多大就显示多大
[img drawInRect:CGRectMake(150, 280, 85, 85)];// 拉伸

}


## Installation

CoreGraphicsDemo is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CoreGraphicsDemo'
```

## Author

zhangxieomeng1, zhangxiaomeng@xiangshang360.com

## License

CoreGraphicsDemo is available under the MIT license. See the LICENSE file for more info.
