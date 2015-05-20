//
//  CustomView.m
//  Hall of Frames
//
//  Created by David Seitz Jr on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


- (IBAction)buttonPressed:(UIButton *)sender {
    [self.delegate buttonTapped:sender];
}

@end
