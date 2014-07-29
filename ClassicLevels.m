//
//  ClassicLevels.m
//  ZombieGame
//
//  Created by David Guinnip on 9/26/10.
//  Copyright 2010 Kaselo. All rights reserved.
//

#import "ClassicLevels.h"
#import "ZombieGameAppDelegate.h"
#import "ZombieGameViewController.h"

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

ZombieGameAppDelegate *appDelegate;


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


-(IBAction) buttonHover:(id)sender
{
	for(int i=0;i<15;++i)
	{
		UIButton *button = [self getLevelButton:i+1];
		UIImageView *hover = [self getLevelHover:i+1];
		hover.hidden = YES;
#ifdef DEMO
#ifdef DOGHOUSE
		
		if(sender == button &&  (i+(pageNumber)* 15) > 16){
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Get the Full Version!" message:@"Upgrade Dog House?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil] autorelease];
			// optional - add more buttons:
			[alert addButtonWithTitle:@"Yes"];
			[alert show];
			
		}
		else if(sender == button && [appDelegate EligibleCrawlerBoard:i+(pageNumber)* 15]){
			
			hover.hidden = NO;
			//[ZombieGameViewController setCrawler:i-1];
			[appDelegate SetCrawlerLevel:(i)+(pageNumber)* 15];
		}
#else
		if(sender == button &&  (i+(pageNumber)* 15) > 16){
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Get the Full Version!" message:@"Upgrade Zombie House?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil] autorelease];
			// optional - add more buttons:
			[alert addButtonWithTitle:@"Yes"];
			[alert show];
			
		}
		else if(sender == button && [appDelegate EligibleCrawlerBoard:i+(pageNumber)* 15]){
			
			hover.hidden = NO;
			//[ZombieGameViewController setCrawler:i-1];
			[appDelegate SetCrawlerLevel:(i)+(pageNumber)* 15];
		}
#endif		
#else		
		if(sender == button && [appDelegate EligibleCrawlerBoard:i+(pageNumber)* 15]){
			
			hover.hidden = NO;
			//[ZombieGameViewController setCrawler:i-1];
			[appDelegate SetCrawlerLevel:(i)+(pageNumber)* 15];
		}
#endif		
	}
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
#ifdef DOGHOUSE
		
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://itunes.apple.com/us/app/dog-house/id397054437?mt=8"]];
#else
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://itunes.apple.com/us/app/zombie-house/id391274957?mt=8"]];
#endif
		
    }
}


-(void) drawCurrentHover{
	
	for(int i=0;i<15;++i)
	{
		//UIButton *button = [self getLevelButton:i+1];
		UIImageView *hover = [self getLevelHover:i+1];
		hover.hidden = YES;
		
		
		if([appDelegate GetCrawlerLevel] == i+(pageNumber)* 15){
			
			hover.hidden = NO;
			//[ZombieGameViewController setCrawler:i-1];
			//[appDelegate SetCrawlerLevel:i-1];
		}
	}
}

-(UIImageView *) getLevelHover:(int) val
{
	if( val == 1)
		return hover1;
	else if( val == 2)
		return hover2;
	else if( val == 3)
		return hover3;
	else if( val == 4)
		return hover4;
	else if( val == 5)
		return hover5;
	else if( val == 6)
		return hover6;
	else if( val == 7)
		return hover7;
	else if( val == 8)
		return hover8;
	else if( val == 9)
		return hover9;
	else if( val == 10)
		return hover10;
	else if( val == 11)
		return hover11;
	else if( val == 12)
		return hover12;
	else if( val == 13)
		return hover13;
	else if( val == 14)
		return hover14;
	else if( val == 15)
		return hover15;
	return NULL;
	
}

-(UIButton *) getLevelButton:(int) val
{
	if( val == 1)
		return button1;
	else if( val == 2)
		return button2;
	else if( val == 3)
		return button3;
	else if( val == 4)
		return button4;
	else if( val == 5)
		return button5;
	else if( val == 6)
		return button6;
	else if( val == 7)
		return button7;
	else if( val == 8)
		return button8;
	else if( val == 9)
		return button9;
	else if( val == 10)
		return button10;
	else if( val == 11)
		return button11;
	else if( val == 12)
		return button12;
	else if( val == 13)
		return button13;
	else if( val == 14)
		return button14;
	else if( val == 15)
		return button15;
	return NULL;
	
}

-(UILabel *) getLevelLabel:(int) val
{
	
	if( val == 1)
		return level1;
	else if( val == 2)
		return level2;
	else if( val == 3)
		return level3;
	else if( val == 4)
		return level4;
	else if( val == 5)
		return level5;
	else if( val == 6)
		return level6;
	else if( val == 7)
		return level7;
	else if( val == 8)
		return level8;
	else if( val == 9)
		return level9;
	else if( val == 10)
		return level10;
	else if( val == 11)
		return level11;
	else if( val == 12)
		return level12;
	else if( val == 13)
		return level13;
	else if( val == 14)
		return level14;
	else if( val == 15)
		return level15;
	return NULL;
	
	
}
-(UIImageView *) getBadge:(int) val
{
	
	if( val == 1)
		return badge1;
	else if( val == 2)
		return badge2;
	else if( val == 3)
		return badge3;
	else if( val == 4)
		return badge4;
	else if( val == 5)
		return badge5;
	else if( val == 6)
		return badge6;
	else if( val == 7)
		return badge7;
	else if( val == 8)
		return badge8;
	else if( val == 9)
		return badge9;
	else if( val == 10)
		return badge10;
	else if( val == 11)
		return badge11;
	else if( val == 12)
		return badge12;
	else if( val == 13)
		return badge13;
	else if( val == 14)
		return badge14;
	else if( val == 15)
		return badge15;
	return NULL;
	
	
}

-(void)setPageLabels:(int)label{
	
	//int crawlerLevel = [appDelegate GetCrawlerLevel];
	int score;
	
	//score = [appDelegate getCrawlerMedal:0];
	//	NSLog(@"Score %d", score);
	
	NSString *message;
	
	UIImage  *img;
	
	for(int i=0;i<15; ++i)
	{
		UILabel *label = [self getLevelLabel:i+1];
		//UIButton *button = [self getLevelButton:i+1];
		message = [[NSString alloc] initWithFormat:@"%d", 1+(i+(pageNumber)* 15)];
		[label setText:message];
		[message release];	
		
		UIImageView *badge = [self getBadge:i+1];
		
		score = [appDelegate getCrawlerMedal:i+(pageNumber)* 15];
#ifdef DEMO
		if(1+(i+(pageNumber)* 15) > 16)
		{
			img = [UIImage  imageNamed:@"lb_grey.png"];
		}
#else		
		if(score ==1)
		{
			img = [UIImage  imageNamed:@"lb_skullGold.png"];
		}
#endif	
		else if(score ==1)
		{
			img = [UIImage  imageNamed:@"lb_skullGold.png"];
		}
		else if (score ==2)
		{
			img = [UIImage  imageNamed:@"lb_skullSilver.png"];
		}
		else if(score == 3){
			img = [UIImage  imageNamed:@"lb_skullBronze.png"];
		}
		else if ([appDelegate EligibleCrawlerBoard:i+(pageNumber)* 15])
		{
			img = [UIImage  imageNamed:@"lb_green.png"];
			//UIImageView *hover = [self getLevelHover:i];
			//hover.hidden = NO;

		}
		
		else {
			img = [UIImage  imageNamed:@"lb_locked.png"];
		}


		
		badge.image = img;
		
	}
	[self drawCurrentHover];
	
		
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	//[self setPageLabels:pageNumber];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", pageNumber + 1];
	//self.view.backgroundColor = [ClassicLevels pageControlColorWithIndex:pageNumber];
	[self setPageLabels:pageNumber];
		
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
