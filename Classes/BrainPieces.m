//
//  BrainPieces.m
//  ZombieGame
//
//  Created by David Guinnip on 5/25/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "BrainPieces.h"
#import "BrainPiece.h"
#import "GameLogic.h"
@implementation BrainPieces
@synthesize pieces;



/// <summary>
/// Creates the set of total pieces into an array
/// </summary>
+(NSMutableArray *) CreatePieces{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	for (int i = 1; i <= 150; ++i)
	{
		NSString *imagestr = [[[NSString alloc]init]autorelease]; 
		imagestr = [NSString stringWithFormat:@"brains_%d.png", i % 30];
		int speed = [GameLogic randomNumber:1,50];
		int x = [GameLogic randomNumber:1,459];
		int y = [GameLogic randomNumber:1,300];
		int width = [GameLogic randomNumber:10,50];
		int height = width * 0.66666667;
		
		BrainPiece *p = [[BrainPiece alloc] initPiece:speed:x:y:width:height:imagestr];
		[p randomize];
		
		[ret addObject:(BrainPiece *)p];
		[p release];
	}
	return ret;
}
@end
