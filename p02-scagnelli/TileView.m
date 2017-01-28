//
//  Tile.m
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 1/26/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import "TileView.h"

@implementation TileView
@synthesize view, numberValue;

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder]; //Coming from xib file
    
    if(self){
        UINib *nib = [UINib nibWithNibName:@"Tile" bundle:nil];
        [nib instantiateWithOwner:self options:nil];
        
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:view];
        
        NSLayoutConstraint *constr;
        //Stitch view from xib file to the top of Tile
        constr = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop
                multiplier:1.0 constant:0];
        [self addConstraint:constr];
       
        //Same for left
        constr = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft
                multiplier:1.0 constant:0];
        [self addConstraint:constr];
        
        //Right
        constr = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight
                multiplier:1.0 constant:0];
        [self addConstraint:constr];
        
        //Bottom
        constr = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom
                multiplier:1.0 constant:0];
        [self addConstraint:constr];
        
    }

    return self;

}

@end
