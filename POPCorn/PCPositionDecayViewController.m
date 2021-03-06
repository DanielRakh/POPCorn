//
//  PCPositionDecayViewController.m
//  POPCorn
//
//  Created by David Weissler on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "PCPositionDecayViewController.h"
#import "PCCircleButton.h"
#import <pop/POP.h>

@interface PCPositionDecayViewController ()
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation PCPositionDecayViewController

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
    self.numberFormatter = [[NSNumberFormatter alloc] init];
}

- (IBAction)animatePositionX:(UIButton *)sender
{
    id anim = [sender.layer pop_animationForKey:@"slideX"];
    if (anim) {
        return;
    }
    
    // The button doesn't always return to exactly x = 20;
    CGFloat frameOffset = sender.frame.origin.x - 20.0;
    BOOL isButtonAtStartingPosition = NO;
    if (fabsf(frameOffset) < .1) {
        isButtonAtStartingPosition = YES;
    }
    
    NSNumber *buttonValue = [self.numberFormatter numberFromString:sender.currentTitle];
    int velocity = (isButtonAtStartingPosition) ? buttonValue.intValue : -1 * buttonValue.intValue;
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.velocity = @(velocity);
    [sender.layer pop_addAnimation:animation forKey:@"slideX"];
}

- (IBAction)raceButtonDidTouch:(UIButton *)sender {
    for (PCCircleButton *button in self.view.subviews) {
        if ([button isKindOfClass:[PCCircleButton class]]) {
            [self animatePositionX:button];
        }
    }
}

@end