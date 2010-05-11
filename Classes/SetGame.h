//
//  SetGame.h
//  ZombieGame
//
//  Created by David Guinnip on 5/4/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

//#import <Cocoa/Cocoa.h>


@interface SetGame : NSObject {
	NSMutableArray *state;
	NSMutableArray *pieces;
	NSMutableArray *matches;
	NSMutableArray *pressed_state;
	int count;
	BOOL match;
	int currentMove;
	int totalMoves;
	int totalPieces;
	int gameType;
	int setsComplete;
	int gameTime;
	int currentTime;
	
	int selection_a;
	int selection_b;
	int selection_c;

	
	
	NSDate *startDate;
	NSDate *finishedDate;
	
}

@property (assign, nonatomic) NSMutableArray *state;
@property (assign, nonatomic) NSMutableArray *pieces;
@property (assign, nonatomic) NSMutableArray *matches;
@property (assign, nonatomic) NSMutableArray *pressed_state;
@property (assign, nonatomic) BOOL match;
@property (assign, nonatomic) int count;
@property (copy,nonatomic) NSDate *startDate;
@property (copy,nonatomic) NSDate *finishedDate;
@property (assign, nonatomic) int currentMove;
@property (assign, nonatomic) int totalMoves;
@property (assign, nonatomic) int totalPieces;
@property (assign, nonatomic) int gameType;

@property (assign, nonatomic) int selection_a;
@property (assign, nonatomic) int selection_b;
@property (assign, nonatomic) int selection_c;



@property (assign, nonatomic) int setsComplete;
@property (assign, nonatomic) int gameTime;
@property (assign, nonatomic) int currentTime;

-(BOOL) move:(int) a:(int) b: (int) c;

-(BOOL) makeMove;
-(NSMutableArray *) getMatch;
-(void) newGame:(int)gameType;
//this should be called when a button is pressed.
//It returns true if the button pressed resulted
//in a new selection.  If false, the button was already
//pressed and is removed from the selection candidates
-(BOOL) onPress:(int) button;
-(BOOL) isFinished;
-(void) SwitchPieces;
-(void) GameLoop;

@end
