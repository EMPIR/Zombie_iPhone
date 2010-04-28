//
//  GameRules.m
//  ZombieGame
//
//  Created by David Guinnip on 4/26/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "GameLogic.h"


@implementation GameLogic
@synthesize flipper;


-(double) randomNumber
{
	int r = random();
	double rd = r / (double) RAND_MAX;
	return rd;
}



@end
