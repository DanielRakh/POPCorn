//
//  PCCircleView.m
//  POPCorn
//
//  Created by Daniel Rakhamimov on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "PCCircleButton.h"

@implementation PCCircleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
}

- (void)roundEdgesToMakeCircle {
    self.layer.cornerRadius = self.bounds.size.width/2.0;
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
