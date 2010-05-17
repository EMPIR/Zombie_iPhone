//
//  GameMenu.m
//  ZombieGame
//
//  Created by David Guinnip on 5/13/10.


#import "GameMenu.h"
#import "MainMenuViewController.h"
#import "HighScoresViewController.h"
#import "OptionsViewController.h"
@implementation GameMenu

@synthesize viewController, highScoresViewController, optionsViewController;

-(IBAction) playGame:(id) sender{
	NSLog(@"playGame start");
	[self presentModalViewController:viewController animated:NO];
	NSLog(@"playGame end");
}
-(IBAction) playDemo:(id) sender{
	NSLog(@"playDemo start");
	
	NSLog(@"playDemo end");
}

-(IBAction) highScores:(id) sender{
	NSLog(@"highScores start");
	[self presentModalViewController:highScoresViewController animated:NO];
	NSLog(@"highScores end");
}

-(IBAction) options:(id) sender{
	NSLog(@"options start");
	
	[self presentModalViewController:optionsViewController animated:NO];
	
	
	NSLog(@"options end");
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
