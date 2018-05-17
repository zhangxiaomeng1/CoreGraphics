//
//  XMModel.m
//  XM_Mediator_Example
//
//  Created by zhangxiaomeng on 2018/4/25.
//  Copyright © 2018年 zhangxieomeng1. All rights reserved.
//

#import "XMModel.h"
#import <objc/runtime.h>

#define encodeRuntime \
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([self class], &count);\
for (int i = 0; i < count;i++){\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[encoder encodeObject:value forKey:key];\
}\
free(ivars);

#define initCoderRuntime \
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([self class], &count);\
for (int i = 0; i < count;i++){\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [decoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;
NSInteger ticketSurplusCount;
dispatch_semaphore_t semaphoreLock;
@interface XMModel()

@property (nonatomic, strong) NSString *age;
//@property (nonatomic, assign) NSInteger ticketSurplusCount;
@end

@implementation XMModel

//- (void)encodeWithCoder:(NSCoder *)aCoder
//
//{
//
//    [aCoder encodeObject:_movieId forKey:@"id"];
//
//    [aCoder encodeObject:_movieName forKey:@"name"];
//
//    [aCoder encodeObject:_pic_url forKey:@"url"];
//
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder
//
//{
//
//    if (self = [super init]) {
//
//        self.movieId = [aDecoder decodeObjectForKey:@"id"];
//
//        self.movieName = [aDecoder decodeObjectForKey:@"name"];
//
//        self.pic_url = [aDecoder decodeObjectForKey:@"url"];
//
//    }
//
//    return self;
//
//}

//编码
- (void)encodeWithCoder:(NSCoder *)encoder{
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([self class], &count);
//    for (int i = 0; i < count;i++){
//        // 取出i位置对应的成员变量
//        Ivar ivar = ivars[i];
//        // 查看成员变量
//        const char *name = ivar_getName(ivar);
//        // 归档
//        NSString *key = [NSString stringWithUTF8String:name];
//        id value = [self valueForKey:key];
//        [encoder encodeObject:value forKey:key];
//    }
//    free(ivars);
    encodeRuntime;
}

- (id)initWithCoder:(NSCoder *)decoder{
//    if (self = [super init]) {
//        unsigned int count = 0;
//        Ivar *ivars = class_copyIvarList([self class], &count);
//        for (int i = 0; i < count;i++){
//            // 取出i位置对应的成员变量
//            Ivar ivar = ivars[i];
//            // 查看成员变量
//            const char *name = ivar_getName(ivar);
//            // 归档
//            NSString *key = [NSString stringWithUTF8String:name];
//            id value = [decoder decodeObjectForKey:key];
//            // 设置到成员变量身上
//            [self setValue:value forKey:key];
//        }
//        free(ivars);
//    }
//    return self;
    initCoderRuntime;
}
+ (void)semaphoreSync
{
    NSLog(@"currentThread---%@",[NSThread currentThread]);// 打印当前线程NSLog(@"semaphore---begin");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block int number =0;
    dispatch_async(queue, ^{// 追加任务1
        [NSThread sleepForTimeInterval:2];
        // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);
        // 打印当前线程number =100;
          dispatch_semaphore_signal(semaphore);
        
        dispatch_async(queue, ^{// 追加任务1
            [NSThread sleepForTimeInterval:2];
            // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
            // 打印当前线程number =100;
              dispatch_semaphore_signal(semaphore);
            
              });
        
        dispatch_async(queue, ^{// 追加任务1
            [NSThread sleepForTimeInterval:2];
            // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
            // 打印当前线程number =100;
              dispatch_semaphore_signal(semaphore);
            
              });

          dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
          dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

        
          });
    
    
    NSLog(@"semaphore---end,number = %zd",number);
    
    [self initTicketStatusSave] ;
    
}
+ (void)initTicketStatusNotSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);// 打印当前线程NSLog(@"semaphore---begin");
    ticketSurplusCount =50;// queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);// queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    __weak typeof(self) weakSelf =self;
    dispatch_async(queue1, ^{
          [weakSelf saleTicketNotSafe];
        
          });
    dispatch_async(queue2, ^{
          [weakSelf saleTicketNotSafe];
        
          });
    
}
+ (void)saleTicketNotSafe {
    while(1) {
        if(ticketSurplusCount >0) {//如果还有票，继续售卖
            ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@",ticketSurplusCount, [NSThread currentThread]]);            [NSThread sleepForTimeInterval:0.2];
            
        }else{//如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
            
        }
        
    }
    
}
+ (void)initTicketStatusSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);// 打印当前线程
    NSLog(@"semaphore---begin");
    semaphoreLock = dispatch_semaphore_create(1);
    ticketSurplusCount =50;// queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);// queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    __weak typeof(self) weakSelf =self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketSafe];
    });
    dispatch_async(queue2, ^{
        [weakSelf saleTicketSafe];
    });
}

+ (void)saleTicketSafe {
    while(1) {// 相当于加锁
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        if(ticketSurplusCount >0) {//如果还有票，继续售卖
            ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@",ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        }else{//如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            // 相当于解锁
            dispatch_semaphore_signal(semaphoreLock);
            break;
            }
        // 相当于解锁
        dispatch_semaphore_signal(semaphoreLock);
    }
}


@end
