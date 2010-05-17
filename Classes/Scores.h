//
//  Scores.h
//  ZombieGame
//
//  Created by David Guinnip on 5/11/10.


#import <Foundation/Foundation.h>


@interface Scores : NSObject {
	int id;
	int gameType;
	int score;
	NSDate *date;

}

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int gameType;
@property (assign, nonatomic) int score;
@property (copy,nonatomic) NSDate *date;

-(id)initWithData:(int) id:(int) gameType:(int) score:(NSDate *) date;

@end
