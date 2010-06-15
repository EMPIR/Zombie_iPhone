//
//  Zombie.m
//  ZombieGame
//
//  Created by David Guinnip on 5/14/10.


#import "ZombieAudio.h"
#import "GameLogic.h"

@implementation ZombieAudio

/*
 zombieID = 0,1,2, or 3 -- 0 = Synth, 1 = Baldy, 2 = Menza, 3 = Nerd
*/

/*
Input: 
 1 = expression
 2 = happy
 3 = mad
 4 = wrong
 5 = your great
 6 = start game
 7 = end game
 */

/*
 OUTPUT:
 expressionID 0-1				"wrong.wav"
 expressionID 0-2				"correct.wav"
 expressionID 0-3				"wilhelm.wav"
 expressionID 0-4				"ShotGun_pumps.wav"
expressionID 0-5				"Game_Start.wav"
 expressionID 0-6				"brainExplode.wav"
 # [1] ~zombieID
 expressionID 1-5			    "[1]1.wav" - "[1]5.wav"
 expressionID Happy/BRAINS!		"[1]6.wav"
 expressionID Mad/STOP!			"[1]7.wav"
 expressionID Wrong!			"[1]8.wav"
 expressionID You are Good!		"[1]9.wav"
 expressionID Let's Go!			"[1]10.wav"
 expressionID Goodbye!			"[1]11.wav"	
 */
/*static int TOTAL_EXPRESSIONS  = 2;

+(NSString *) getZombieAudioFile:(int) zombieID: (int) expression
{
	//return [NSString stringWithFormat:@"/clip_crept.mp3"];
	int number;
	if(zombieID == 0){
		if(expression ==1)
			return NSString *ret = [[NSString stringWithFormat:@"/audio/wrong.wav"] autorelease];
		if(expression ==2)
			return NSString *ret = [[NSString stringWithFormat:@"/audio/wrong.wav"] autorelease];
		if(expression ==3)
			return NSString *ret = [[NSString stringWithFormat:@"/audio/wrong.wav"] autorelease];
		//number = [GameLogic randomNumber:1,TOTAL_EXPRESSIONS];
	}
	else {
		if(expression == 1)
			return NSString *ret = [[NSString stringWithFormat:@"/audio/wrong.wav"] autorelease];
		else
			return NSString *ret = [[NSString stringWithFormat:@"/audio/correct.wav"] autorelease];
	}

	
	NSString *ret = [[NSString stringWithFormat:@"/audio/%d_%d.wav", zombieID,number] autorelease];
	NSLog(@"%",ret);
	int f = 0;
	return ret;
	
}
*/

static int TOTAL_EXPRESSIONS  = 5;

+(NSString *) getZombieAudioFile:(int) zombieID: (int) expression
{
	//return [NSString stringWithFormat:@"/clip_crept.mp3"];
	//return [NSString stringWithFormat:@"/15.wav"];
	
	int number = [GameLogic randomNumber:1,TOTAL_EXPRESSIONS];
	if(zombieID == -1)
	   return [[NSString stringWithFormat:@"/brainPump.wav"] autorelease];
	else if(zombieID == 0){
		if(expression ==1)
			return [[NSString stringWithFormat:@"/wrong.wav"] autorelease];
		if(expression ==2)
			return [[NSString stringWithFormat:@"/correct.wav"] autorelease];
		if(expression == 3)
			return [[NSString stringWithFormat:@"/wilhelm.wav"] autorelease];
		if(expression == 4)
			return [[NSString stringWithFormat:@"/ShotGun_pumps.wav"] autorelease];
		if(expression == 5)
			return [[NSString stringWithFormat:@"/Game_Start_faster.wav"] autorelease];
		if(expression == 6)
			return [[NSString stringWithFormat:@"/brainExplode.wav"] autorelease];
		//number = [GameLogic randomNumber:1,TOTAL_EXPRESSIONS];
	}
	else {
		if(expression == 1)
			return  [[NSString stringWithFormat:@"/%d%d.wav", zombieID,number] autorelease];
		else if(expression == 2)
			return  [[NSString stringWithFormat:@"/%d6.wav", zombieID] autorelease];
		else if(expression == 3)
			return  [[NSString stringWithFormat:@"/%d7.wav", zombieID] autorelease];
		else if(expression == 4)
			return  [[NSString stringWithFormat:@"/%d8.wav", zombieID] autorelease];
		else if(expression == 5)
			return  [[NSString stringWithFormat:@"/%d9.wav", zombieID] autorelease];
		else if(expression == 6)
		{//start game
			int number = [GameLogic randomNumber:10,14];
			return  [[NSString stringWithFormat:@"/%d%d.wav", zombieID,number] autorelease];
		}
		


	}
	
	return NULL;
}




@end
