//
//  SpecialView.m
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "SpecialView.h"

@interface SpecialView ()

@property (NS_NONATOMIC_IOSONLY, strong) UIView *view;

@end

@implementation SpecialView

@synthesize specialColor = _specialColor;

@synthesize view = _view;

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self _setUpSpecialView];
        
    }
    
    return self;
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self _setUpSpecialView];
        
    }
    
    return self;
    
}

+ (BOOL)requiresConstraintBasedLayout {
    
    return YES;
    
}

- (void)setSpecialColor:(UIColor *)specialColor {
    
    _specialColor = specialColor;
    
    self.view.backgroundColor = self.specialColor;
    
}

- (void)_setUpSpecialView {

    _specialColor = [UIColor blueColor];
    
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = self.specialColor;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.view];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterY
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeWidth
                                                       multiplier:0.0f
                                                         constant:300.0f],
                           [NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeHeight
                                                       multiplier:0.0f
                                                         constant:300.0f]]];
    
}

@end
