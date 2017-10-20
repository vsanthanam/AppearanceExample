//
//  SpecialObjectAppearanceProxy.h
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/20/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialObjectAppearanceProxy : NSObject

+ (nullable instancetype)sharedAppearanceProxy;

- (void)startForwarding:(nonnull id)sender;

@end
