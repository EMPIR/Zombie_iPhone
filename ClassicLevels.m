//
//  ClassicLevels.m
//  ZombieGame
//
//  Created by David Guinnip on 9/26/10.
//  Copyright 2010 Kaselo. All rights reserved.
//

#import "ClassicLevels.h"

static NSArray *__pageControlColorList = nil;


@implementation ClassicLevels

@synthesize pageNumberLabel;
@synthesize button1,  button2,  button3,  button4,  button5;
@synthesize button6,  button7,  button8,  button9,  button10;
@synthesize button11, button12, button13, button14, button15;

@synthesize badge1, badge2, badge3, badge4, badge5;
@synthesize badge6, badge7, badge8, badge9, badge10;
@synthesize badge11, badge12, badge13, badge14, badge15;


@synthesize hover1, hover2, hover3, hover4, hover5;
@synthesize hover6, hover7, hover8, hover9, hover10;
@synthesize hover11, hover12, hover13, hover14, hover15;


@synthesize label1, label2, label3, label4, label5;
@synthesize label6, label7, label8, label9, label10;
@synthesize label11, label12, label13, label14, label15;

// Creates the color list the first time this method is invoked. Returns one color object from the list.
+ (UIColor *)pageControlColorWithIndex:(NSUInteger)index {
    if (__pageControlColorList == nil) {
        __pageControlColorList = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor magentaColor],
                                  [UIColor blueColor], [UIColor orangeColor], [UIColor brownColor], [UIColor grayColor], nil];
    }
	
    // Mod the index by the list length to ensure access remains in bounds.
    return [__pageControlColorList objectAtIndex:index % [__pageControlColorList count]];
}

// Load the view nib and initialize the pageNumber ivar.
- (id)initWithPageNumber:(int)page {
    if (self = [super initWithNibName:@"ClassicLevels" bundle:nil]) {
        pageNumber = page;
    }
    return self;
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
	pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", pageNumber + 1];
	//self.view.backgroundColor = [ClassicLevels pageControlColorWithIndex:pageNumber];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
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
	[pageNumberLabel release];
    [super dealloc];
	[button1 release];
	[button2 release];
	[button3 release];
	[button4 release];
	[button5 release];
	[button6 release];
	[button7 release];
	[button8 release];
	[button9 release];
	[button10 release];
	[button11 release];
	[button12 release];
	[button13 release];
	[button14 release];
	[button15 release];
	
}


@end
