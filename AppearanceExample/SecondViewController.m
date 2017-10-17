//
//  SecondViewController.m
//  AppearanceExample
//
//  Created by Varun Santhanam on 10/17/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

#import "SecondViewController.h"

#import "SpecialObject.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIView *specialView;

@property (nonatomic, strong) SpecialObject *specialObject;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.specialObject = [[SpecialObject alloc] init];
    self.specialView.backgroundColor = self.specialObject.specialColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
