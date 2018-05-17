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

@interface XMModel()

@property (nonatomic, strong) NSString *age;

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


              

              
@end
