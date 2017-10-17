//
//  SpecialObject.m
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "SpecialObject.h"

#import "AppearanceProxy.h"

@implementation SpecialObject

+ (instancetype)appearance {
    
    return (SpecialObject *)[AppearanceProxy appearanceForClass:self];
    
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.specialColor = [UIColor blueColor];
        
        [(AppearanceProxy *)[[self class] appearance] startForwarding:self];
        
    }
    
    return self;
    
}

@end
