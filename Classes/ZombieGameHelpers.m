//
//  ZombieGameHelpers.m
//  ZombieGame
//
//  Created by David Guinnip on 5/27/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "ZombieGameHelpers.h"
#import "ZombieAudio.h"
#import "ZombieGameAppDelegate.h"
#import "ZombieGameMenuViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <CoreGraphics/CoreGraphics.h>

@implementation ZombieGameHelpers

+(void) playSound:(int) pieceID:(int) expression {
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	if(!appDelegate.soundFX)
		return;
	
	
	NSString *filename = [[ZombieAudio getZombieAudioFile:pieceID:expression] retain];
	//Get the filename of the sound file:
	NSString *path;
	
	
	path = [NSString stringWithFormat:@"%@%@",
			[[NSBundle mainBundle] resourcePath],
			filename];
	
	
	
	
	NSLog(@"%",path);
	
	//declare a system sound id
	SystemSoundID soundID;
	
	//Get a URL for the sound file
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	//Use audio sevices to create the sound
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
	
	//Use audio services to play the sound
	AudioServicesPlaySystemSound(soundID);
	//[filename release];
	
}

/*
-(UIButton *) getButton:(int) val
{
	if( val == 0)
		return ZombieGameViewController.button1;
	if(val == 1)
		return ZombieGameViewController.button2;
	if(val == 2)
		return ZombieGameViewController.button3;
	if(val == 3)
		return ZombieGameViewController.button4;
	if(val == 4)
		return ZombieGameViewController.button5;
	if(val == 5)
		return ZombieGameViewController.button6;
	if(val == 6)
		return ZombieGameViewController.button7;
	if(val == 7)
		return ZombieGameViewController.button8;
	if(val == 8)
		return ZombieGameViewController.button9;
	if(val == 9)
		return ZombieGameViewController.button10;
	if(val == 10)
		return ZombieGameViewController.button11;
	if(val == 11)
		return ZombieGameViewController.button12;
	
	return NULL;
}
-(UIImageView *) getBrains:(int) val
{
	if( val == 0)
		return ZombieGameViewController.m_brainView1;
	if(val == 1)
		return ZombieGameViewController.m_brainView2;
	if(val == 2)
		return ZombieGameViewController.m_brainView3;
	if(val == 3)
		return ZombieGameViewController.m_brainView4;
	if(val == 4)
		return ZombieGameViewController.m_brainView5;
	if(val == 5)
		return ZombieGameViewController.m_brainView6;
	if(val == 6)
		return ZombieGameViewController.m_brainView7;
	if(val == 7)
		return ZombieGameViewController.m_brainView8;
	if(val == 8)
		return ZombieGameViewController.m_brainView9;
	if(val == 9)
		return ZombieGameViewController.m_brainView10;
	
	if( val == 10)
		return ZombieGameViewController.m_brainView11;
	if(val == 11)
		return ZombieGameViewController.m_brainView12;
	if(val == 12)
		return ZombieGameViewController.m_brainView13;
	if(val == 13)
		return ZombieGameViewController.m_brainView14;
	if(val == 14)
		return ZombieGameViewController.m_brainView15;
	if(val == 15)
		return ZombieGameViewController.m_brainView16;
	if(val == 16)
		return ZombieGameViewController.m_brainView17;
	if(val == 17)
		return ZombieGameViewController.m_brainView18;
	if(val == 18)
		return ZombieGameViewController.m_brainView19;
	if(val == 19)
		return ZombieGameViewController.m_brainView20;
	
	if( val == 20)
		return ZombieGameViewController.m_brainView21;
	if(val == 21)
		return ZombieGameViewController.m_brainView22;
	if(val == 22)
		return ZombieGameViewController.m_brainView23;
	if(val == 23)
		return ZombieGameViewController.m_brainView24;
	if(val == 24)
		return ZombieGameViewController.m_brainView25;
	if(val == 25)
		return ZombieGameViewController.m_brainView26;
	if(val == 26)
		return ZombieGameViewController.m_brainView27;
	if(val == 27)
		return ZombieGameViewController.m_brainView28;
	if(val == 28)
		return ZombieGameViewController.m_brainView29;
	if(val == 29)
		return ZombieGameViewController.m_brainView30;
	
	return NULL;
	
}

-(UIImageView *) getView:(int) val
{
	if( val == 0)
		return ZombieGameViewController.selected1View;
	if(val == 1)
		return ZombieGameViewController.selected2View;
	if(val == 2)
		return ZombieGameViewController.selected3View;
	if(val == 3)
		return ZombieGameViewController.selected4View;
	if(val == 4)
		return ZombieGameViewController.selected5View;
	if(val == 5)
		return ZombieGameViewController.selected6View;
	if(val == 6)
		return ZombieGameViewController.selected7View;
	if(val == 7)
		return ZombieGameViewController.selected8View;
	if(val == 8)
		return ZombieGameViewController.selected9View;
	if(val == 9)
		return ZombieGameViewController.selected10View;
	if(val == 10)
		return ZombieGameViewController.selected11View;
	if(val == 11)
		return ZombieGameViewController.selected12View;
	return NULL;
}

-(UIImageView *) getHint:(int) val
{
	if( val == 0)
		return ZombieGameViewController.hint1View;
	if(val == 1)
		return ZombieGameViewController.hint2View;
	if(val == 2)
		return ZombieGameViewController.hint3View;
	if(val == 3)
		return ZombieGameViewController.hint4View;
	if(val == 4)
		return ZombieGameViewController.hint5View;
	if(val == 5)
		return ZombieGameViewController.hint6View;
	if(val == 6)
		return ZombieGameViewController.hint7View;
	if(val == 7)
		return ZombieGameViewController.hint8View;
	if(val == 8)
		return ZombieGameViewController.hint9View;
	if(val == 9)
		return ZombieGameViewController.hint10View;
	if(val == 10)
		return ZombieGameViewController.hint11View;
	if(val == 11)
		return ZombieGameViewController.hint12View;
	return NULL;
}
*/

@end
