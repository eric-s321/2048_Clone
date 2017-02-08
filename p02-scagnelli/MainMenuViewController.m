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
@synthesize continueBtn, newgameBtn;

static bool existingGame = NO;

- (void)viewDidLoad{
    
    newgameBtn.layer.cornerRadius = 10;
    continueBtn.layer.cornerRadius = 10;
    
    if(existingGame){
        continueBtn.enabled = YES;
        continueBtn.alpha = 1;
    }
    else{
        continueBtn.enabled = NO;
        continueBtn.alpha = .5;
    }
    

}

- (IBAction)newGame:(id)sender{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *gameView = [storyBoard instantiateViewControllerWithIdentifier:@"GameplayView"];
    existingGame = YES;
    [self presentViewController:gameView animated:YES completion:nil];
}

@end
