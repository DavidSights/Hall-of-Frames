//
//  CustomView.h
//  Hall of Frames
//
//  Created by David Seitz Jr on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureWithProperties.h"

@protocol CustomViewDelegate <NSObject>

-(void)buttonTapped;

@end


@interface ColorPickerView : UIView

@property (nonatomic, assign) id <CustomViewDelegate> delegate;
@property PictureWithProperties *picture;

@end
