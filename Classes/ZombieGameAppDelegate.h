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
@class ZombieGameViewController;

@interface ZombieGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
   GameMenu *viewController;
	
	ZombieGameViewController *theGame;
	
	// Database variables
	NSString *databaseName;
	NSString *databasePath;
	
	// Array to store the high scores objects
	NSMutableArray *scores;
	AVAudioPlayer *audioPlayer;
	AVAudioPlayer *eatingSoundPlayer;
	
	BOOL soundFX;
	double volume;
	BOOL showHint;
	int crawlerDiff;
	int berzerkDiff;
	int crawlerScores[45];
	
	
	
	
}

-(void) LoadCachedCrawlerScores;
-(int) GetCachedCrawlerScore:(int) index;
-(void) readScoresFromDatabase;
-(void) insertScore:(int) score : (int)gameType : (NSDate *) date;
-(void) deleteAllScores;
-(void) BackgroundVolume:(double) val;
-(void) SoundFX:(BOOL)val;
-(void) ShowHint:(BOOL) val;
-(void) PauseSound:(BOOL) val;
-(void) PlayNonGameTrack;
-(void) PlayCrawlerTrack;
-(void) PlayBerzerkTrack;
-(void) PlayEatingTrack;
-(void) StopEatingTrack;
-(int) getCrawlerPlacement:(int) score;
-(int) getCrawlerAverage:(int) score;
-(int) getCrawlerTopFiveAverage;
-(int) getBerzerkPlacement:(int) score;


-(NSMutableArray *) getCrawlerTopScores;
-(NSMutableArray *) getBerserkTopScores;


-(NSMutableArray *) getCrawlerTopScores;
-(NSMutableArray *) getBerserkTopScores;

-(int) getCrawlerMedal:(int) level;
-(int) getCachedCrawlerDifficulty;
-(int) getCrawlerDifficulty;
-(int) getBerzerkDifficulty;
-(void) setCrawlerDifficulty:(int) level : (int) score;
-(void) setBerzerkDifficulty:(int) val;
-(void) SetCrawlerLevel:(int) index;
-(int) GetCrawlerLevel;
-(void) SetGame:(ZombieGameViewController *)c;
-(BOOL) EligibleCrawlerBoard:(int)index;
//-(BOOL) createHSTable;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameMenu *viewController;
@property (nonatomic, retain) NSMutableArray *scores;
@property (nonatomic, retain) NSString *databasePath;
@property (nonatomic, retain) NSString *databaseName;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) AVAudioPlayer *eatingSoundPlayer;
@property (nonatomic, assign) ZombieGameViewController *theGame;


@property (nonatomic, assign) BOOL soundFX;
@property (nonatomic, assign) double volume;
@property (nonatomic, assign) BOOL showHint;

@property (nonatomic, assign) int crawlerDiff;
@property (nonatomic, assign) int berzerkDiff;

@end
