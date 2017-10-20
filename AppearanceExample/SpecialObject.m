//
//  SpecialObject.m
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "SpecialObject.h"

#import "SpecialObjectAppearanceProxy.h"

@implementation SpecialObject

+ (instancetype)appearance {
    
    return (SpecialObject *)[SpecialObjectAppearanceProxy sharedAppearanceProxy];
    
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.specialColor = [UIColor blueColor];
        
        [(SpecialObjectAppearanceProxy *)[[self class] appearance] startForwarding:self];
        
    }
    
    return self;
    
}

@end
