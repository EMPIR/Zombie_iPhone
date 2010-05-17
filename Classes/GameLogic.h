//
//  GameRules.h
//  ZombieGame
//
//  Created by David Guinnip on 4/26/10.


#include <stdlib.h>

@interface GameLogic : NSObject {
	//BOOL seed;
}

//returns a randomNumber between [0.0-1.0]
+(double) randomNumber;

//returns a rundom number between the specidied bounds
+(int) randomNumber:(int) floor, int ceiling;

//@property (nonatomic,assign) BOOL seed;

@end
