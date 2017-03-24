//
//  Person.m
//  TestDemo
//
//  Created by panhongliu on 2017/2/16.
//  Copyright © 2017年 panhongliu. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "NSObject+Extension.h"
@interface Person ()

@end

@implementation Person

+(Person *)sharePerson
{
   static  Person *persons=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        persons=[[Person alloc]init];
        
    });
    return persons;
    
    
    
    
}

-(BOOL)write
{
    NSLog(@"缓存地址：%@",[Person cachesPathString]);
    
    
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:self];
     BOOL success= [data writeToFile:[Person cachesPathString] atomically:YES];
    
    return success;
    
}

+(Person *)read
{
   Person *persons=[NSKeyedUnarchiver  unarchiveObjectWithFile:[Person cachesPathString]];
       return persons;
    
    
}

+(BOOL)delegateAccount
{
   
    return  [[NSFileManager defaultManager]removeItemAtPath:[Person cachesPathString] error:nil];
    
}

-(BOOL)updateAccount{
    
    Person *persons=[NSKeyedUnarchiver  unarchiveObjectWithFile:[Person cachesPathString]];
    
    
    NSFileHandle *fielHandle = [NSFileHandle fileHandleForUpdatingAtPath:[Person cachesPathString]];
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:self];
   
    [fielHandle writeData:data];

    BOOL success= [data writeToFile:[Person cachesPathString] atomically:YES];


    return success;
}

+ (NSString *)cachesPathString{
    
// return   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"OrderSource.plist"];
    
    //    //Caches目录
    return  [NSString stringWithFormat:@"%@/Preferences/OrderSource",[NSHomeDirectory() stringByAppendingPathComponent:@"Library"]];;
}


//-(void)encodeWithCoder:(NSCoder *)aCoder
//{        unsigned int count=0;
//
//    Ivar *ivars=class_copyIvarList([self class] , &count);
//    for (int i=0; i<count; i++) {
//        Ivar * ivar=&ivars[i];
//        const char  *name= ivar_getName(*ivar);
//        
//        NSString *key = [NSString stringWithUTF8String:name];
//        
//        id value = [self valueForKeyPath:key];
//        [aCoder encodeObject:value forKey:key];
//        
//    }
//    
//    free(ivars);
//    
// 
//
//
//}
//
//- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self=[super init]) {
//        if (aDecoder==nil  ) {
//         
//            return self;
//        }
//        
////        self.title = [decoder decodeObjectForKey:@"title"];
//        unsigned int count=0;
//        
//        Ivar *ivars=class_copyIvarList([self class] , &count);
//        for (int i=0; i<count; i++) {
//          Ivar * ivar=&ivars[i];
//        const char  *name= ivar_getName(*ivar);
//            
//            NSString *key = [NSString stringWithUTF8String:name];
//
//            id value = [aDecoder decodeObjectForKey:key];
//            [self setValue:value forKey:key];
//
//        }
//        
//        free(ivars);
//
//        
//    }
//    return self;
//    
//    
//}

// 在系统方法内来调用我们的方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

+(void)run
{
    
    NSLog(@"跑啊");
}
+(void)study
{
    NSLog(@"学习啊");

}
@end
