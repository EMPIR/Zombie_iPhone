//
//  ZombieGameAppDelegate.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.

#import "ZombieGameAppDelegate.h"
#import "GameMenu.h"
#import "Scores.h"
#import <AVFoundation/AVFoundation.h>
#import "StringConst.h"
#import "ZombieGameViewController.h";



@implementation ZombieGameAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize scores;
@synthesize databasePath, databaseName;
@synthesize audioPlayer; // the player object
@synthesize soundFX;
@synthesize volume;
@synthesize showHint;
@synthesize eatingSoundPlayer;
@synthesize crawlerDiff;
@synthesize berzerkDiff;
@synthesize theGame;



- (void)dealloc {
	[scores release];
    [viewController release];
    [window release];
    [audioPlayer release];
	[eatingSoundPlayer release];
	[databaseName release];
	[databasePath release];
	[super dealloc];
	
}
-(int) GetCrawlerLevel{
	return theGame.crawlerCurrentLevel;
}

-(void) SetCrawlerLevel:(int) index{
	theGame.crawlerCurrentLevel = index;
	[theGame drawCrawlerFinished];
}

-(BOOL) EligibleCrawlerBoard:(int) index
{
	if(index <= [self getCachedCrawlerDifficulty])
		return YES;
	return NO;
	
}

-(void) SetGame:(ZombieGameViewController *)c
{
	theGame = c;
}

-(id) init{
	if(self = [super init]){
		soundFX = YES;
		volume = 0.5;
		showHint = YES;
		crawlerDiff = 12;
		berzerkDiff = 44;
		
	}
	return self;
}
-(BOOL) tableHighScoresExists
{
	sqlite3 *database;
	
	BOOL ret = FALSE;
	// Open the database from the users filessytem
	NSLog(databasePath);
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "SELECT * FROM sqlite_master WHERE type='table' AND name='highScores'";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				ret =  TRUE;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
		
	return ret;
	
	
}


-(BOOL) tableLevelsExists
{
	sqlite3 *database;
	
	BOOL ret = FALSE;
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "SELECT * FROM sqlite_master WHERE type='table' AND name='levels'";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				ret =  TRUE;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
	
	return ret;
	
	
	
	
}





-(void) createTables {
	if(![self tableHighScoresExists])
	{
		sqlite3 *database;
		
		//BOOL ret = FALSE;
		// Open the database from the users filessytem
		if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
			// Setup the SQL Statement and compile it for faster access
			const char *sqlStatement = "CREATE TABLE highScores (id integer primary key, gameType integer, score integer, date double)";
			sqlite3_stmt *compiledStatement;
			if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
				// Loop through the results and add them to the feeds array
				if(SQLITE_DONE != sqlite3_step(compiledStatement)){
					NSAssert1(0, @"Error while deleting data. '%s'", sqlite3_errmsg(database));
				}
				else{
					//ret = TRUE;
					//SQLite provides a method to get the last primary key inserted by using sqlite3_last_insert_rowid
					//int ID = sqlite3_last_insert_rowid(database);
				}
				
			}
			// Release the compiled statement from memory
			sqlite3_finalize(compiledStatement);
			
		}
		sqlite3_close(database);
	}
	if(![self tableLevelsExists])
	{
		sqlite3 *database;
		
		//BOOL ret = FALSE;
		// Open the database from the users filessytem
		if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
			// Setup the SQL Statement and compile it for faster access
			const char *sqlStatement = "CREATE TABLE levels (level integer primary key, votes integer)";
			sqlite3_stmt *compiledStatement;
			if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
				// Loop through the results and add them to the feeds array
				if(SQLITE_DONE != sqlite3_step(compiledStatement)){
					NSAssert1(0, @"Error while deleting data. '%s'", sqlite3_errmsg(database));
				}
				else{
					//ret = TRUE;
					//SQLite provides a method to get the last primary key inserted by using sqlite3_last_insert_rowid
					//int ID = sqlite3_last_insert_rowid(database);
				}
				
			}
			// Release the compiled statement from memory
			sqlite3_finalize(compiledStatement);
			
		}
		sqlite3_close(database);
	}
}

-(void) deleteAllScores {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	//scores = [[NSMutableArray alloc] init];
	
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
	
	[self deleteCrawlerDifficulty];
	[self UnloadCachedCrawlerScores];
	
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
	NSLog(@"Database path: %@", databasePathFromApp);
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
	
//	[fileManager release];
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


-(int) getCrawlerPlacement:(int) score
{
	sqlite3 *database;
	
	int ret = 1;
	int i=1;
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores where gameType = 1 order by score asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _score = sqlite3_column_int(compiledStatement,2);
				
				if(score < _score)
				{
					ret = i;
					break;
				}
				i++;
				ret = i;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	return ret;
	
}


-(int) getCrawlerAverage:(int) score
{
	sqlite3 *database;
	
	
	int ret = 0;
	int i=0;
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores where gameType = 1 order by score asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _score = sqlite3_column_int(compiledStatement,2);
				
				if(score < _score)
				{
					ret = i;
					break;
				}
				ret += _score;
				i++;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
	if(i > 0)
		return ret / i;
	
	return ret;
	
}


-(int) getCrawlerTopFiveAverage
{
	sqlite3 *database;
	
	
	int ret = 0;
	int i=0;
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores where gameType = 1 order by score asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _score = sqlite3_column_int(compiledStatement,2);
				
				
				ret += _score;
				i++;
				if(i == 4)
					break;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
	if(i > 0)
		return ret / i;
	
	return ret;
	
}


-(int) getBerzerkPlacement:(int) score
{
	sqlite3 *database;
	
	int ret = 1;
	int i=1;
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from highScores where gameType = 2 order by score desc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _score = sqlite3_column_int(compiledStatement,2);
				
				if(score > _score)
				{
					ret = i;
					break;
				}
				
				i++;
				ret = i;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	return ret;
	
}


-(NSMutableArray *) getCrawlerTopScores
{
	sqlite3 *database;
	
	// Init the animals Array
	NSMutableArray *ret = [[[NSMutableArray alloc] init] autorelease];

	
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from levels order by level desc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _level = sqlite3_column_int(compiledStatement,0);
				NSDate *_date = [[[NSDate alloc] init] autorelease];
				Scores *score = [[Scores alloc] initWithData:0:1:_level:_date];
				//int _score = sqlite3_column_int(compiledStatement,1);
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




-(void) deleteCrawlerDifficulty {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	//scores = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "delete from levels";
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



-(int) getCrawlerDifficulty
{
	sqlite3 *database;
	int ret = 0;
	// Init the animals Array
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from levels order by level desc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				int _level = sqlite3_column_int(compiledStatement,0) + 1;
				//int _score = sqlite3_column_int(compiledStatement,1);
				ret = _level;
				break;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	crawlerDiff = ret;
	return ret;
}


-(int) getCrawlerMedal:(int) level
{
	int score = [self GetCachedCrawlerScore:level];
	if(score == -1)
	{
		return -1;
	}
	if(score <= 20)
		return 1;
	else if(score <=30)
		return 2;
	else if(score <=40)
		return 3;
	return -1; //too slow, no medal!
}

-(int) GetCachedCrawlerScore:(int) index
{
	return crawlerScores[index];
}

-(void) UnloadCachedCrawlerScores{
	for(int i=0;i<45;++i)
	{
		crawlerScores[i] = -1;
	}
}
-(void) LoadCachedCrawlerScores{
	for(int i=0;i<45;++i)
	{
		crawlerScores[i] = [self getCrawlerLevelVotes:i];
	}
}

-(int) getCrawlerLevelVotes:(int) level
{
	sqlite3 *database;
	int ret = -1;
	// Init the animals Array
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from levels where level = ?";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			sqlite3_bind_int(compiledStatement, 1, level);
			
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				//int _level = sqlite3_column_int(compiledStatement,0);
				int _score = sqlite3_column_int(compiledStatement,1);
				ret = _score;
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);

	return ret;
}



-(void) insertCrawlerDifficulty:(int) _level: (int) _score{
	crawlerScores[_level] = _score;
	// Setup the database object
	sqlite3 *database;
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		const char *sql = "insert into levels(level, votes) Values(?,?)";
		
		sqlite3_stmt *compiledStatement;
		
		if(sqlite3_prepare_v2(database, sql, -1, &compiledStatement, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
		
		sqlite3_bind_int(compiledStatement, 1, _level);
		sqlite3_bind_int(compiledStatement,2, _score);
		
		
		
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



-(void) updateCrawlerDifficulty:(int) _level: (int) _score{
	
	crawlerScores[_level] = _score;
	// Setup the database object
	sqlite3 *database;
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		const char *sql = "update levels set votes=? where level = ?";
		
		sqlite3_stmt *compiledStatement;
		
		if(sqlite3_prepare_v2(database, sql, -1, &compiledStatement, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
		
		sqlite3_bind_int(compiledStatement, 1, _score);
		sqlite3_bind_int(compiledStatement,2, _level);
		
		
		
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


-(int) getCachedCrawlerDifficulty{
	return crawlerDiff;
}

-(int) getBerzerkDifficulty{
	return berzerkDiff;
}

-(void) setCrawlerDifficulty:(int) level:(int)score
{
	crawlerDiff = level;
	
	[self insertCrawlerDifficulty:level:score];
}

-(void) setBerzerkDifficulty:(int) val
{
	berzerkDiff = val;
}

-(void) PlayEatingTrack{
	//NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/zombiesEating.mp3", [[NSBundle mainBundle] resourcePath]]];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:[StringConst GetImgConst:SND_EATING], [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
	[eatingSoundPlayer release];
	eatingSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	eatingSoundPlayer.numberOfLoops = -1;
	eatingSoundPlayer.volume = volume;
	if (eatingSoundPlayer == nil)
		NSLog(@"%",[error description]);				
	else 
		[eatingSoundPlayer play];
}

-(void) StopEatingTrack{
	if (eatingSoundPlayer != nil)
		[eatingSoundPlayer stop];
}

-(void) PlayNonGameTrack{
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:[StringConst GetImgConst:SND_NONGAME_TRACK], [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
	[audioPlayer release];
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	audioPlayer.volume = volume;
	if (audioPlayer == nil)
		NSLog(@"%",[error description]);				
	else 
		[audioPlayer play];
}

-(void) PlayCrawlerTrack{
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:[StringConst GetImgConst:SND_CRAWLER_TRACK], [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
	[audioPlayer release];
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	audioPlayer.volume = volume;
	if (audioPlayer == nil)
		NSLog(@"%",[error description]);				
	else 
		[audioPlayer play];
	
}

-(void) PlayBerzerkTrack{
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:[StringConst GetImgConst:SND_BERZERK_TRACK], [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
	[audioPlayer release];
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	audioPlayer.volume = volume;
	if (audioPlayer == nil)
		NSLog(@"%",[error description]);				
	else 
		[audioPlayer play];
	
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
	
	[self createTables];
	
	//NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Audio_BG02.mp3", [[NSBundle mainBundle] resourcePath]]];
	//NSError *error;
	//audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	//audioPlayer.numberOfLoops = -1;
	
	
	
	
	//if (audioPlayer == nil)
	//	NSLog(@"%",[error description]);				
	//else 
	//	[audioPlayer play];
	[self PlayNonGameTrack];

	// Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	// Now try to set the orientation to landscape (right)
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
	
	
	return YES;
}
-(void) ShowHint:(BOOL) val{
	showHint = val;
}
-(void) SoundFX:(BOOL)val{
	soundFX = val;
}
-(void) BackgroundVolume:(double) val{
	volume = val;
	audioPlayer.volume = volume;
}

-(void) PauseSound:(BOOL) val {
	if(val == YES)
		[audioPlayer pause];
	else {
		[audioPlayer play];
	}


}


@end
