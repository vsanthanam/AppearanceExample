//
//  SpecialViewControllerAppearanceProxy.h
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

@import UIKit;

@interface SpecialViewControllerAppearanceProxy : UIView<UIAppearance>

@property (NS_NONATOMIC_IOSONLY, strong, nullable) UIColor *specialColor UI_APPEARANCE_SELECTOR;

@end
