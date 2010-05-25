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
#import "GameLogic.h"
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "ZombieGameAppDelegate.h"
#import "ZombieAudio.h"

@implementation HowToPlayViewController
@synthesize button1, button2, button3;


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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
	
}

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
	
}

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
	
	
	NSString *imagestr1 = [[[NSString alloc]init]autorelease];
	NSString *imagestr2 = [[[NSString alloc]init]autorelease];
	NSString *imagestr3 = [[[NSString alloc]init]autorelease];
	imagestr1 = [NSString stringWithFormat:@"%d%d%d0a.png", i,j,k];
	imagestr2 = [NSString stringWithFormat:@"%d%d%d0a.png", i2,j2,k2];
	imagestr3 = [NSString stringWithFormat:@"%d%d%d0a.png", i3,j3,k3];
	
	
	
	
	UIImage *img = [UIImage imageNamed:imagestr1];
	[button1 setImage:img forState:UIControlStateNormal];
	[button1 setShowsTouchWhenHighlighted:YES];

	img = [UIImage imageNamed:imagestr2];
	[button2 setImage:img forState:UIControlStateNormal];
	[button2 setShowsTouchWhenHighlighted:YES];

	img = [UIImage imageNamed:imagestr3];
	[button3 setImage:img forState:UIControlStateNormal];
	[button3 setShowsTouchWhenHighlighted:YES];
	
	int exp = [GameLogic randomNumber:2,5];
	[self playSound:i:exp];
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
	[button1 release];
	[button2 release];
	[button3 release];
    [super dealloc];
}


@end
