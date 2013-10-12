//
//  ColorPanelView.m
//  SimonSez
//
//  Created by John Andrews on 10/10/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import "ColorPanelView.h"


@implementation ColorPanelView

@synthesize delegate, delegateAlert;

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

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //below code lights up views after player lifts his/her finger
    UIColor* previousColor = [self backgroundColor];
    [UIView animateWithDuration:0.2f animations:^{
        self.backgroundColor = [UIColor whiteColor];
    }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2f animations:^{
                             self.backgroundColor = previousColor;
                         }];
                     }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Get yo hand outta my pocket");
//    if (buttonIndex == 0) {
//        [delegateAlert ];
//    } else {
//        [delegateAlert ];
//    }
    
}


@end
