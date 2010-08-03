//
//  MainMenuViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/4/10.


#import <UIKit/UIKit.h>

@class ZombieGameViewController;
@class HowToPlayViewController;
@class CrawlerLevelsViewController;
@class SetGame;


@interface MainMenuViewController : UIViewController {
	ZombieGameViewController *viewController;
	CrawlerLevelsViewController *crawlerLevelsController;
	HowToPlayViewController *howToPlayController;
	SetGame *setGame;
}
@property (nonatomic, retain) SetGame *setGame;
@property (nonatomic, retain) IBOutlet ZombieGameViewController *viewController;
@property (nonatomic, retain) IBOutlet HowToPlayViewController *howToPlayController;
@property (nonatomic, retain) IBOutlet CrawlerLevelsViewController *crawlerLevelsController;

-(IBAction) play:(id) sender;

-(IBAction) playRamero:(id) sender;

-(IBAction) howToPlay:(id) sender;

-(IBAction) mainMenu:(id) sender;




@end
