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
	
	[path release];
	
}



@end
