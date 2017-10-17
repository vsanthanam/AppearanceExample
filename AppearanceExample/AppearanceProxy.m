//
//  SpecialObject.m
//  Temp
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "AppearanceProxy.h"

@implementation NSInvocation (AppearanceCopy)

- (instancetype)copy {
    
    // Allow NSInvocation to be copied safely to prevent memory leaks
    
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

@interface AppearanceProxy ()

// Reference Class
@property (NS_NONATOMIC_IOSONLY, strong) Class apperanceClass;

// Invotions
@property (NS_NONATOMIC_IOSONLY, strong) NSMutableArray *invocations;

- (instancetype)initWithClass:(Class)aClass NS_DESIGNATED_INITIALIZER;

@end

static NSMutableDictionary *classes;

@implementation AppearanceProxy

#pragma mark - Overridden Class Methods

+ (void)initialize {
    
    // Create List of Instances
    
    classes = [[NSMutableDictionary alloc] init];
    
}

#pragma mark - Public Class Methods

+ (instancetype)appearanceForClass:(Class)aClass {
    
    // Create Appearance Instance If Needed
    
    if (!classes[NSStringFromClass(aClass)]) {
        
        id appearance = [[self alloc] initWithClass:aClass];
        classes[NSStringFromClass(aClass)] = appearance;
        
        return appearance;
        
    }
    
    // Return Apeparance Proxy
    
    return classes[NSStringFromClass(aClass)];
    
    
}

#pragma mark - Overridden Instance Methods

- (instancetype)init {
    
    // Prevent Instantiation Without Target Class
    
    [NSException raise:NSGenericException format:@"Don't call -init"];
    
    self = [self initWithClass:nil];
    
    return self;
    
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    // Collect Invocations and Invoke
    
    anInvocation.target = nil;
    [anInvocation retainArguments];
    
    [self.invocations addObject:anInvocation];
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return [self.apperanceClass instanceMethodSignatureForSelector:aSelector];
    
}

#pragma mark - Public Instance Methods

- (instancetype)initWithClass:(Class)aClass {
    
    self = [super init];
    
    if (self) {
        
        // Assign target class, create array to record invocations
        self.apperanceClass = aClass;
        self.invocations = [[NSMutableArray alloc] init];
        
    }
    
    return self;
    
}

- (void)startForwarding:(id)sender {
    
    for (NSInvocation *invocation in self.invocations) {
        
        NSInvocation *targetInvocation = [invocation copy];
        targetInvocation.target = sender;
        [targetInvocation invoke];
        targetInvocation = nil;
        
    }
    
}

@end
