//
//  ZombieGameAppDelegate.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.


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
-(void) readScoresFromDatabase;
-(void) insertScore:(int) score:(int)gameType:(NSDate *) date;
-(void) deleteAllScores;

-(NSMutableArray *) getCrawlerTopScores;
-(NSMutableArray *) getBerserkTopScores;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameMenu *viewController;
@property (nonatomic, retain) NSMutableArray *scores;
@property (nonatomic, retain) NSString *databasePath;
@property (nonatomic, retain) NSString *databaseName;



@end

