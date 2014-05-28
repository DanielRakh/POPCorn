//
//  PCScaleCollectionViewCell.m
//  POPCorn
//
//  Created by Daniel Rakhamimov on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "PCScaleCollectionViewCell.h"
#import <POP/POP.h>

@implementation PCScaleCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];

}

- (void)commonInit {
    [self roundEdgesToMakeCircle];
    [self addLabelToCenter];
}

- (void)addLabelToCenter {
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.label.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    
}

- (void)roundEdgesToMakeCircle {
    self.layer.cornerRadius = self.bounds.size.width/2.0;
}


- (void)prepareForReuse {
    [super prepareForReuse];
    [self pop_removeAllAnimations];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
