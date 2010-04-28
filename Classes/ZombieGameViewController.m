//
//  ZombieGameViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import "ZombieGameViewController.h"
#import "GameLogic.h"

@implementation ZombieGameViewController
@synthesize button1,selected1View, flipper, theGame;

-(IBAction) button1Down:(id)sender{
	//cast sender to UIButton
	NSLog(@" %f",[theGame randomNumber]);
	if(!theGame.flipper)
	{
		//NSLog(@"NOT");
		UIButton *btn = sender;
		UIImage  *img = [UIImage  imageNamed:@"3333.jpg"];
		//if(img != nil)
		//	NSLog(@"Image not nil");
		[sender setImage:img forState:UIControlStateNormal];
		self.selected1View.frame = btn.frame;
		self.selected1View.hidden = NO;
		theGame.flipper = YES;
	
	}
	else{
		
		//NSLog(@"YES");
		UIButton *btn = sender;
		UIImage  *img = [UIImage  imageNamed:@"1111.jpg"];
		//if(img != nil)
		//	NSLog(@"Image not nil");
		[sender setImage:img forState:UIControlStateNormal];
		self.selected1View.frame = btn.frame;
		self.selected1View.hidden = YES;
		theGame.flipper = NO;
	}
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	theGame = [[GameLogic alloc] init];
	theGame.flipper = NO;
	self.flipper = NO;
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
}


- (void)dealloc {
    [super dealloc];
	[theGame release];
}

@end
