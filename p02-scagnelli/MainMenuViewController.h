//
//  MainMenuViewController.h
//  p02-scagnelli
//
//  Created by Eric Scagnelli on 2/6/17.
//  Copyright © 2017 escagne1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *continueBtn;
@property (strong, nonatomic) IBOutlet UIButton *newgameBtn;

- (IBAction)newGame:(id)sender;

@end
