//
//  PCScaleViewController.m
//  POPCorn
//
//  Created by Daniel Rakhamimov on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "PCScaleViewController.h"
#import "PCScaleCollectionViewCell.h"
#import <POP/POP.h>

@interface PCScaleViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation PCScaleViewController

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
}

#pragma mark - Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"KernelCell";
    PCScaleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - POP Animations
- (IBAction)animateScale:(UIButton *)sender {
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    springAnimation.springBounciness = 20.0;
    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(2.0, 2.0)];
    
    
//    decayAnimation.fromValue = [NSValue valueWithCGAffineTransform:CGAffineTransformMakeScale(1.0, 1.0)];
//    decayAnimation.toValue = [NSValue valueWithCGAffineTransform:CGAffineTransformMakeScale(3.0, 3.0)];
    [sender pop_addAnimation:springAnimation forKey:@"springScale"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
