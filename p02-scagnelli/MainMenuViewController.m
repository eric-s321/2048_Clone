//
//  MainMenuViewController.m
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 2/6/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainMenuViewController.h"

@implementation MainMenuViewController

- (IBAction)resumeGame:(id)sender{
    
    //Having trouble figuring out how to restore state of the previous view controller...
    //For now this button won't do anything.

}
- (IBAction)newGame:(id)sender{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *gameView = [storyBoard instantiateViewControllerWithIdentifier:@"GameplayView"];
    [self presentViewController:gameView animated:YES completion:nil];

}

@end
