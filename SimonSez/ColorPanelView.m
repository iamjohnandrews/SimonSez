//
//  ColorPanelView.m
//  SimonSez
//
//  Created by John Andrews on 10/10/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import "ColorPanelView.h"


@implementation ColorPanelView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"call the police, i've been touched");
    [delegate didTouchColorPanelView:self.tag];
}



@end
