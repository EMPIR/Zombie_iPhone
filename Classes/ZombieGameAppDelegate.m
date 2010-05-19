//
//  ZombieGameAppDelegate.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.

#import "ZombieGameAppDelegate.h"
#import "GameMenu.h"
#import "Scores.h"
#import <AVFoundation/AVFoundation.h>


@implementation ZombieGameAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize scores;
@synthesize databasePath, databaseName;
@synthesize audioPlayer; // the player object
@synthesize soundFX;


- (void)dealloc {
	[scores release];
    [viewController release];
    [window release];
    [audioPlayer release];
	[super dealloc];
	
}

-(id) init{
	if(self = [super init]){
		soundFX = YES;
		
	}
	return self;
}



-(void) deleteAllScores {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	scores = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "delete from highScores";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
		}
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			NSAssert1(0, @"Error while deleting data. '%s'", sqlite3_errmsg(database));
		}
		else{
			//SQLite provides a method to get the last primary key inserted by using sqlite3_last_insert_rowid
			//int ID = sqlite3_last_insert_rowid(database);
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
}


-(void) checkAndCreateDatabase{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
	
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	//NSLog(@"%",databasePath);
	NSLog(@"Database path: %@", databasePath);
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
	
	// If the database already exists then return without doing anything
	if(success) 
	{
		
		return;
	}
	// If not then proceed to copy the database from the application to the users filesystem
	
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
	
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
	
	[fileManager release];
}

-(void) readScoresFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	scores = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _id = sqlite3_column_int(compiledStatement,0);
				int _gameType = sqlite3_column_int(compiledStatement,1);
				int _score = sqlite3_column_int(compiledStatement,2);
				NSDate *_date = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 3)];
				
				/*NSString *aName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *aDescription = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				NSString *aImageUrl = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				*/
				// Create a new animal object with the data from the database
				Scores *score = [[Scores alloc] initWithData:_id:_gameType:_score:_date];
				// Add the animal object to the animals Array
				[scores addObject:score];
				
				[score release];
				 
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
}




-(NSMutableArray *) getCrawlerTopScores
{
	sqlite3 *database;
	
	// Init the animals Array
	NSMutableArray *ret = [[[NSMutableArray alloc] init] autorelease];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores where gameType = 1 order by score asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _id = sqlite3_column_int(compiledStatement,0);
				int _gameType = sqlite3_column_int(compiledStatement,1);
				int _score = sqlite3_column_int(compiledStatement,2);
				NSDate *_date = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 3)];
				
				/*NSString *aName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				 NSString *aDescription = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				 NSString *aImageUrl = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				 */
				// Create a new animal object with the data from the database
				Scores *score = [[Scores alloc] initWithData:_id:_gameType:_score:_date];
				// Add the animal object to the animals Array
				
					[ret addObject:score];
				
				[score release];
				
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	return ret;
}

-(NSMutableArray *) getBerserkTopScores
{
	sqlite3 *database;
	
	// Init the animals Array
	NSMutableArray *ret = [[[NSMutableArray alloc] init] autorelease];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores where gameType = 2 order by score desc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _id = sqlite3_column_int(compiledStatement,0);
				int _gameType = sqlite3_column_int(compiledStatement,1);
				int _score = sqlite3_column_int(compiledStatement,2);
				NSDate *_date = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 3)];
				
				/*NSString *aName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				 NSString *aDescription = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				 NSString *aImageUrl = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				 */
				// Create a new animal object with the data from the database
				Scores *score = [[Scores alloc] initWithData:_id:_gameType:_score:_date];
				// Add the animal object to the animals Array
				
					[ret addObject:score];
				
				[score release];
				
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	return ret;
}
-(void) insertScore:(int) score:(int)gameType:(NSDate *) date{
	// Setup the database object
	sqlite3 *database;

	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		const char *sql = "insert into highScores(score, gameType,date) Values(?, ?, ?)";
		sqlite3_stmt *compiledStatement;
		
		if(sqlite3_prepare_v2(database, sql, -1, &compiledStatement, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
		
		sqlite3_bind_int(compiledStatement, 1, score);
		sqlite3_bind_int(compiledStatement,2,gameType);
		sqlite3_bind_double(compiledStatement, 3,[date timeIntervalSince1970]);
		
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
		}
		else{
			//SQLite provides a method to get the last primary key inserted by using sqlite3_last_insert_rowid
			//int ID = sqlite3_last_insert_rowid(database);
		}
		//Reset the add statement.
		sqlite3_reset(compiledStatement);		
	}
	sqlite3_close(database);
	
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
	
	// Setup some globals
	databaseName = [@"Data.db" retain];
	
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	databasePath = [[documentsDir stringByAppendingPathComponent:databaseName] retain];
	
	// Execute the "checkAndCreateDatabase" function
	[self checkAndCreateDatabase];
	
	// Query the database for all animal records and construct the "scores" array
	[self readScoresFromDatabase];
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Audio_BG01.mp3", [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	audioPlayer.volume = 0.5;
	
	
	
	if (audioPlayer == nil)
		NSLog(@"%",[error description]);				
	else 
		[audioPlayer play];


	// Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	// Now try to set the orientation to landscape (right)
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
	
	
	return YES;
}

-(void) SoundFX:(BOOL)val{
	soundFX = val;
}
-(void) BackgroundVolume:(double) val{
	audioPlayer.volume = val;
}




@end
