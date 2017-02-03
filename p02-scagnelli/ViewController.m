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
    backgroundColor = UIColorFromRGB(0x575761);
    blankTileColor = UIColorFromRGB(0xD3BCCC);
    tile2Color = UIColorFromRGB(0xE4FDE1);
    tile4Color = UIColorFromRGB(0x648381);
    tile8Color = UIColorFromRGB(0xFFBF46);
    tile16Color = UIColorFromRGB(0x8ACB88);
    
    self.view.backgroundColor = backgroundColor;
    
    
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
    
    NSLog(@"firstX is %d firstY is%d\nsecondX is %d secondY is %d",
          firstTileVisibleX, firstTileVisibleY, secondTileVisibleX, secondTileVisibleY);
    
    // Make 2 random tiles display 2 and clear all other ones
    for(int i = 0; i < [tileGrid count]; i++){
        for(int j = 0; j < [tileGrid[i] count]; j++){
            
            TileView *tile = tileGrid[i][j];  //Why do I have to make new variable instead of tileGrid[i][j].numberValue.text
            
            if((i == firstTileVisibleX && j == firstTileVisibleY) || (i == secondTileVisibleX && j == secondTileVisibleY)){
                tile.numberValue.text = @"2";
                tile.view.backgroundColor = tile2Color;
                tile.occupied = YES;
            }
            else{
                tile.numberValue.text = @"";
                tile.view.backgroundColor = blankTileColor;
                tile.occupied = NO;
            }
            tile.xIndex = i;  //Give initial positions in the grid
            tile.yIndex = j;
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
    
    /*
     * Have to call each one 3 times incase 3 tiles
     * are next to eachother in the same row
     * otherwise only one tile would be moved.
     */
    for(int i =0; i < 3; i++) {
        
        //left
        if(sender.direction == UISwipeGestureRecognizerDirectionLeft){
            NSLog(@"Left");
            
            NSMutableArray *occupiedTiles = [self getOccupiedTiles];
            for(int i = 0; i < [occupiedTiles count]; i++){
                TileView *tile = occupiedTiles[i];
                NSLog(@"tile at position x=%d y=%d is occupied", tile.xIndex, tile.yIndex);
                while([self canMoveLeft:tile]){
                    TileView *tileToLeft = tileGrid[tile.xIndex][tile.yIndex - 1];
                    [self swapTiles:tile blankTile:tileToLeft];
                    tile = tileToLeft; //Check if the tile can be moved further left
                }
                if(tile.yIndex != 0){ //Can't move any further left and is not in the leftmost column
                    //combine tiles if we can
                    TileView *tileToLeft = tileGrid[tile.xIndex][tile.yIndex - 1];
                    //[self combineTiles:tileToLeft secondTile:tile direction:LEFT_DIRECTION];
                    [self combineTiles:tileToLeft tileToBeBlank:tile];
                }
            }
        }
        
        //right
        else if(sender.direction == UISwipeGestureRecognizerDirectionRight){
            NSLog(@"Right");
            
            NSMutableArray *occupiedTiles = [self getOccupiedTiles];
            for(int i = 0; i < [occupiedTiles count]; i++){
                TileView *tile = occupiedTiles[i];
                NSLog(@"tile at position x=%d y=%d is occupied", tile.xIndex, tile.yIndex);
                while([self canMoveRight:tile]){
                    TileView *tileToRight = tileGrid[tile.xIndex][tile.yIndex + 1];
                    [self swapTiles:tile blankTile:tileToRight];
                    tile = tileToRight; //Check if the tile can be moved further right
                }
                if(tile.yIndex != 3){
                    TileView *tileToRight = tileGrid[tile.xIndex][tile.yIndex + 1];
                //    [self combineTiles:tile secondTile:tileToRight direction:RIGHT_DIRECTION];
                    [self combineTiles:tileToRight tileToBeBlank:tile];
                }
            }
        }
        
        //up
        else if (sender.direction == UISwipeGestureRecognizerDirectionUp){
            NSLog(@"Up");
            
            NSMutableArray *occupiedTiles = [self getOccupiedTiles];
            for(int i = 0; i < [occupiedTiles count]; i++){
                TileView *tile = occupiedTiles[i];
                NSLog(@"tile at position x=%d y=%d is occupied", tile.xIndex, tile.yIndex);
                while([self canMoveUp:tile]){
                    TileView *tileAbove = tileGrid[tile.xIndex - 1][tile.yIndex];
                    [self swapTiles:tile blankTile:tileAbove];
                    tile = tileAbove; //Check if the tile can be moved further up
                }
                if(tile.xIndex != 0){//As far up as can go and not against wall - check if can combine tiles
                    TileView *tileAbove = tileGrid[tile.xIndex - 1][tile.yIndex];
                    [self combineTiles:tileAbove tileToBeBlank:tile];
                }
            }
        
        }
        
        //down
        else if(sender.direction == UISwipeGestureRecognizerDirectionDown){
            NSLog(@"Down");
            
            NSMutableArray *occupiedTiles = [self getOccupiedTiles];
            for(int i = 0; i < [occupiedTiles count]; i++){
                TileView *tile = occupiedTiles[i];
                NSLog(@"tile at position x=%d y=%d is occupied", tile.xIndex, tile.yIndex);
                while([self canMoveDown:tile]){
                    TileView *tileBelow = tileGrid[tile.xIndex + 1][tile.yIndex];
                    [self swapTiles:tile blankTile:tileBelow];
                    tile = tileBelow; //Check if the tile can be moved further down
                }
                if(tile.xIndex != 3){
                    TileView *tileBelow = tileGrid[tile.xIndex + 1][tile.yIndex];
                    [self combineTiles:tileBelow tileToBeBlank:tile];
                }
            }
        }
    }
    
    
// Done moving/combining tiles already present - create a new one in a random empty position

    int newXPos = [self randomNumberBetween:0 maxNum:3];
    int newYPos = [self randomNumberBetween:0 maxNum:3];
    
    TileView *newTile = tileGrid[newXPos][newYPos];
 
    while(newTile.occupied){  //make sure we pick an unoccupied tile
        newXPos = [self randomNumberBetween:0 maxNum:3];
        newYPos = [self randomNumberBetween:0 maxNum:3];
        newTile = tileGrid[newXPos][newYPos];
    }
 
    newTile.numberValue.text = @"2";
    newTile.occupied = YES;
    [self switchBackgroundColor:newTile value:2];
    
}

- (bool)canMoveLeft:(TileView *)tile{
    int x = tile.xIndex;
    int y = tile.yIndex;
    
    if(y == 0) //tile is in leftmost column
        return NO;
    
    
    TileView *tileToLeft = tileGrid[x][y-1];
    if(tileToLeft.occupied)
        return NO;
    
    return YES;
}

- (bool)canMoveRight:(TileView *)tile{
    int x = tile.xIndex;
    int y = tile.yIndex;
    
    if(y == 3) //tile is in the rightmost column
        return NO;
    
    TileView *tileToRight = tileGrid[x][y+1];
    if(tileToRight.occupied)
        return NO;
    
    return YES;
}

- (bool)canMoveUp:(TileView *)tile{
    int x = tile.xIndex;
    int y = tile.yIndex;
    
    if(x == 0) //tile is in the top row
        return NO;
    
    TileView *tileAbove = tileGrid[x-1][y];
    if(tileAbove.occupied)
        return NO;
    
    return YES;
}

- (bool)canMoveDown:(TileView *)tile{
    int x = tile.xIndex;
    int y = tile.yIndex;
    
    if(x == 3) //tile is in the bottom row
        return NO;
    
    TileView *tileBelow = tileGrid[x+1][y];
    if(tileBelow.occupied)
        return NO;
    
    return YES;
}

- (NSMutableArray *)getOccupiedTiles{
    
    NSMutableArray *occupiedArray = [[NSMutableArray alloc] init]; //Initialize empty dynamic array
    for(int i = 0; i < [tileGrid count]; i++){
        for(int j = 0; j < [tileGrid[i] count]; j++){
            TileView *tile = tileGrid[i][j];
            if(tile.occupied)
                [occupiedArray addObject:tile];
        }
    }
    return occupiedArray;
}

//Just swaps the numberValue of the tiles, does not actually move the objects
- (void)swapTiles:(TileView *)tileWithNum blankTile:(TileView *)blankTile{
    
    int tempNumVal = [tileWithNum.numberValue.text intValue];
    tileWithNum.numberValue.text = @"";
    [self switchBackgroundColor:tileWithNum value:0];
    tileWithNum.occupied = NO;
    blankTile.numberValue.text = [NSString stringWithFormat:@"%d", tempNumVal];
    blankTile.occupied = YES;
    [self switchBackgroundColor:blankTile value:tempNumVal];
    
}

- (void)combineTiles:(TileView *)tileWithNewValue tileToBeBlank:(TileView *)tileToBeBlank{
    
    if([tileWithNewValue.numberValue.text intValue] == [tileToBeBlank.numberValue.text intValue]){
        
            tileWithNewValue.numberValue.text = [NSString stringWithFormat:@"%d",
                                    [tileWithNewValue.numberValue.text intValue] * 2];
            [self switchBackgroundColor:tileWithNewValue value:[tileWithNewValue.numberValue.text intValue]];
            
            tileToBeBlank.numberValue.text = @"";
            [self switchBackgroundColor:tileToBeBlank value:0];
            tileToBeBlank.occupied = NO;
        
    }
}


- (void)switchBackgroundColor:(TileView *)tile value:(int) num{
    switch(num){
        //0 means blank tile
        case 0:
            tile.view.backgroundColor = blankTileColor;
            break;
        case 2:
            tile.view.backgroundColor = tile2Color;
            break;
        case 4:
            tile.view.backgroundColor = tile4Color;
            break;
        case 8:
            tile.view.backgroundColor = tile8Color;
            break;
        case 16:
            tile.view.backgroundColor = tile16Color;
            break;
    }
}

@end
