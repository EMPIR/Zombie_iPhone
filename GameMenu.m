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
	[self presentViewController:viewController animated:NO completion:nil];
	NSLog(@"playGame end");
}
-(IBAction) playDemo:(id) sender{
	NSLog(@"playDemo start");
	
	NSLog(@"playDemo end");
}

-(IBAction) highScores:(id) sender{
	NSLog(@"highScores start");
	[self presentViewController:highScoresViewController animated:NO completion:nil];
	NSLog(@"highScores end");
}

-(IBAction) options:(id) sender{
	NSLog(@"options start");
	
	
	
	
	[self presentViewController:optionsViewController animated:NO completion:nil];
	
	NSLog(@"options end");
}




/**
 * Callback for facebook login
 */ 
-(void) fbDidLogin {
/*	[self.label setText:@"logged in"];
	_getUserInfoButton.hidden    = NO;
	_getPublicInfoButton.hidden   = NO;
	_publishButton.hidden        = NO;
	_uploadPhotoButton.hidden    = NO;
	_fbButton.isLoggedIn         = YES;
	[_fbButton updateImage];*/
}

/**
 * Callback for facebook did not login
 */
- (void)fbDidNotLogin:(BOOL)cancelled {
	NSLog(@"did not login");
}

/**
 * Callback for facebook logout
 */ 
-(void) fbDidLogout {
/*	[self.label setText:@"Please log in"];
	_getUserInfoButton.hidden    = YES;
	_getPublicInfoButton.hidden   = YES;
	_publishButton.hidden        = YES;
	_uploadPhotoButton.hidden = YES;
	_fbButton.isLoggedIn         = NO;
	[_fbButton updateImage];*/
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// FBRequestDelegate

/**
 * Callback when a request receives Response
 */ 
/*- (void)request:(FBRequest*)request didReceiveResponse:(NSURLResponse*)response{
	NSLog(@"received response");
};*/

/**
 * Called when an error prevents the request from completing successfully.
 */
/*- (void)request:(FBRequest*)request didFailWithError:(NSError*)error{
	//[self.label setText:[error localizedDescription]];
};*/

/**
 * Called when a request returns and its response has been parsed into an object.
 * The resulting object may be a dictionary, an array, a string, or a number, depending
 * on thee format of the API response.
 */
/*- (void)request:(FBRequest*)request didLoad:(id)result {
	if ([result isKindOfClass:[NSArray class]]) {
		result = [result objectAtIndex:0]; 
	}
	if ([result objectForKey:@"owner"]) {
		[self.label setText:@"Photo upload Success"];
	} else {
		[self.label setText:[result objectForKey:@"name"]]; 
	}
};*/


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



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
#ifdef IPAD	
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);

#else
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
#endif
	
	
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
