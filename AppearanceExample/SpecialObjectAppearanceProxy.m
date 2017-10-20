//
//  SpecialObjectAppearanceProxy.m
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/20/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "SpecialObjectAppearanceProxy.h"

#import "SpecialObject.h"

@implementation NSInvocation (SpecialObjectAppearanceProxy)

- (instancetype)specialObjectAppearanceProxyCopy {
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:self.methodSignature];
    NSUInteger numberOfArgs = self.methodSignature.numberOfArguments;
    
    invocation.target = self.target;
    invocation.selector = self.selector;
    
    if (numberOfArgs > 2) {
        
        for (int i = 0; i < (numberOfArgs - 2); i++) {
            
            char buffer[sizeof(intmax_t)];
            [self getArgument:(void *)&buffer atIndex:i + 2];
            [invocation setArgument:(void *)&buffer atIndex:i + 2];
            
        }
        
    }
    
    return invocation;
    
}

@end

@interface SpecialObjectAppearanceProxy ()

@property (NS_NONATOMIC_IOSONLY, strong) NSMutableArray<NSInvocation *> *invocations;

@end

@implementation SpecialObjectAppearanceProxy

+ (instancetype)sharedAppearanceProxy {
    
    static SpecialObjectAppearanceProxy *sharedApearanceProxy;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedApearanceProxy = [[self alloc] init];
            
    });
    
    return sharedApearanceProxy;
    
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.invocations = [[NSMutableArray<NSInvocation *> alloc] init];
        
    }
    
    return self;
    
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    anInvocation.target = nil;
    [anInvocation retainArguments];
    
    [self.invocations addObject:anInvocation];
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return [SpecialObject instanceMethodSignatureForSelector:aSelector];
    
}

- (void)startForwarding:(id)sender {
    
    for (NSInvocation *invocation in self.invocations) {
        
        NSInvocation *targetInvocation = [invocation specialObjectAppearanceProxyCopy];
        targetInvocation.target = sender;
        [targetInvocation invoke];
        targetInvocation = nil;
        
    }
    
}

@end
