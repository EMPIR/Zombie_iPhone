//
//  GameRules.m
//  ZombieGame
//
//  Created by David Guinnip on 4/26/10.


#import "GameLogic.h"
#import "SetPiece.h"
#import <stdio.h>
#import <stdlib.h>
#import <time.h>

@implementation GameLogic
//@synthesize seed;
BOOL seed = NO;

+(double) randomNumber
{
	/* initialize random seed: */
	if(!seed){
		srandom(time(NULL));
		seed = YES;
	}
		
	int r = random();
	double rd = r / (double) RAND_MAX;
	return rd;
}

+(int) randomNumber:(int) floor, int ceiling
{
	double r = [self randomNumber];
	
	double dret = ((r  * (ceiling - floor)));
	int ret = (int) round(dret);
	ret+=floor;
	
	return ret;
}







@end
