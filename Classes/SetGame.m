//
//  SetGame.m
//  ZombieGame
//
//  Created by David Guinnip on 5/4/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "SetGame.h"
#import "SetLogic.h"



@implementation SetGame
@synthesize match,state,pieces,matches,count, startDate,currentMove, finishedDate, totalMoves, totalPieces, gameType;
@synthesize selection_a,selection_b,selection_c;
@synthesize gameTime, currentTime, setsComplete;
@synthesize pressed_state, isActive;


typedef enum GameType
{
	Normal = 1,
	Countdown = 2,
	Hard = 3
}Game;


-(BOOL) isFinished{
	if(gameType == 1)
	{
		if(currentMove < totalMoves)
			return NO;
	}
	if(gameType == 2)
	{
		if(currentTime < gameTime)
			return NO;
	}
	return YES;
}

-(id) init{
	if(self = [super init]){
		gameType = 2;
		totalPieces = 27;
		pieces = [[SetLogic CreateMediumPieces] retain];
		state = [[SetLogic CreateState:pieces:totalPieces] retain];
		
	
		matches = [[SetLogic ContainsMatch:pieces:state] retain];
		startDate = [[NSDate date] retain];
		count = 0;
		totalMoves = 10;
		currentMove = 0;
		selection_a = -1;
		selection_b = -1;
		selection_c = -1;
		setsComplete = 0;
		gameTime = 60; //seconds
		currentTime = 0;
		pressed_state = [[[NSMutableArray alloc] init] retain];
		for(int i=0;i<12; ++i)
		{
			NSNumber *ns = [NSNumber numberWithInt:0];
			[pressed_state addObject: ns];
			
			
		}
		isActive = NO;
	}
	return self;
}

-(NSMutableArray *) getMatch
{
	return [SetLogic GetMatchIndices:pieces:state];
	
}

-(void) newGame:(int) gt{
	
	gameType = gt;
	selection_a = selection_b = selection_c = -1;
	totalPieces = 27;
	[SetLogic CreateState:pieces:state:totalPieces];
	startDate = [[NSDate date] retain];
	count = 0;
	totalMoves = 10;
	currentMove = 0;
	selection_a = -1;
	selection_b = -1;
	selection_c = -1;
	setsComplete = 0;
	gameTime = 60; //seconds
	currentTime = 0;
	
	isActive = NO;
	
}

-(BOOL) move:(int) a:(int) b: (int) c{
	if([SetLogic ContainsMatch:[pieces objectAtIndex:a]:[pieces objectAtIndex:b]:[pieces objectAtIndex:c]])
	{
		return YES;
	}
	return NO;

}

-(BOOL) moveReady{
	NSLog(@"Move Ready?");
	if(count == 3)
	{
		return YES;
	}
	return NO;
}


-(BOOL) makeMove{
	int a = [[state objectAtIndex:selection_a-1] intValue];
	int b = [[state objectAtIndex:selection_b-1] intValue];
	int c = [[state objectAtIndex:selection_c-1] intValue];
	
	NSLog(@"Making Move %d %d %d", a,b,c);
	
	
	count = 0;
	BOOL ret = [self move:a:b:c];
	return ret;
}


//returns true if the press was added
-(BOOL) onPress:(int) button
{
	if(count == 0)
	{
		selection_a = button;
		count ++;
		NSLog(@"count = %d, selection a = %d", count, selection_a);
		return YES;
	}
	if(count == 1)
	{
		if(selection_a == button)
		{
			selection_a = -1;
			count --;
			NSLog(@"count = %d, selection a = %d", count, selection_a);
			return NO;
		}
		else {
			selection_b = button;
			count ++;
			NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
			return YES;
		}
	}
	else if(count ==2)
	{
		if(selection_a == button)
		{
			selection_a = selection_b;
			selection_b = -1;
			count --;
			NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
			return NO;
		}
		else if(selection_b == button)
		{
			selection_b = -1;
			count --;
			NSLog(@"count = %d", count);
			return NO;
		}
		else {
			selection_c = button;
			count ++;
			NSLog(@"count = %d, selection a = %d, selection b = %d, selection c = %d", count,selection_a,selection_b,selection_c);
			return YES;
			
		}
		
	}
	else if(count == 3)
	{
		if(selection_a == button)
		{
			selection_a = selection_b;
			selection_b = selection_c;
			selection_c = -1;
			count --;
			NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
			return NO;
		}
		else if(selection_b == button)
		{
			selection_b = selection_c;
			selection_c = -1;
			count --;
			NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
			return NO;
		}
		else if(selection_c == button)
		{
			selection_c = -1;
			count --;
			NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
			return NO;
		}
		
	}
	NSLog(@"count = %d", count);
	return NO;
}

-(void) SwitchPieces{
	

	[SetLogic GetNewPieces:selection_a-1:selection_b-1:selection_c-1:state:pieces:totalPieces];
	
	selection_a = selection_b = selection_c = -1;
	
	
	
}

-(void) GameLoop{
	NSLog(@"Game Loop start");
	
	NSLog(@"Game Loop end");
}

-(void) dealloc{
	[super dealloc];
	[state release];
	[pieces release];
	[matches release];
	[startDate release];
	[finishedDate release];
	[pressed_state release];
}
@end
