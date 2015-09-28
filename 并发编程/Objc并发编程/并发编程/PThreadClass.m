//
//  PThreadClass.m
//  并发编程
//
//  Created by wangjiangjiao on 15/9/20.
//  Copyright (c) 2015年 wangjiangjiao. All rights reserved.
//

#import "PThreadClass.h"
#import <pthread.h>

@implementation PThreadClass

struct threadInfo{
    uint32_t * inputValues;
    size_t count;
};

struct threadResult{
    uint32_t min;
    uint32_t max;
};

void * findMinAndMax(void * arg)
{
    struct threadInfo const * const info = (struct threadInfo *)arg;
    uint32_t min = UINT32_MAX;
    uint32_t max = 0;
    for (size_t i = 0; i < info ->count ; ++i) {
        uint32_t v = info-> inputValues[i];
        min = MIN(min, v);
        max = MAX(max, v);
    }
    
    
    free(arg);
    struct threadResult * result = (struct threadResult *) malloc(sizeof(*result));
    result->min = min;
    result->max = max;
    return result;
}


- (void)threadOperation
{
    
    CFAbsoluteTime startTime =  CFAbsoluteTimeGetCurrent();
    
    size_t const count = 1000000;
    uint32_t intputValues[count];
    
    //使用随机数字填充
    for (size_t i = 0; i < count; i++) {
        intputValues[i] = arc4random();
    }
    
    //开始4个寻找最小和最大的线程
    size_t const threadCount = 4;
    pthread_t tid[threadCount];
    for (size_t i = 0; i < threadCount; i++) {
        struct threadInfo * const info = (struct threadInfo *)malloc(sizeof(*info));
        size_t offset = (count / threadCount)* i;
        info->inputValues = intputValues + offset;
        info->count = MIN(count - offset, count/threadCount);
        int err = pthread_create(tid + i, NULL, &findMinAndMax, info);
        NSCAssert(err == 0, @"pthread_create() failed:%d",err);
    }
    
    //等待线程退出
    struct threadResult * result[threadCount];
    for (size_t i = 0; i < threadCount; i++) {
        int err = pthread_join(tid[i], (void **)&result[i]);
        NSCAssert(err == 0, @"pthread_join() failed:%d",err);

    }
    
    //寻找min和max
    uint32_t min = UINT32_MAX;
    uint32_t max = 0;
    for (size_t i = 0; i < threadCount; i++) {
        min = MIN(min, result[i] ->min);
        max = MAX(max, result[i] ->max);
        free(result[i]);
        result[i] = NULL;
    }
    
    NSLog(@"min = %u",min);
    NSLog(@"max = %u",max);
    CFAbsoluteTime endTime =  CFAbsoluteTimeGetCurrent();

    NSLog(@"花费的time:%f",endTime - startTime);//0.028025左右sec
}



- (void)nonThreadOperation
{
    CFAbsoluteTime startTime =  CFAbsoluteTimeGetCurrent();
    
    size_t const count = 1000000;
    uint32_t intputValues[count];
    
    //使用随机数字填充
    for (size_t i = 0; i < count; i++) {
        intputValues[i] = arc4random();
    }
    
    //开始1个寻找最小和最大的线程
    size_t const threadCount = 1;
    pthread_t tid[threadCount];
    for (size_t i = 0; i < threadCount; i++) {
        struct threadInfo * const info = (struct threadInfo *)malloc(sizeof(*info));
        size_t offset = (count / threadCount)* i;
        info->inputValues = intputValues + offset;
        info->count = MIN(count - offset, count/threadCount);
        int err = pthread_create(tid + i, NULL, &findMinAndMax, info);
        NSCAssert(err == 0, @"pthread_create() failed:%d",err);
    }
    
    //等待线程退出
    struct threadResult * result[threadCount];
    for (size_t i = 0; i < threadCount; i++) {
        int err = pthread_join(tid[i], (void **)&result[i]);
        NSCAssert(err == 0, @"pthread_join() failed:%d",err);
        
    }
    
    //寻找min和max
    uint32_t min = UINT32_MAX;
    uint32_t max = 0;
    for (size_t i = 0; i < threadCount; i++) {
        min = MIN(min, result[i] ->min);
        max = MAX(max, result[i] ->max);
        free(result[i]);
        result[i] = NULL;
    }
    
    NSLog(@"min = %u",min);
    NSLog(@"max = %u",max);
    CFAbsoluteTime endTime =  CFAbsoluteTimeGetCurrent();
    
    NSLog(@"花费的time:%f",endTime - startTime);//0.031587左右
}

@end
