//
//  Scores.m
//  ZombieGame
//
//  Created by David Guinnip on 5/11/10.

#import "Scores.h"

@implementation Scores

@synthesize id,gameType,score,date;

-(id)initWithData:(int) _id : (int) _gameType : (int) _score : (NSDate *) _date{
	
	if(self = [super init]){
		self.id = _id;
		self.gameType = _gameType;
		self.score = _score;
		self.date = _date;
	}
	return self;
}

@end
