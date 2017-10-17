//
//  SpecialObject.h
//  Temp
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

@import UIKit;

@interface AppearanceProxy : NSObject

+ (nullable instancetype)appearanceForClass:(nonnull Class)aClass;

- (void)startForwarding:(nonnull id)sender;

@end
