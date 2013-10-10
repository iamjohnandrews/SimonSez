//
//  ViewController.m
//  SimonSez
//
//  Created by John Andrews on 10/10/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import "ViewController.h"
#import "ColorPanelView.h"

@interface ViewController ()
{
    NSArray* colorTagNumbers;
    NSTimer* highlightTimer;
    NSMutableDictionary* tagsAndBackgroundColors;
    int i;
}

@end

@implementation ViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    colorTagNumbers =@[@"1", @"2", @"3", @"4", @"5", @"6"];
    
    tagsAndBackgroundColors = [[NSMutableDictionary alloc] init];
    
    for (UIView* myView in self.view.subviews) {
        if ([myView isKindOfClass:[ColorPanelView class]]) {
            ((ColorPanelView*)myView).delegate = self;
            [tagsAndBackgroundColors setObject:myView
                                        forKey:[NSString stringWithFormat:@"%i", myView.tag]];
        }
        //NSLog(@"The tags of the view are %i", view.tag);
    }
    //NSLog(@"inside the dictionary %@", tagsAndBackgroundColors);
    
    highlightTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(tick) userInfo:nil repeats:YES]; //@selector is telling this method to go find a method named "tick" to use as a parameter
}

-(void) tick
{
    //NSLog(@"Tick method has fired");
    ColorPanelView* view = [tagsAndBackgroundColors objectForKey:[NSString stringWithFormat:@"%i", i]];
    
    UIColor* previousColor = [view backgroundColor];
    
    //[view setBackgroundColor:[UIColor cyanColor]];
    [UIView animateWithDuration:0.2f animations:^{
        view.backgroundColor = [UIColor whiteColor];
    }
                     completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2f animations:^{
            view.backgroundColor = previousColor;
        }];
    }];
    
    if (i == 6) {
        i = 0;
        [highlightTimer invalidate];
        //NSLog(@"timer is done");
    } else {
        i++;
    }
    
}

- (void) didTouchColorPanelView: (int)tagnumber
{
    
    NSLog(@"ViewController implemented the protocol and event tag # is %d", tagnumber);
}

@end
