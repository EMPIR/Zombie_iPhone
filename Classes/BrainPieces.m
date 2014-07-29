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
#import "StringConst.h"
@implementation BrainPieces
@synthesize pieces;



/// <summary>
/// Creates the set of total pieces into an array
/// </summary>
+(NSMutableArray *) CreatePieces{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	for (int i = 1; i <= 60; ++i)
	{
		NSString *imagestr;// = [[[NSString alloc]init]autorelease]; 
		imagestr = [NSString stringWithFormat:[StringConst GetImgConst:IMG_BRAINS], i % 30];
		int speed = [GameLogic randomNumber:1:5];
		UIImage *image = [UIImage imageNamed:imagestr];
#ifdef IPAD	
		int width = [GameLogic randomNumber:20:80];
		int height = width * (image.size.height / image.size.width);
		int x = [GameLogic randomNumber:1:1024 - width]; //480
		int y = [GameLogic randomNumber:1:768 - height]; //320
#else
		int width = [GameLogic randomNumber:10:50];
		int height = width * (image.size.height / image.size.width);
		
		int x = [GameLogic randomNumber:1:480 - width]; //480
		int y = [GameLogic randomNumber:1:320 - height]; //320
#endif		
		//y = 1;
		//speed = 0;
		BrainPiece *p = [[BrainPiece alloc] initPiece:speed:x:y:width:height:imagestr];
		
		
		[ret addObject:(BrainPiece *)p];
		[p release];
	}
	return ret;
}
@end
