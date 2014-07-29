//
//  Zombie.m
//  ZombieGame
//
//  Created by David Guinnip on 5/14/10.


#import "ZombieAudio.h"
#import "GameLogic.h"
#import "StringConst.h"

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
#ifndef DOGHOUSE
static int TOTAL_EXPRESSIONS  = 5;
#else
static int TOTAL_EXPRESSIONS  = 2;
#endif


+(NSString *) getZombieAudioFile:(int) zombieID : (int) expression
{
	
	int number = [GameLogic randomNumber:1:TOTAL_EXPRESSIONS];
	if(zombieID == -1)
		return [NSString stringWithFormat:[StringConst GetImgConst:SND_BRAIN_PUMP]];
	else if(zombieID == 0){
		if(expression ==1)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_WRONG]];
		if(expression ==2)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_CORRECT]];
		if(expression == 3)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_SCREAM]];
		if(expression == 4)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_SHOTGUN]];
		if(expression == 5)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_GAME_START]];
		if(expression == 6)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_BRAIN_EXPLODE]];
#ifdef DOGHOUSE		
		if(expression == 7)
			return [NSString stringWithFormat:[StringConst GetImgConst:SND_MEOW]];
#endif			
		//number = [GameLogic randomNumber:1,TOTAL_EXPRESSIONS];
	}
	else {
		if(expression == 1)
			return  [NSString stringWithFormat:[StringConst GetImgConst:SND_ZOMBIE_EXP_1], zombieID,number];
		else if(expression == 2)
			return  [NSString stringWithFormat:[StringConst GetImgConst:SND_ZOMBIE_EXP_2], zombieID];
		else if(expression == 3)
			return  [NSString stringWithFormat:[StringConst GetImgConst:SND_ZOMBIE_EXP_3], zombieID];
		else if(expression == 4)
			return  [NSString stringWithFormat:[StringConst GetImgConst:SND_ZOMBIE_EXP_4], zombieID];
		else if(expression == 5)
			return  [NSString stringWithFormat:[StringConst GetImgConst:SND_ZOMBIE_EXP_5], zombieID];		
		else if(expression == 6)
		{//start game
			int number = [GameLogic randomNumber:10:14];
			return  [NSString stringWithFormat:[StringConst GetImgConst:SND_ZOMBIE_EXP_1], zombieID,number];
		}
		


	}
	
	return NULL;
}




@end
