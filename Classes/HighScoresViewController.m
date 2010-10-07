//
//  HighScoresViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 5/13/10.


#import "HighScoresViewController.h"
#import "ZombieGameAppDelegate.h"
#import "Scores.h"

@implementation HighScoresViewController

@synthesize crawler1,crawler2,crawler3,crawler4,crawler5;
@synthesize berserk1, berserk2, berserk3,berserk4,berserk5;


-(IBAction) highScores:(id) sender{
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

-(UILabel *)getLabel:(int) type:(int) index
{
	if(type == 1)
	{
		if(index == 0)
			return crawler1;
		else if(index == 1)
			return crawler2;
		else if(index == 2)
			return crawler3;
		else if(index == 3)
			return crawler4;
		else if(index == 4)
			return crawler5;
		
	}
	else
	{
		if(index == 0)
			return berserk1;
		else if(index == 1)
			return berserk2;
		else if(index == 2)
			return berserk3;
		else if(index == 3)
			return berserk4;
		else if(index == 4)
			return berserk5;
	}
	return NULL;
}

-(void) viewWillAppear:(BOOL)animated{
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSMutableArray *crawlerScores = [appDelegate getCrawlerTopScores];
	NSMutableArray *berserkScores = [appDelegate getBerserkTopScores];

	for(int i=0; i< 5; ++i)
	{
		if(crawlerScores.count > i)
		{
			Scores *score = (Scores *)[crawlerScores objectAtIndex:i];
			NSString *message =[[NSString alloc] initWithFormat:@"Level %d",  score.score+1];
			UILabel *label = [self getLabel:1:i];
			label.hidden = NO;
			//rotate label in 45 degrees
			label.transform = CGAffineTransformMakeRotation( -0.015);
			[label setText:message];
			[message release];
		}
		else {
			NSString *message =[[NSString alloc] initWithFormat:@"-----"];
			UILabel *label = [self getLabel:1:i];
			label.hidden = NO;
			label.transform = CGAffineTransformMakeRotation( -0.015);
			[label setText:message];
			[message release];
		}
		
		if(berserkScores.count > i)
		{
			Scores *score = (Scores *)[berserkScores objectAtIndex:i];
#ifndef DOGHOUSE			
			NSString *message =[[NSString alloc] initWithFormat:@"%d: %d Zombies", i+1,score.score];
#else
			NSString *message =[[NSString alloc] initWithFormat:@"%d: %d Combos", i+1,score.score];
#endif			
			UILabel *label = [self getLabel:2:i];
			label.hidden = NO;
			label.transform = CGAffineTransformMakeRotation( 0.015);
			[label setText:message];
			[message release];
		}
		else {
			NSString *message =[[NSString alloc] initWithFormat:@"-----"];
			UILabel *label = [self getLabel:2:i];
			label.hidden = NO;
			label.transform = CGAffineTransformMakeRotation( 0.015);
			[label setText:message];
			[message release];
			
			
		}
		
	}
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	
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

	[crawler1 release];
	[crawler2 release];
	[crawler3 release];
	[crawler4 release];
	[crawler5 release];
	
	[berserk1 release];
	[berserk2 release];
	[berserk3 release];
	[berserk4 release];
	[berserk5 release];
}



@end
