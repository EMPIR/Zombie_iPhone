//
//  GameMenu.h
//  ZombieGame
//
//  Created by David Guinnip on 5/13/10.


#import <UIKit/UIKit.h>
//#import "FBConnect.h"


@class MainMenuViewController;
@class HighScoresViewController;
@class OptionsViewController;


@interface GameMenu : UIViewController{
	
	
	MainMenuViewController *viewController;
	HighScoresViewController *highScoresViewController;
	OptionsViewController *optionsViewController;
}

@property (nonatomic, retain) IBOutlet MainMenuViewController *viewController;
@property (nonatomic, retain) IBOutlet HighScoresViewController *highScoresViewController;
@property (nonatomic, retain) IBOutlet OptionsViewController *optionsViewController;

-(IBAction) playGame:(id) sender;
-(IBAction) playDemo:(id) sender;
-(IBAction) highScores:(id) sender;
-(IBAction) options:(id) sender;

@end
