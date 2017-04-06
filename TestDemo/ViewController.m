//
//  ViewController.m
//  TestDemo
//
//  Created by panhongliu on 2017/2/15.
//  Copyright © 2017年 panhongliu. All rights reserved.
//

#import "ViewController.h"

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "YQThread.h"
#import "Person+category.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *scrollview;
@property (strong, nonatomic) YQThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _thread=[[YQThread alloc]initWithTarget:self selector:@selector(testss) object:nil];
    [_thread start];
    
    NSLog(@"测试变化");
    NSLog(@"测试变化哈哈");

    Method m1=class_getClassMethod([Person class], @selector(run));
    Method m2=class_getClassMethod([Person class], @selector(study));
    method_exchangeImplementations(m1, m2);
   
    NSLog(@"----%s",class_getName([Person class]));
    
    Person *person=[[Person alloc]init];
    person.hello=@"hello";
    
    [person write];
    
    NSString *personss=[Person read].hello;
    
    person.good=@"good";

    [person write];

    NSString *goodsss=[Person read].good;

    NSLog(@"-===---%@\n%@",personss,goodsss);

    
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"OrderSource.plist"];
//    
//    [NSKeyedArchiver archiveRootObject:person toFile:path];
//    
//    //解档
//    
//        Person *personsss = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    
//    NSLog(@"------0000=====%@",personsss.hello);
    
    [Person run];
    [Person study];
    
    unsigned int  count=0;
    
  Ivar *classIvar=  class_copyIvarList([Person class], &count);
    
//    for (Ivar *ivarsss in classIvar) {
//        
//    }
    
    
    
    for (int i=0; i<count; i++) {
        
        Ivar *ivarName=&classIvar[i];
     const char *name=ivar_getName(*ivarName);
        const char *type = ivar_getTypeEncoding(*ivarName);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);

        
    }
    // 注意释放内存！
    free(classIvar);
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        NSLog(@"--------%zd", activity);
//    });
//    
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);  // 添加监听者，关键！
//    CFRelease(observer); // 释放
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)testss
{
    NSLog(@">>>>>%@",[NSThread currentThread]);
    
//    [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop]run];
 
   

    
}
- (IBAction)buttonPrintent:(id)sender {
    NSLog(@"一直测试");
//    NSLog(@"----%@", [NSRunLoop currentRunLoop]);
//
////    NSLog(@"====----%@", [NSRunLoop mainRunLoop]);
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [self performSelector:@selector(threadAgain) onThread:_thread withObject:nil waitUntilDone:NO];

    
//    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"hahaha"] afterDelay:2.0 inModes:@[NSRunLoopCommonModes]];
//

    
}
- (void)threadAgain
{
    NSLog(@"--%@--", [NSThread currentThread]);
}

-(void)setImage:(UIImage *)image
{
    
    
}
- (void)timerTest
{
    NSLog(@"timerTest----");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
