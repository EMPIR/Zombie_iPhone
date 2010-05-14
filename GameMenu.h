//
//  GameMenu.h
//  ZombieGame
//
//  Created by David Guinnip on 5/13/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;
@class HighScoresViewController;

@interface GameMenu : UIViewController {
	MainMenuViewController *viewController;
	HighScoresViewController *highScoresViewController;
}

@property (nonatomic, retain) IBOutlet MainMenuViewController *viewController;
@property (nonatomic, retain) IBOutlet HighScoresViewController *highScoresViewController;


-(IBAction) playGame:(id) sender;
-(IBAction) playDemo:(id) sender;
-(IBAction) highScores:(id) sender;

@end
