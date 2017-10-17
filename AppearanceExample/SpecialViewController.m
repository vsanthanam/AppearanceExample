//
//  SpecialViewController.m
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "SpecialViewController.h"

#import "SpecialViewControllerAppearanceProxy.h"

@interface SpecialViewController ()

@property (NS_NONATOMIC_IOSONLY, strong) UIView *specialView;

@end

@implementation SpecialViewController

@synthesize specialColor = _specialColor;

@synthesize specialView = _specialView;

#pragma mark - Designated Initializers

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
     
        [self _assignDefaults];
        
    }
    
    return self;
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        [self _assignDefaults];
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.specialView = [[UIView alloc] initWithFrame:CGRectZero];
    self.specialView.backgroundColor = self.specialColor;
    self.specialView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.specialView];
    
    [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:self.specialView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1.0f
                                                              constant:0.0f],
                                [NSLayoutConstraint constraintWithItem:self.specialView
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1.0f
                                                              constant:0.0f],
                                [NSLayoutConstraint constraintWithItem:self.specialView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:0.0f
                                                              constant:300.0f],
                                [NSLayoutConstraint constraintWithItem:self.specialView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:0.0f
                                                              constant:300.0f]]];
    
}

#pragma mark - UIAppearanance

+ (instancetype)appearance {
    
    return (SpecialViewController *)[SpecialViewControllerAppearanceProxy appearance];
    
}

+ (instancetype)appearanceForTraitCollection:(UITraitCollection *)trait {
    
    return (SpecialViewController *)[SpecialViewControllerAppearanceProxy appearanceForTraitCollection:trait];
    
}

+ (instancetype)appearanceWhenContainedInInstancesOfClasses:(NSArray<Class<UIAppearanceContainer>> *)containerTypes {
    
    return (SpecialViewController *)[SpecialViewControllerAppearanceProxy appearanceWhenContainedInInstancesOfClasses:containerTypes];
    
}

+ (instancetype)appearanceForTraitCollection:(UITraitCollection *)trait whenContainedInInstancesOfClasses:(NSArray<Class<UIAppearanceContainer>> *)containerTypes {
    
    return (SpecialViewController *)[SpecialViewControllerAppearanceProxy appearanceForTraitCollection:trait whenContainedInInstancesOfClasses:containerTypes];
    
}

+ (instancetype)appearanceWhenContainedIn:(Class<UIAppearanceContainer>)ContainerClass, ... {
    
    // Deprecated
    return nil;
    
}

+ (instancetype)appearanceForTraitCollection:(UITraitCollection *)trait whenContainedIn:(Class<UIAppearanceContainer>)ContainerClass, ... {
    
    // Deprecated
    return nil;
    
}

#pragma mark - Private Instance Methods

- (void)_assignDefaults {
    
    _specialColor = [SpecialViewController appearance].specialColor ? [SpecialViewController appearance].specialColor : [UIColor blueColor];
    
}

@end
