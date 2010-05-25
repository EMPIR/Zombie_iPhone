//
//  ZombieGameAppDelegate.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.


#import <UIKit/UIKit.h>
#import <sqlite3.h> // Import the SQLite database framework


//@class MainMenuViewController;
@class GameMenu;
@class AVAudioPlayer;


@interface ZombieGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
   GameMenu *viewController;
	
	// Database variables
	NSString *databaseName;
	NSString *databasePath;
	
	// Array to store the high scores objects
	NSMutableArray *scores;
	AVAudioPlayer *audioPlayer;
	
	BOOL soundFX;
	double volume;
	BOOL showHint;
	
	
	
}
-(void) readScoresFromDatabase;
-(void) insertScore:(int) score:(int)gameType:(NSDate *) date;
-(void) deleteAllScores;
-(void) BackgroundVolume:(double) val;
-(void) SoundFX:(BOOL)val;
-(void) ShowHint:(BOOL) val;
-(void) PlayNonGameTrack;
-(void) PlayCrawlerTrack;
-(void) PlayBerzerkTrack;


-(NSMutableArray *) getCrawlerTopScores;
-(NSMutableArray *) getBerserkTopScores;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameMenu *viewController;
@property (nonatomic, retain) NSMutableArray *scores;
@property (nonatomic, retain) NSString *databasePath;
@property (nonatomic, retain) NSString *databaseName;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, assign) BOOL soundFX;
@property (nonatomic, assign) double volume;
@property (nonatomic, assign) BOOL showHint;

@end

