//
//  HowToPlayViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 5/17/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "HowToPlayViewController.h"
#import "SetLogic.h"
#import "SetPiece.h"
#import "StringConst.h"
#import "GameLogic.h"
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "ZombieGameAppDelegate.h"
#import "ZombieAudio.h"
#import "StringConst.h"
#import "ZombieGameHelpers.h"


@implementation HowToPlayViewController
@synthesize button1, button2, button3, scrollView;
@synthesize textView;

-(IBAction) backMainMenu:(id) sender
{
	[[self parentViewController] dismissModalViewControllerAnimated:NO];
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef 	SEASONHOUSE
	textView.text = @"In the game House, each card has three Features: Shape, Color, and Shade.\n\nYou make a Match by selecting 3 Cards. A correct answer will have all the same or all different values for each feature.\nClick the cards to the right to generate Matches!\nHouse has two Game Modes: Classic and Arcade.\n\nClassic:\nPlay all 40+ levels and hone your skills at making House matches!  The game increases difficulty as you complete boards in time.\n\nArcade:\nPlay against the clock to see how many matches you can get before you run out of time.Try to beat your high score, and share your results in Facebook!";// +

#else 
#ifndef DOGHOUSE	
	//[textView setText:@"Zombie House!"];
	//[textView performSelectorOnMainThread:@selector(setText:) withObject:@"Zombie House" waitUntilDone:YES];
	textView.text = @"In Zombie House each card has three features:\n   Zombie (Baldy, Nerdy, Girly)\n   Color (Blue, Purple, Green)\n   Shade (Full Color, Monotone, Outline)\n\nYou make Zombie Comboz by selecting 3 Zombies. A correct answer will have all the same or all different values for each feature.\nClick the Zombies Cards to the right to generate Zombie Comboz!\n\n\Zombie House has two Game Modes, Classic Crawler and Berzerker.\n\nClassic Crawler:\n  Solve 10 Comboz in the shortest amount of time possible. Your score is the number of seconds it takes to complete all 10 Comboz. Advance to the next level by completing a board in 40 seconds or less.\n\nBerzerker:\n  Play against the clock to see how many Comboz you can get before you run out of time.  Beat your high score and get out of Zombie House alive!";// +
#else
	//[textView setText:@"Dog House!"];
	//[textView performSelectorOnMainThread:@selector(setText:) withObject:@"Dog House" waitUntilDone:YES];
	textView.text = @"In Dog House each card has three features:\n   Dog (Andy, Blue, Slips)\n   Color (Blue, Purple, Green)\n   Shade (Full Color, Monotone, Outline)\n\nYou make Combos by selecting 3 Dogs. A correct answer will have all the same or all different values for each feature.\nClick the Dog Cards to the right to generate Doggie Combos!\n\n\nDog House has two Game Modes, Classic and Barking Mad.\n\nClassic:\n  Solve 10 Combos in the shortest amount of time possible. Your score is the number of seconds it takes to complete all 10 Combos. Advance to the next level by completing a board in 40 seconds or less.\n\nBarking Mad:\n  Play against the clock to see how many Combos you can get before you run out of time!";// +
	
	//@"" +
	//@"";
	/*
	
	
	 
	
	
	
	
	
	";*/
#endif
#endif	
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
	// Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);	
#ifdef IPAD	
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
	
#else
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
#endif
}
 
 
/*
-(void) playSound:(int) pieceID:(int) expression {
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
	
}*/

-(IBAction) generateMatch:(id) sender{
	
	
		
	int i = [GameLogic randomNumber:1,3];
	int j = [GameLogic randomNumber:1,3];
	int k = [GameLogic randomNumber:1,3];
	
	int allSame1 = [GameLogic randomNumber:0,11];
	int allSame2 = [GameLogic randomNumber:0,11];
	int allSame3 = [GameLogic randomNumber:0,11];

	
	
	
	int i2,i3,j2,j3,k2,k3;
	if(allSame1 < 5) //same
	{
		i2 = i3 = i;
	}
	else { //different
		i2 = ((i) % 3) + 1;
		i3 = ((i + 1) % 3) + 1;
	}
	
	if(allSame2 < 5) //same
	{
		j2 = j3 = j;
	}
	else { //different
		j2 = ((j) % 3) + 1;
		j3 = ((j + 1) % 3) + 1;
	}
	if(allSame3 < 5) //same
	{
		k2 = k3 = k;
	}
	else { //different
		k2 = ((k ) % 3) + 1;
		k3 = ((k + 1) % 3) + 1;
	}
	
	
	NSString *imagestr1;// = [[[NSString alloc]init]autorelease];
	NSString *imagestr2;// = [[[NSString alloc]init]autorelease];
	NSString *imagestr3;// = [[[NSString alloc]init]autorelease];
	imagestr1 = [NSString stringWithFormat:[StringConst GetImgConst:IMG_PIECE_A], i,j,k];
	imagestr2 = [NSString stringWithFormat:[StringConst GetImgConst:IMG_PIECE_A], i2,j2,k2];
	imagestr3 = [NSString stringWithFormat:[StringConst GetImgConst:IMG_PIECE_A], i3,j3,k3];
	
	
	
	
	UIImage *img = [UIImage imageNamed:imagestr1];
	[button1 setImage:img forState:UIControlStateNormal];
	[button1 setShowsTouchWhenHighlighted:YES];

	img = [UIImage imageNamed:imagestr2];
	[button2 setImage:img forState:UIControlStateNormal];
	[button2 setShowsTouchWhenHighlighted:YES];

	img = [UIImage imageNamed:imagestr3];
	[button3 setImage:img forState:UIControlStateNormal];
	[button3 setShowsTouchWhenHighlighted:YES];
	
	int exp = [GameLogic randomNumber:1,2];
	[ZombieGameHelpers playSound:i:exp];
	//[imagestr1 release];
	//[imagestr2 release];
	//[imagestr3 release];
	
	//[pieces release];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[textView release];
	[button1 release];
	[button2 release];
	[button3 release];
	[scrollView release];
    [super dealloc];
}


@end
