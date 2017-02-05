//
//  WinnerViewController.m
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 2/5/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WinnerViewController.h"


@implementation WinnerViewController

-(IBAction)startNewGame:(id)sender{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *gameView = [storyBoard instantiateViewControllerWithIdentifier:@"GameplayView"];
    [self presentViewController:gameView animated:YES completion:nil];
    
}

@end
