//
//  ColorPanelView.h
//  SimonSez
//
//  Created by John Andrews on 10/10/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPanelDelegate

- (void) didTouchColorPanelView;

@end

@interface ColorPanelView : UIView

@property (weak, nonatomic)id <ColorPanelDelegate> delegate;

@end
