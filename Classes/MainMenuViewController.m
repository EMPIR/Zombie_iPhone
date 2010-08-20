//
//  MainMenuViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 5/4/10.


#import "MainMenuViewController.h"
#import "ZombieGameViewController.h"
#import "ZombieGameAppDelegate.h"
#import "SetGame.h"

@implementation MainMenuViewController
@synthesize viewController,howToPlayController,crawlerLevelsController;
@synthesize setGame;

-(IBAction) play:(id) sender{
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	[setGame newGame:1:[appDelegate getCrawlerDifficulty]];
	self.viewController.setGame = self.setGame;
	NSLog(@"Play Clicked, now load Game View!");
	[self presentModalViewController:viewController animated:NO];
}
-(IBAction) playRamero:(id) sender{
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	[setGame newGame:2:[appDelegate getBerzerkDifficulty]];
	self.viewController.setGame = self.setGame;
	NSLog(@"Play Clicked, now load Game View!");
	[self presentModalViewController:viewController animated:NO];
}


-(IBAction) howToPlay:(id) sender{
	[self presentModalViewController:howToPlayController animated:NO];
}

-(IBAction) mainMenu:(id)sender{
	
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
	setGame = [[SetGame alloc] init];
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
	[setGame release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[setGame dealloc];
}


@end
