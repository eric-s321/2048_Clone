//
//  ViewController.h
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 1/24/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TileView;  //Why do I need this?

@interface ViewController : UIViewController{
    NSArray *tileGrid;
    NSArray *row1;
    NSArray *row2;
    NSArray *row3;
    NSArray *row4;
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


@end

