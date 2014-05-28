//
//  PCPositionSpringViewController.m
//  POPCorn
//
//  Created by David Weissler on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "PCPositionSpringViewController.h"
#import "PCCircleButton.h"
#import <pop/POP.h>

@interface PCPositionSpringViewController ()
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation PCPositionSpringViewController

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

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    NSNumber *value = [NSNumber numberWithDouble:sender.value];
    [self.speedLabel setText:[NSString stringWithFormat:@"Spring Speed: %i",value.intValue]];
}

- (IBAction)animatePositionY:(UIButton *)sender
{
    id anim = [sender.layer pop_animationForKey:@"slideY"];
    if (anim) {
        return;
    }
    
    CGFloat positionOffset = sender.layer.position.y - 199;
    BOOL isButtonAtStartingPosition = NO;
    if (fabsf(positionOffset) < .1) {
        isButtonAtStartingPosition = YES;
    }
    CGFloat destinationY = (isButtonAtStartingPosition) ? 380 : 199;
    
    NSNumber *buttonValue = [self.numberFormatter numberFromString:sender.currentTitle];
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    animation.toValue = @(destinationY);
    animation.springBounciness = buttonValue.floatValue;
    animation.springSpeed = self.springSpeedStepper.value;
    [sender.layer pop_addAnimation:animation forKey:@"slideY"];
}

- (IBAction)raceButtonDidTouch:(UIButton *)sender
{
    for (PCCircleButton *button in self.view.subviews) {
        if ([button isKindOfClass:[PCCircleButton class]]) {
            [self animatePositionY:button];
        }
    }
}

@end
