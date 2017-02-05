//
//  Tile.h
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 1/26/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIView


@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UILabel *numberValue;

@property (nonatomic) int xIndex;
@property (nonatomic) int yIndex;
@property (nonatomic) bool occupied;
@property (nonatomic) bool hasMerged;

@end


