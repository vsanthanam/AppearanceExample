//
//  SpecialView.h
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

@import UIKit;

IB_DESIGNABLE

@interface SpecialView : UIView<UIAppearance>

@property (NS_NONATOMIC_IOSONLY, strong, nonnull) UIColor *specialColor IBInspectable UI_APPEARANCE_SELECTOR;

@end
