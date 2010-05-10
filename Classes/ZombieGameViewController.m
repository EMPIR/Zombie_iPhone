//
//  ZombieGameViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import "ZombieGameViewController.h"
#import "GameLogic.h"
#import "SetPiece.h"
#import "SetLogic.h"
#import "SetGame.h"


@implementation ZombieGameViewController
@synthesize button1,button2,button3,button4,button5,button6,button7,button8,button9,button10,button11,button12;
@synthesize selected1View,selected2View,selected3View;
@synthesize selected4View,selected5View,selected6View;
@synthesize selected7View,selected8View,selected9View;
@synthesize selected10View,selected11View,selected12View;
@synthesize finishedLabel, moveLabel,timerLabel;

@synthesize setGame;

BOOL firstClick = NO;



-(UIButton *) getButton:(int) val
{
	if( val == 0)
		return button1;
	if(val == 1)
		return button2;
	if(val == 2)
		return button3;
	if(val == 3)
		return button4;
	if(val == 4)
		return button5;
	if(val == 5)
		return button6;
	if(val == 6)
		return button7;
	if(val == 7)
		return button8;
	if(val == 8)
		return button9;
	if(val == 9)
		return button10;
	if(val == 10)
		return button11;
	if(val == 11)
		return button12;
	
	return NULL;
}

-(UIImageView *) getView:(int) val
{
	if( val == 0)
		return selected1View;
	if(val == 1)
		return selected2View;
	if(val == 2)
		return selected3View;
	if(val == 3)
		return selected4View;
	if(val == 4)
		return selected5View;
	if(val == 5)
		return selected6View;
	if(val == 6)
		return selected7View;
	if(val == 7)
		return selected8View;
	if(val == 8)
		return selected9View;
	if(val == 9)
		return selected10View;
	if(val == 10)
		return selected11View;
	if(val == 11)
		return selected12View;
	return NULL;
}

-(void) drawPieces
{
	
	
	self.moveLabel.hidden = NO;
	self.finishedLabel.hidden = YES;
	
	
	for(int i=0;i<12; ++i)
	{
		[self getView:i].hidden = YES;
		[self getButton:i].hidden = NO;
	}
	
	UIImageView *selView = [self getView:setGame.selection_a-1];
	if(selView != NULL)
		selView.hidden = NO;
	selView = [self getView:setGame.selection_b-1];
	if(selView != NULL)
		selView.hidden = NO;
	selView = [self getView:setGame.selection_c-1];
	if(selView != NULL)
		selView.hidden = NO;
	

	
	
	NSMutableArray *match = [[setGame getMatch]retain];
	NSNumber *aa = (NSNumber *) [match objectAtIndex:0];
	NSNumber *bb = (NSNumber *) [match objectAtIndex:1];
	NSNumber *cc = (NSNumber *) [match objectAtIndex:2];
	int a = [aa intValue];
	int b = [bb intValue];
	int c = [cc intValue];
	
	
	
	NSString *message =[[NSString alloc] initWithFormat:@"Move %d of %d Hint: %d %d %d", setGame.currentMove + 1, setGame.totalMoves, a+1, b+1, c+1];
	
	
	[moveLabel setText:message];
	[message release];
	[match release];
	
	NSTimeInterval timeInterval = -1 * [setGame.startDate timeIntervalSinceNow];
	setGame.currentTime = timeInterval;
	if(setGame.gameType == 2 )//countdown
	{
		if(![setGame isFinished])
		{
			message =[[NSString alloc] initWithFormat:@"Time Remaining: %0.0f, Total Moves %d", (setGame.gameTime - timeInterval), setGame.setsComplete];
			[timerLabel setText:message];
			[message release];
		}			
		//else
		//	setGame.currentMove = setGame.totalMoves;
	}
	else {
		message =[[NSString alloc] initWithFormat:@"Time: %0.0f", (timeInterval)];
		[timerLabel setText:message];
		[message release];
	}

	
	
	
	
	
	int val = [[setGame.state objectAtIndex:0] intValue];
	NSLog(@"Setting image for piece index %d", val);
	//SetPiece *p = (SetPiece)[setGame.pieces objectAtIndex:[inta]];
	SetPiece *p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:0] intValue]];
	UIImage  *img = [UIImage  imageNamed:p.image];
	[button1 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:1] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button2 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:2] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button3 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:3] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button4 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:4] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button5 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:5] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button6 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:6] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button7 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:7] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button8 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:8] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button9 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:9] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button10 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:10] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button11 setImage:img forState:UIControlStateNormal];
	
	p = (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:11] intValue]];
	img = [UIImage  imageNamed:p.image];
	[button12 setImage:img forState:UIControlStateNormal];
	
	
}

-(void) drawFinished
{
	
	if(setGame.gameType == 1)
	{
		NSTimeInterval timeInterval = [setGame.startDate timeIntervalSinceDate:setGame.finishedDate];
		NSString *message =[[NSString alloc] initWithFormat:@"Game Over, here was your time in seconds: %0.0f", -timeInterval];
	//NSLog(@"Game Over, here was your time in seconds: %@", message);
		[finishedLabel setText:message];
		[message release];
	}
	else {
		//NSTimeInterval timeInterval = [setGame.startDate timeIntervalSinceDate:setGame.finishedDate];
		NSString *message =[[NSString alloc] initWithFormat:@"Game Over, You Completed %d Zombie Comboz!", setGame.setsComplete];
		//NSLog(@"Game Over, here was your time in seconds: %@", message);
		[finishedLabel setText:message];
		[message release];
	}

	self.moveLabel.hidden = YES;
	
	self.finishedLabel.hidden = NO;
	self.selected12View.hidden = YES;
	self.selected11View.hidden = YES;
	self.selected10View.hidden = YES;
	self.selected9View.hidden = YES;
	self.selected8View.hidden = YES;
	self.selected7View.hidden = YES;
	self.selected6View.hidden = YES;
	self.selected5View.hidden = YES;
	self.selected4View.hidden = YES;
	self.selected3View.hidden = YES;
	self.selected2View.hidden = YES;
	self.selected1View.hidden = YES;
	self.button1.hidden = YES;
	self.button2.hidden = YES;
	self.button3.hidden = YES;
	self.button4.hidden = YES;
	self.button5.hidden = YES;
	self.button6.hidden = YES;
	self.button7.hidden = YES;
	self.button8.hidden = YES;
	self.button9.hidden = YES;
	self.button10.hidden = YES;
	self.button11.hidden = YES;
	self.button12.hidden = YES;
	
	
}


-(BOOL) buttonDown:(int) index:(id)sender
{
	
	UIButton *btn = sender;
	if([setGame onPress:index])
	{
		
		//button was pressed
		if(index == 1)
		{
			self.selected1View.frame = btn.frame;
			self.selected1View.hidden = NO;
			
		}
		else if(index == 2)
		{
			self.selected2View.frame = btn.frame;
			self.selected2View.hidden = NO;
			
		}
		else if(index == 3)
		{
			self.selected3View.frame = btn.frame;
			self.selected3View.hidden = NO;
		}
		if(index == 4)
		{
			self.selected4View.frame = btn.frame;
			self.selected4View.hidden = NO;
			
		}
		else if(index == 5)
		{
			self.selected5View.frame = btn.frame;
			self.selected5View.hidden = NO;
			
		}
		else if(index ==6) 		{
			self.selected6View.frame = btn.frame;
			self.selected6View.hidden = NO;
		}
		if(index == 7)
		{
			self.selected7View.frame = btn.frame;
			self.selected7View.hidden = NO;
			
		}
		else if(index == 8)
		{
			self.selected8View.frame = btn.frame;
			self.selected8View.hidden = NO;
			
		}
		else if(index ==9) 
		{
			self.selected9View.frame = btn.frame;
			self.selected9View.hidden = NO;
		}
		
		if(index == 10)
		{
			self.selected10View.frame = btn.frame;
			self.selected10View.hidden = NO;
			
		}
		else if(index == 11)
		{
			self.selected11View.frame = btn.frame;
			self.selected11View.hidden = NO;
			
		}
		else if(index ==12) 		{
			self.selected12View.frame = btn.frame;
			self.selected12View.hidden = NO;
		}
		
		if(setGame.count ==3)
		{
			//evaluate state
			if([setGame makeMove]) // a move was made successfully!
			{
				
				NSLog(@"You found a match!  Hooray!");
				setGame.currentMove ++;
				setGame.setsComplete ++;
				if(setGame.gameType == 1)
				{
					if(setGame.currentMove < setGame.totalMoves)
					{
						[setGame SwitchPieces];
						//[self drawPieces];
					}
					else {
						setGame.finishedDate = [[NSDate date]retain];
						//[self drawFinished];
					}
				}
				else if(setGame.gameType == 2)
				{
					[setGame SwitchPieces];
				}

				
			}
			else {
				setGame.selection_a = -1;
				setGame.selection_b = -1;
				setGame.selection_c = -1;
				
				[self drawPieces];
			}

			
		}
	}
	else {
		//button was unselected;
		if(index == 1)
		{
			self.selected1View.hidden = YES;
			
		}
		else if(index == 2)
		{
			self.selected2View.hidden = YES;
			
		}
		else if(index ==3) 
		{
			self.selected3View.hidden = YES;
		}
		
		if(index == 4)
		{
			self.selected4View.hidden = YES;
			
		}
		else if(index == 5)
		{
			self.selected5View.hidden = YES;
			
		}
		else if(index ==6) 		{
			self.selected6View.hidden = YES;
		}
		if(index == 7)
		{
			self.selected7View.hidden = YES;
			
		}
		else if(index == 8)
		{
			self.selected8View.hidden = YES;
			
		}
		else if(index ==9) 
		{
			self.selected9View.hidden = YES;
		}
		
		if(index == 10)
		{
			self.selected10View.hidden = YES;
			
		}
		else if(index == 11)
		{
			self.selected11View.hidden = YES;
			
		}
		else if(index ==12) 		{
			self.selected12View.hidden = YES;
		}
	}
	
	return NO;

	
}

-(IBAction) finishedButtonDown:(id)sender{
	
	[[self parentViewController] dismissModalViewControllerAnimated:YES];
}

-(IBAction) button12Down:(id)sender{
	[self buttonDown:12:sender];
}
-(IBAction) button11Down:(id)sender{
	[self buttonDown:11:sender];
}
-(IBAction) button10Down:(id)sender{
	[self buttonDown:10:sender];
}
-(IBAction) button9Down:(id)sender{
	[self buttonDown:9:sender];
}
-(IBAction) button8Down:(id)sender{
	[self buttonDown:8:sender];
}
-(IBAction) button7Down:(id)sender{
	[self buttonDown:7:sender];
}
-(IBAction) button6Down:(id)sender{
	[self buttonDown:6:sender];
}
-(IBAction) button5Down:(id)sender{
	[self buttonDown:5:sender];
}
-(IBAction) button4Down:(id)sender{
	[self buttonDown:4:sender];
}
-(IBAction) button3Down:(id)sender{
	[self buttonDown:3:sender];
}
-(IBAction) button2Down:(id)sender{
	[self buttonDown:2:sender];
}
-(IBAction) button1Down:(id)sender{
	[self buttonDown:1:sender];
	//cast sender to UIButton
	//SetPiece *p = [SetLogic CreatePiece];
	//NSLog(@" %d", p.color);
	/*if(!theGame.flipper)
	{
		UIButton *btn = sender;
		UIImage  *img = [UIImage  imageNamed:@"3333.jpg"];
		[sender setImage:img forState:UIControlStateNormal];
		self.selected1View.frame = btn.frame;
		self.selected1View.hidden = NO;
		theGame.flipper = YES;
	
	}
	else{
		
		UIButton *btn = sender;
		UIImage  *img = [UIImage  imageNamed:@"1111.jpg"];
		[sender setImage:img forState:UIControlStateNormal];
		self.selected1View.frame = btn.frame;
		self.selected1View.hidden = YES;
		theGame.flipper = NO;
	}*/
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
}

-(void) gameloop {
	//[setGame GameLoop];
	if([setGame isFinished])
		[self drawFinished];
	else
		[self drawPieces];

	
}

-(void) viewWillAppear:(BOOL)animated{
	
	[self drawPieces];
	
	[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(gameloop) userInfo:nil repeats:YES];

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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
}


- (void)dealloc {
    [super dealloc];
//	[theGame release];
	[setGame release];
}

@end
