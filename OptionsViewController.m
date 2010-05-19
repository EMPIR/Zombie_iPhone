//
//  OptionsViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 5/16/10.

#import "OptionsViewController.h"
#import "ZombieGameAppDelegate.h"
#import "ZombieAudio.h"
#import "GameLogic.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation OptionsViewController

NSTimer *gameTimer;
int _randomTwitch = 0;
int _twitchRate = 15;

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
	[filename release];
	
}

-(IBAction) onFinished:(id) sender{
	[[self parentViewController] dismissModalViewControllerAnimated:NO];
}


-(IBAction) onDeletedButton:(id) sender{
	
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate deleteAllScores];
}


-(IBAction) onSwitchFX:(UISwitch *) sender{
	if(sender != NULL)
	{
		ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
		if(sender.on)
			appDelegate.soundFX = YES;
		else {
			appDelegate.soundFX = NO;
			
		}

			
	}
}

-(IBAction) onSlideVolume:(id) sender{
	UISlider *slider = (UISlider *)sender;
	if(slider != NULL)
	{
		ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
		//[slider value]
		[appDelegate BackgroundVolume:[slider value]];
	}

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
-(void) gameloop {
	_randomTwitch  = _randomTwitch ++;
	_randomTwitch  = _randomTwitch % _twitchRate;
	if(_randomTwitch == 0)
	{
		

		[self playSound:[GameLogic randomNumber:1,3]:[GameLogic randomNumber:1,2]];
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	gameTimer = [[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(gameloop) userInfo:nil repeats:YES] retain];

}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
	
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
	[gameTimer dealloc];
    [super dealloc];
}


@end
