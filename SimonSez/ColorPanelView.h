//
//  ColorPanelView.h
//  SimonSez
//
//  Created by John Andrews on 10/10/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>

/*pretty much a four step check list when making a protocol
 1. Write the protocol in the .h file (or create a class and write in .h file
 2. make a property in the .h file of the view
 3. import .h file into the view controller and add the <nameDelegate> to the VC's .h file
 4. synthesize the delegate in the view .m file
*/
@protocol ColorPanelDelegate

- (void) didTouchColorPanelView: (int)tagnumber;

@end


@interface ColorPanelView : UIView

@property (weak, nonatomic)id <ColorPanelDelegate> delegate;

@property (weak, nonatomic)id <UIAlertViewDelegate> delegateAlert;

@end
