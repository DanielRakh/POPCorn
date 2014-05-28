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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"Scale";
}

#pragma mark - Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    return header;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"KernelCell";
    PCScaleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    return cell;
}

#pragma mark - Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id selectedObject = [collectionView cellForItemAtIndexPath:indexPath];
    [self animateObject:selectedObject withSpringBouncines:indexPath.item];
}



#pragma mark - POP Animations

- (void)animateObject:(id)object withSpringBouncines:(CGFloat)springBounciness {
    
    CGFloat bounciness = springBounciness + 1;
    NSLog(@"%f",bounciness);

    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    springAnimation.springBounciness = bounciness;
    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
    springAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.springBounciness = bounciness;
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
        [object pop_addAnimation:springAnimation forKey:@"springScale"];
        
        
    };
    [object pop_addAnimation:springAnimation forKey:@"springScale"];
}


- (IBAction)animateAll:(id)sender {
    
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0; i < numberOfItems; i++) {
        NSIndexPath *idxPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:idxPath];
        [self animateObject:cell withSpringBouncines:i];
    }
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
