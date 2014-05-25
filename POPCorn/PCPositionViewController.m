//
//  PCPositionViewController.m
//  POPCorn
//
//  Created by David Weissler on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "PCPositionViewController.h"
#import "PCCircleButton.h"
#import <pop/POP.h>

@interface PCPositionViewController ()
@property (nonatomic, assign) BOOL isCirclePositionXAtStartingPoint;
@end

@implementation PCPositionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isCirclePositionXAtStartingPoint = YES;
}


- (IBAction)animatePositionX:(UIButton *)sender
{
    id anim = [self.circlePositionX pop_animationForKey:@"slideKey"];
    if (anim) {
        return;
    }
    
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.velocity = (self.isCirclePositionXAtStartingPoint) ? @(400) : @(-400);
    self.isCirclePositionXAtStartingPoint = !self.isCirclePositionXAtStartingPoint;
    [self.circlePositionX pop_addAnimation:animation forKey:@"slideKey"];
    
}

@end