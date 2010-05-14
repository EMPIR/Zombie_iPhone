//
//  ZombieGameAppDelegate.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h> // Import the SQLite database framework


//@class MainMenuViewController;
@class GameMenu;

@interface ZombieGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
   GameMenu *viewController;
	
	// Database variables
	NSString *databaseName;
	NSString *databasePath;
	
	// Array to store the high scores objects
	NSMutableArray *scores;
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameMenu *viewController;
@property (nonatomic, retain) NSMutableArray *scores;


@end

