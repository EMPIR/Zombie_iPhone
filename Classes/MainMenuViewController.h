//
//  MainMenuViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/4/10.


#import <UIKit/UIKit.h>

@class ZombieGameViewController;
@class SetGame;


@interface MainMenuViewController : UIViewController {
	ZombieGameViewController *viewController;
	SetGame *setGame;
}
@property (nonatomic, retain) SetGame *setGame;
@property (nonatomic, retain) IBOutlet ZombieGameViewController *viewController;


-(IBAction) play:(id) sender;

-(IBAction) playRamero:(id) sender;

-(IBAction) mainMenu:(id) sender;

@end
