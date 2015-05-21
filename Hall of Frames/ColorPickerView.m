//
//  CustomView.m
//  Hall of Frames
//
//  Created by David Seitz Jr on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "ColorPickerView.h"

@implementation ColorPickerView


- (IBAction)buttonPressed:(UIButton *)sender {
    //When a button is tapped, set the frameColor of the picture object and inform the delegate (ViewController)

    if ([sender.titleLabel.text  isEqual: @"Red"]) {
        self.picture.frameColor = [UIColor colorWithRed:255/255.0 green:110/255.0 blue:96/255.0 alpha:1.0];
        NSLog(@"Red color picked.");
    } else if ([sender.titleLabel.text  isEqual: @"Green"]) {
        self.picture.frameColor = [UIColor colorWithRed:98/255.0 green:255/255.0 blue:101/255.0 alpha:1.0];
        NSLog(@"Green color picked.");
    } else if ([sender.titleLabel.text  isEqual: @"Blue"]) {
        self.picture.frameColor = [UIColor colorWithRed:116/255.0 green:159/255.0 blue:255/255.0 alpha:1.0];;
        NSLog(@"Blue color picked.");
    }

    [self.delegate buttonTapped];

    [self removeFromSuperview];
}

@end
