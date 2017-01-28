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

- (void)viewDidLoad {
    [super viewDidLoad];
    tileArray = [NSArray arrayWithObjects:tile1, tile2, tile3, tile4, tile5,
                 tile6, tile7, tile8, tile9, tile10, tile11, tile12,
                 tile13, tile14, tile15, tile16, nil];
    
    int firstTileVisible = [self randomNumberBetween:0 maxNum:15];
    int secondTileVisible = [self randomNumberBetween:0 maxNum:15];
    
    while(secondTileVisible == firstTileVisible){  //Ensure the first two tiles we show are different
        secondTileVisible = [self randomNumberBetween:0 maxNum:15];
    }
    
    
    // Make 2 random tiles display 2 and clear all other ones
    for(int i = 0; i < [tileArray count]; i++){
        
        TileView *tile = tileArray[i];  //Why do I have to make new variable instead of tileArray[i].numberValue.text
        
        if(i == firstTileVisible || i == secondTileVisible){
            tile.numberValue.text = @"2";
        }
        else{
            tile.numberValue.text = @"";
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Generates random number between min and max inclusive
- (int)randomNumberBetween:(int)min maxNum:(int)max{
    return min + arc4random() % (max - min + 1);
}


@end
