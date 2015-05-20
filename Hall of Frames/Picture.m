//
//  Picture.m
//  Hall of Frames
//
//  Created by Adam Johnson on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "Picture.h"

@implementation Picture

-(instancetype)initWithPictures:(NSMutableArray *)pictures {

    self = [super init];

    if (self) {
        self.pictures = pictures;
    }
    return self;
}


@end

