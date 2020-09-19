//
//  ViewController.m
//  GCD
//
//  Created by 古智鹏 on 2020/9/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    
    dispatch_queue_t concurrentDispatchQueue = dispatch_queue_create("com.a.currentQueue", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(concurrentDispatchQueue, ^{
//
//    });
//
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.gcd.setTargetQueue.serialQueue", NULL);
//
//    //优先级不变的串行队列（参照），初始是默认优先级
    dispatch_queue_t serialDefaultQueue = dispatch_queue_create("com.gcd.setTargetQueue.serialDefaultQueue", NULL);
//
//    //变更前
//    dispatch_async(serialQueue, ^{
//        NSLog(@"1");
//    });
//    dispatch_async(serialDefaultQueue, ^{
//        NSLog(@"2");
//    });
//
//    //获取优先级为后台优先级的全局队列
//    dispatch_queue_t globalDefaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    //变更优先级
//    dispatch_set_target_queue(serialQueue, globalDefaultQueue);
//
//    //变更后
//    dispatch_async(serialQueue, ^{
//        NSLog(@"1");
//    });
//    dispatch_async(serialDefaultQueue, ^{
//        NSLog(@"2");
//    });
//
    // Do any additional setup after loading the view.
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"block0");
//    });
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"block1");
//
//    });
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"block2");
//    });
//
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//
//
//
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"完成");
//    });
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//    dispatch_apply(10, concurrentDispatchQueue, ^(size_t index) {
//        NSLog(@"%zu", index);
//    });
//
//    NSLog(@"done");
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_DATA_DESTRUCTOR_DEFAULT, 0);
//
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//
//
//
//
//
//    for (int i = 0; i < 100000; ++i) {
//        dispatch_async(queue, ^{
//
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//            [array addObject: [NSNumber numberWithInt: i]];
//
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_DATA_DESTRUCTOR_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"任务1:%@", [NSThread currentThread]);
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    dispatch_async(queue, ^{
        NSLog(@"任务2:%@", [NSThread currentThread]);
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务3:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务4:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务5:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务6:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sem);
    });
    
//    ，同步和异步决定了是否开启新线程（或者说是否具有开启新线程的能力），串行和并发决定了任务的执行方式——串行执行还是并发执行（或者说开启多少条新线程）
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
//
//    dispatch_queue_t queue = dispatch_get_main_queue();
//
//    dispatch_async(queue, ^{
//        NSLog(@"任务1:%@", [NSThread currentThread]);
//    });
//
//    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//
//    dispatch_async(queue, ^{
//        NSLog(@"任务2:%@", [NSThread currentThread]);
//    });
//
//    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"任务3:%@",[NSThread currentThread]);
//    });
    
    
    //随机使用信号量
    
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue = dispatch_queue_create("同步队列",  DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_group_async(group, queue, ^{
//        dispatch_semaphore_t sem = dispatch_semaphore_create(1);
//        NSLog(@"任务一开始：");
//        dispatch_async(queue, ^{
//            NSLog(@"任务一结束");
//            dispatch_semaphore_signal(sem);
//        });
//        dispatch_group_wait(sem, DISPATCH_TIME_FOREVER);
//    });
//
//    dispatch_group_async(group, queue, ^{
//        dispatch_semaphore_t sem = dispatch_semaphore_create(1);
//        NSLog(@"任务二开始：");
//        dispatch_async(queue, ^{
//            NSLog(@"任务二结束");
//            dispatch_semaphore_signal(sem);
//        });
//        dispatch_group_wait(sem, DISPATCH_TIME_FOREVER);
//    });
//
//    dispatch_group_async(group, queue, ^{
//        dispatch_semaphore_t sem = dispatch_semaphore_create(1);
//        NSLog(@"任务三开始：");
//        dispatch_async(queue, ^{
//            NSLog(@"任务三结束");
//            dispatch_semaphore_signal(sem);
//        });
//        dispatch_group_wait(sem, DISPATCH_TIME_FOREVER);
//    });
//
//    dispatch_group_async(group, queue, ^{
//        dispatch_semaphore_t sem = dispatch_semaphore_create(1);
//        NSLog(@"任务四开始：");
//        dispatch_async(queue, ^{
//            NSLog(@"任务四结束");
//            dispatch_semaphore_signal(sem);
//        });
//        dispatch_group_wait(sem, DISPATCH_TIME_FOREVER);
//    });
//
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"done");
//    });
    
}


@end
