//
//  CrawlerLevelsViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 8/2/10.
//  Copyright 2010 Kaselo. All rights reserved.
//

#import "CrawlerLevelsViewController.h"
#import "SetGame.h"

@implementation CrawlerLevelsViewController

@synthesize buttonStart, currentLevel, currentScore;

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
}



-(IBAction) onButtonStart:(id) sender{
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	[setGame newGame:1:[appDelegate getCrawlerDifficulty]];
	self.viewController.setGame = self.setGame;
	NSLog(@"Play Clicked, not load Game View!");
	[self presentModalViewController:viewController animated:NO];
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
    [super dealloc];
}


@end
