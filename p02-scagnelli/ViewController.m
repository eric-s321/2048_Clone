//
//  ViewController.m
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 1/24/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import "ViewController.h"
#import "TileView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tile1, tile2, tile3, tile4,
tile5, tile6, tile7, tile8, tile9, tile10,
tile11, tile12, tile13, tile14, tile15, tile16;
@synthesize leftSwipe, rightSwipe, upSwipe, downSwipe;

- (void)viewDidLoad {
    [super viewDidLoad];
    /*tileArray = [NSArray arrayWithObjects:tile1, tile2, tile3, tile4, tile5,
                 tile6, tile7, tile8, tile9, tile10, tile11, tile12,
                 tile13, tile14, tile15, tile16, nil];*/
    
    row1 = [NSArray arrayWithObjects:tile1, tile2, tile3, tile4, nil];
    row2 = [NSArray arrayWithObjects:tile5, tile6, tile7, tile8, nil];
    row3 = [NSArray arrayWithObjects:tile9, tile10, tile11, tile12, nil];
    row4 = [NSArray arrayWithObjects:tile13, tile14, tile15, tile16, nil];
    
    tileGrid = [NSArray arrayWithObjects:row1,row2,row3,row4, nil];
    
    int firstTileVisibleX = [self randomNumberBetween:0 maxNum:3];
    int firstTileVisibleY = [self randomNumberBetween:0 maxNum:3];
    int secondTileVisibleX = [self randomNumberBetween:0 maxNum:3];
    int secondTileVisibleY = [self randomNumberBetween:0 maxNum:3];
    
    while((secondTileVisibleX == firstTileVisibleX) && (secondTileVisibleY == firstTileVisibleY)){  //Ensure the first two tiles we show are different
        secondTileVisibleX = [self randomNumberBetween:0 maxNum:3];
        secondTileVisibleY = [self randomNumberBetween:0 maxNum:3];
    }
    
    // Make 2 random tiles display 2 and clear all other ones
    for(int i = 0; i < [tileGrid count]; i++){
        for(int j = 0; j < [tileGrid[i] count]; j++){
            
            TileView *tile = tileGrid[i][j];  //Why do I have to make new variable instead of tileGrid[i][j].numberValue.text
            
            if((i == firstTileVisibleX && j == firstTileVisibleY) || (i == secondTileVisibleX && j == secondTileVisibleY)){
                tile.numberValue.text = @"2";
                tile.view.backgroundColor = [UIColor blueColor];
                tile.occupied = YES;
            }
            else{
                tile.numberValue.text = @"";
                tile.view.backgroundColor = [UIColor lightGrayColor];
                tile.occupied = NO;
            }
        }
    }
    
    //Set up swipe gestures
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
    [self.view addGestureRecognizer:upSwipe];
    [self.view addGestureRecognizer:downSwipe];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Generates random number between min and max inclusive
- (int)randomNumberBetween:(int)min maxNum:(int)max{
    return min + arc4random() % (max - min + 1);
}


- (void)handleSwipes:(UISwipeGestureRecognizer *)sender{
    
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"Left");
    }
    else if(sender.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"Right");
    }
    else if (sender.direction == UISwipeGestureRecognizerDirectionUp){
        NSLog(@"Up");
    
    }
    else if(sender.direction == UISwipeGestureRecognizerDirectionDown){
        NSLog(@"Down");
    }
}

@end
