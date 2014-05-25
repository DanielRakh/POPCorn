//
//  PCPositionViewController.h
//  POPCorn
//
//  Created by David Weissler on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCCircleButton;

@interface PCPositionViewController : UIViewController
@property (weak, nonatomic) IBOutlet PCCircleButton *circlePositionX;
@property (weak, nonatomic) IBOutlet PCCircleButton *circlePositionY;

@end
