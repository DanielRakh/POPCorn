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
@property (nonatomic, assign) BOOL isCirclePositionYAtStartingPoint;
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
    self.isCirclePositionYAtStartingPoint = YES;
}

- (IBAction)animatePositionX:(UIButton *)sender
{
    id anim = [self.circlePositionX pop_animationForKey:@"slideX"];
    if (anim) {
        return;
    }
    
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.velocity = (self.isCirclePositionXAtStartingPoint) ? @(400) : @(-400);
    self.isCirclePositionXAtStartingPoint = !self.isCirclePositionXAtStartingPoint;
    [self.circlePositionX pop_addAnimation:animation forKey:@"slideX"];
}

- (IBAction)animatePositionY:(UIButton *)sender
{
    id anim = [self.circlePositionY pop_animationForKey:@"slideY"];
    if (anim) {
        return;
    }
    
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    animation.velocity = (self.isCirclePositionYAtStartingPoint) ? @(400) : @(-400);
    self.isCirclePositionYAtStartingPoint = !self.isCirclePositionYAtStartingPoint;
    [self.circlePositionY pop_addAnimation:animation forKey:@"slideY"];
}


@end