//
//  PCPositionSpringViewController.h
//  POPCorn
//
//  Created by David Weissler on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCPositionSpringViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIStepper *springSpeedStepper;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@end
