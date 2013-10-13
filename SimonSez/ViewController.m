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
    NSMutableArray* cPUTagNumbers;
    NSMutableArray* Player1TagNumbers;
    
    NSTimer* highlightTimer;
    NSMutableDictionary* tagsAndBackgroundColors;
    NSMutableDictionary* tagsAndBackgroundColorsv2;
    int i;
}

@end

@implementation ViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Player1TagNumbers = [[NSMutableArray alloc] init];
    cPUTagNumbers = [[NSMutableArray alloc] init];
    tagsAndBackgroundColors = [[NSMutableDictionary alloc] init];
    
    for (UIView* myView in self.view.subviews) {
        if ([myView isKindOfClass:[ColorPanelView class]])
        {
            ((ColorPanelView*)myView).delegate = self;
            [tagsAndBackgroundColors setObject:myView
                                        forKey:[NSString stringWithFormat:@"%i", myView.tag]];
        }
        //NSLog(@"The tags of the view are %i", view.tag);
    }
    //NSLog(@"inside the dictionary %@", tagsAndBackgroundColors);
    
    highlightTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tick) userInfo:nil repeats:YES]; //@selector is telling this method to go find a method named "tick" to use as a parameter
}

-(void) tick
{
    //NSLog(@"Tick method has fired");

    [self lightUp];
    
    if (i == 6) {
        i = 0;
        [highlightTimer invalidate];
        NSLog(@"timer is done");
    } else {
        i++;
        [cPUTagNumbers addObject:[NSString stringWithFormat:@"%i", i]];
    }
    NSLog(@"the CPU simonSez pattern = %@", cPUTagNumbers);
}

-(void) tock //problem is program goes through loop to quickly ad the highlighter is marked invalid before anycolor changes
{
    //NSLog(@"Tock method has fired");
    
    [self lightUp];
    
    for (int cycles = 0; cycles < 6; cycles++) {
        i = arc4random()%5 + 1;
        [cPUTagNumbers addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    [highlightTimer invalidate];
    NSLog(@"timer is done");
    
    NSLog(@"the CPU version2 simonSez pattern = %@", cPUTagNumbers);
}

-(void) lightUp //I want to make this a function to pass in a view so that when I call funcion with the parameter "self" in ColorPanelView and parameter "view" in this View Controller, it replaces the varaible "view" below.
{
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
    
}


- (void) didTouchColorPanelView: (int)tagnumber
{
    
    //NSLog(@"ViewController implemented the protocol and event tag # is %d", tagnumber);
    
    [Player1TagNumbers addObject:[NSString stringWithFormat:@"%d", tagnumber]];
    
    //NSLog(@"number of values in the array = %i", Player1TagNumbers.count);
    //NSLog(@"all the tag values in the array = %@", Player1TagNumbers);
    
    [self player1Performance];
}


-(void)player1Performance
{
    //NSLog(@"this method got fired");
    
    int index = Player1TagNumbers.count - 1;
    
    //NSLog(@"CPU's array object = %@", [cPUTagNumbers objectAtIndex:index]);
    //NSLog(@"Player's array object = %@", [Player1TagNumbers objectAtIndex:index]);
    
    int playerTag = [[Player1TagNumbers objectAtIndex:index] intValue];
    int cPUTag    = [[cPUTagNumbers objectAtIndex:index] intValue];
    
    if (playerTag == cPUTag)
    {
        NSLog(@"Objects are equal");
    }
    else
    {
        //NSLog(@"Objects are NOT equal");
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"YOU LOSER" message:@"Simon Owns You!" delegate:self cancelButtonTitle:@"Run It Back" otherButtonTitles:@"I Give Up", nil];
        [alert show];
    }
    if (i == 5) {
        i = 0;
        NSLog(@"winner");
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"WINNER" message:@"You Beat Simon!" delegate:self cancelButtonTitle:@"Run It Back" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        i++;
    }

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{    
    if (buttonIndex == 0) {
        //NSLog(@"Run It Back Button tapped");
        [self restartGame];
        
    } else if (buttonIndex == 1){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=M5QGkOGZubQ"]];
    }
    
}
    
-(void) restartGame
{
    NSLog(@"The game is being reset");
    
    tagsAndBackgroundColorsv2 = [[NSMutableDictionary alloc] init];
    
    for (UIView* myView in self.view.subviews) {
        if ([myView isKindOfClass:[ColorPanelView class]])
        {
            ((ColorPanelView*)myView).delegate = self;
            [tagsAndBackgroundColors setObject:myView
                                        forKey:[NSString stringWithFormat:@"%i", myView.tag]];
        }
        //NSLog(@"The tags of the view are %i", view.tag);
    }
    //NSLog(@"inside the dictionary %@", tagsAndBackgroundColors);
    
    highlightTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tock) userInfo:nil repeats:YES];
}

@end
