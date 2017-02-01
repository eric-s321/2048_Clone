//
//  ViewController.h
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 1/24/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * This macro to get a UIColor from an RGB value was found on
 * http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
 * All credit goes to "Tom" and thank you for the help!
 */
#define UIColorFromRGB(rgbValue) \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
        green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
        blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
        alpha:1.0]

@class TileView;  //Why do I need this?

@interface ViewController : UIViewController{
    NSArray *tileGrid;
    NSArray *row1;
    NSArray *row2;
    NSArray *row3;
    NSArray *row4;
    
    UIColor *backgroundColor;
    UIColor *blankTileColor;
    UIColor *tile2Color;
    UIColor *tile4Color;
    UIColor *tile8Color;
    UIColor *tile16Color;
}

@property (strong, nonatomic) IBOutlet TileView *tile1;
@property (strong, nonatomic) IBOutlet TileView *tile2;
@property (strong, nonatomic) IBOutlet TileView *tile3;
@property (strong, nonatomic) IBOutlet TileView *tile4;
@property (strong, nonatomic) IBOutlet TileView *tile5;
@property (strong, nonatomic) IBOutlet TileView *tile6;
@property (strong, nonatomic) IBOutlet TileView *tile7;
@property (strong, nonatomic) IBOutlet TileView *tile8;
@property (strong, nonatomic) IBOutlet TileView *tile9;
@property (strong, nonatomic) IBOutlet TileView *tile10;
@property (strong, nonatomic) IBOutlet TileView *tile11;
@property (strong, nonatomic) IBOutlet TileView *tile12;
@property (strong, nonatomic) IBOutlet TileView *tile13;
@property (strong, nonatomic) IBOutlet TileView *tile14;
@property (strong, nonatomic) IBOutlet TileView *tile15;
@property (strong, nonatomic) IBOutlet TileView *tile16;

@property (strong, nonatomic) UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) UISwipeGestureRecognizer *rightSwipe;
@property (strong, nonatomic) UISwipeGestureRecognizer *upSwipe;
@property (strong, nonatomic) UISwipeGestureRecognizer *downSwipe;

- (int)randomNumberBetween:(int)min maxNum:(int)max;
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender;
- (bool)canMoveLeft:(TileView *)tile;
- (bool)canMoveRight:(TileView *)tile;
- (bool)canMoveUp:(TileView *)tile;
- (bool)canMoveDown:(TileView *)tile;
- (NSMutableArray *)getOccupiedTiles;
- (void)swapTiles:(TileView *)tileWithNum blankTile:(TileView *)blankTile;

@end

