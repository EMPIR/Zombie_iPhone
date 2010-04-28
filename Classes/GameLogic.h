//
//  GameRules.h
//  ZombieGame
//
//  Created by David Guinnip on 4/26/10.
//  Copyright 2010 ArchVision. All rights reserved.
//
#include <stdlib.h>

@interface GameLogic : NSObject {
	BOOL flipper;
}

-(double) randomNumber;

@property (nonatomic,assign) BOOL flipper;

@end
