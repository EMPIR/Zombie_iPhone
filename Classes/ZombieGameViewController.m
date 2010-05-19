//
//  ZombieGameViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.


#import "ZombieGameViewController.h"
#import "ZombieGameAppDelegate.h"
#import "GameLogic.h"
#import "SetPiece.h"
#import "SetLogic.h"
#import "SetGame.h"
#import "ZombieAudio.h"
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


@implementation ZombieGameViewController
@synthesize button1,button2,button3,button4,button5,button6,button7,button8,button9,button10,button11,button12;
@synthesize playAgainButton;
@synthesize selected1View,selected2View,selected3View;
@synthesize selected4View,selected5View,selected6View;
@synthesize selected7View,selected8View,selected9View;
@synthesize selected10View,selected11View,selected12View, brainView;

@synthesize hint1View,hint2View,hint3View;
@synthesize hint4View,hint5View,hint6View;
@synthesize hint7View,hint8View,hint9View;
@synthesize hint10View,hint11View,hint12View;
@synthesize finishedLabel, moveLabel,moveLabel2,timerLabel;

@synthesize setGame;

BOOL firstClick = NO;
int showWrong = 0;
int showRight = 0;
int showPiece1 = 0;
int showPiece2 = 0;
int showPiece3 = 0;

int randomTwitch = 0;
int twitchRate = 30;
int brain_randomTwitch = 1;
int brain_twitchRate = 30;

int timeSinceLastRightAnswer = 0;
BOOL hintVisible = NO;
NSTimer *gameTimer;

double timeRemaining = 0;

int brainPulseTimer = 0;

-(void) pulseBrain
{		
		
}

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


-(BOOL) isButtonPressed:(int) index
{
	if(0 == [[setGame.pressed_state objectAtIndex:index] intValue])
		return NO;
	return YES;
}


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

-(UIImageView *) getHint:(int) val
{
	if( val == 0)
		return hint1View;
	if(val == 1)
		return hint2View;
	if(val == 2)
		return hint3View;
	if(val == 3)
		return hint4View;
	if(val == 4)
		return hint5View;
	if(val == 5)
		return hint6View;
	if(val == 6)
		return hint7View;
	if(val == 7)
		return hint8View;
	if(val == 8)
		return hint9View;
	if(val == 9)
		return hint10View;
	if(val == 10)
		return hint11View;
	if(val == 11)
		return hint12View;
	return NULL;
}

-(void) drawPieces
{
	
	
	self.brainView.hidden = NO;
	self.moveLabel.hidden = NO;
	self.finishedLabel.hidden = YES;
	self.moveLabel2.hidden = NO;
	self.playAgainButton.hidden = YES;
	
	for(int i=0;i<12; ++i)
	{
		[self getView:i].hidden = YES;
		[self getButton:i].hidden = NO;
		[self getHint:i].hidden = YES;
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
	
	
	if(setGame.showHint == YES && hintVisible == YES)
	{
		selView = [self getHint:a];
		if(selView != NULL)
			selView.hidden = NO;
		selView = [self getHint:b];
		if(selView != NULL)
			selView.hidden = NO;
		
	}
	
	
	
	int twitchey = -1;
	int brain_twitchey = -1;
	if(randomTwitch == 0)
	{
		twitchey = (int)[GameLogic randomNumber:0,11];
		
	}
	
	if(brain_randomTwitch == 0)
	{
		brain_twitchey = 1;
	}
	

	
	
		
	
	
	NSString *message =[[NSString alloc] initWithFormat:@"Move %d of %d", setGame.currentMove + 1, setGame.totalMoves, a+1, b+1, c+1];
	
	
	[moveLabel setText:message];
	
	[message release];
	[match release];
	
	 message =[[NSString alloc] initWithFormat:@"Comboz: %d", setGame.setsComplete];
	[moveLabel2 setText:message];
	
	
	//NSTimeInterval timeInterval = -1 * [setGame.startDate timeIntervalSinceNow];
	//setGame.currentTime = timeInterval;
	
	
	if(setGame.gameType == 2 )//countdown
	{
		if(![setGame isFinished])
		{
			//message =[[NSString alloc] initWithFormat:@"Time: %0.0f", (setGame.gameTime - timeInterval)];
			message =[[NSString alloc] initWithFormat:@"Time: %0.0lf", timeRemaining];
			[timerLabel setText:message];
			[message release];
		}			
		//else
		//	setGame.currentMove = setGame.totalMoves;
	}
	else {
		//message =[[NSString alloc] initWithFormat:@"Time: %0.0lf", (timeInterval)];
		message =[[NSString alloc] initWithFormat:@"Time: %0.0lf", timeRemaining];
		[timerLabel setText:message];
		[message release];
	}		


	
	int val = [[setGame.state objectAtIndex:0] intValue];
	NSLog(@"Setting image for piece index %d", val);
	//SetPiece *p = (SetPiece)[setGame.pieces objectAtIndex:[inta]];
	SetPiece *p;
	UIImage  *img;
		
	for(int i=0;i<12;++i)
	{
		
		p= (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:i] intValue]];
	
		if(showWrong > 0 && (showPiece1 == i || showPiece2 == i || showPiece3 == i))
		{
			img = [UIImage imageNamed:@"allBad.png"];
			[self playSound:0:1]; //0 = synth, 1 = wrong
			
		}
		else if(showRight > 0 && (showPiece1 == i || showPiece2 == i || showPiece3 == i))
		{
			img = [UIImage imageNamed:@"allGood.png"];
			[self playSound:0:2]; //0 = synth, 2 = correct
		}
		else {
			if(![self isButtonPressed:i] && twitchey != i)
				img = [UIImage  imageNamed:p.image]; //p.shape
			else 
			{
				img = [UIImage imageNamed:p.image2];
				//if(twitchey != -1)
				//{
					if(setGame.gameType == 2)
						[self playSound:p.shape:2]; //p.shape =zombieID, 2 = HAPPY!
					else
						[self playSound:p.shape:1]; //p.shape =zombieID, 2 = HAPPY!
				
				//}
				
			}
			
			
		}
		
		UIButton *btn = [self getButton:i];
		[btn setImage:img forState:UIControlStateNormal];
		[btn setShowsTouchWhenHighlighted:YES];
		
	}
	if(brain_twitchey != -1)
	{
		[self playSound:-1:-1];
		UIImage *img;
		img = [UIImage imageNamed:@"brain_2.png"];
		[brainView setImage:img];
		
	}
	else{
		UIImage *img;
		img = [UIImage imageNamed:@"brain_1.png"];
		[brainView setImage:img];
		
	}
	

	
}

-(void) setButtonPressed:(int) index:(int) value
{
	[setGame.pressed_state replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:value]];
}


-(void) drawFinished
{
	
	self.brainView.hidden = YES;
	self.playAgainButton.hidden = NO;
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
	self.moveLabel2.hidden = YES;
	self.finishedLabel.hidden = NO;
	for(int i=0;i<12; ++i)
	{
		[self getView:i].hidden = YES;
		[self getButton:i].hidden = YES;
		[self getHint:i].hidden = YES;
	}	
	firstClick = NO;
	showWrong = 0;
	showRight = 0;
	showPiece1 = 0;
	showPiece2 = 0;
	showPiece3 = 0;
	
	randomTwitch = 0;
	twitchRate = 30;
	brain_randomTwitch = 1;
	brain_twitchRate = 30;
	
	timeSinceLastRightAnswer = 0;
	hintVisible = NO;
	
}


-(BOOL) buttonDown:(int) index:(id)sender
{
	
	UIButton *btn = sender;
	[self setButtonPressed:index-1:1];	
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
		
		else if(index == 10)
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
				setGame.showHint = YES;
				hintVisible = NO;
				showRight = 2;
				showPiece1 = setGame.selection_a -1;
				showPiece2 = setGame.selection_b -1;
				showPiece3 = setGame.selection_c -1;
				
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
						ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
						
						if(setGame.gameType == 1)
						{
							NSTimeInterval timeInterval = [setGame.startDate timeIntervalSinceDate:setGame.finishedDate];
							//NSLog(@"Game Over, here was your time in seconds: %@", message);
							//[appDelegate readScoresFromDatabase];
							[appDelegate insertScore:-timeInterval :setGame.gameType :setGame.finishedDate];
							
						}
						else {
							//NSTimeInterval timeInterval = [setGame.startDate timeIntervalSinceDate:setGame.finishedDate];
							//NSLog(@"Game Over, here was your time in seconds: %@", message);
							//[appDelegate readScoresFromDatabase];
							
							
						}						
						
						//[self drawFinished];
					}
				}
				else if(setGame.gameType == 2)
				{
					if(timeSinceLastRightAnswer < 10)
					{
						//timeSinceLastRightAnswer = 500;
						timeRemaining += 8;
					}
					else if(timeSinceLastRightAnswer < 20)
					{
						timeRemaining += 6;
					}
					else if(timeSinceLastRightAnswer < 30)
					{
						timeRemaining += 5;
					}
					else if(timeSinceLastRightAnswer < 40)
					{
						timeRemaining += 4;
					}
					else if(timeSinceLastRightAnswer < 50)
					{
						timeRemaining += 3;
					}
					else {
						timeRemaining += 2;
					}

						
					//double addTime = (1.0 - (timeSinceLastRightAnswer / 500.0)) * 500.0;
					
					
					
					
					if(timeRemaining > setGame.gameTime)
						timeRemaining = setGame.gameTime;
					[setGame SwitchPieces];
				}
				timeSinceLastRightAnswer = 0;
				

				
			}
			else {
				showWrong= 2;
				showPiece1 = setGame.selection_a -1;
				showPiece2 = setGame.selection_b -1;
				showPiece3 = setGame.selection_c -1;
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
		else if(index == 7)
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
		
		else if(index == 10)
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
	
	[gameTimer invalidate];
	[gameTimer release];
	setGame.isActive = NO;
	[[self parentViewController] dismissModalViewControllerAnimated:NO];
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
-(BOOL) buttonUp:(int) index:(id)sender
{
	//button was released
	[self setButtonPressed:index-1:0];
	return NO;
}

-(IBAction) button12Up:(id)sender{
	[self buttonUp:12:sender];
}
-(IBAction) button11Up:(id)sender{
	[self buttonUp:11:sender];
}
-(IBAction) button10Up:(id)sender{
	[self buttonUp:10:sender];
}
-(IBAction) button9Up:(id)sender{
	[self buttonUp:9:sender];
}
-(IBAction) button8Up:(id)sender{
	[self buttonUp:8:sender];
}
-(IBAction) button7Up:(id)sender{
	[self buttonUp:7:sender];
}
-(IBAction) button6Up:(id)sender{
	[self buttonUp:6:sender];
}
-(IBAction) button5Up:(id)sender{
	[self buttonUp:5:sender];
}
-(IBAction) button4Up:(id)sender{
	[self buttonUp:4:sender];
}
-(IBAction) button3Up:(id)sender{
	[self buttonUp:3:sender];
}
-(IBAction) button2Up:(id)sender{
	[self buttonUp:2:sender];
}
-(IBAction) button1Up:(id)sender{
	[self buttonUp:1:sender];
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
	showPiece1 = 0;
	showPiece2 = 0;
	showPiece3 = 0;
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	int scoreCount = appDelegate.scores.count;
	
	//PLAY START SOUND??
    [super viewDidLoad];
	
	
	
	twitchRate = 30;
	
}

-(void) gameloop {
	if(!setGame.isActive)
		return;
	//[setGame GameLoop];
	//if([setGame isFinished])
	if((setGame.gameType == 1 && [setGame isFinished])  || (setGame.gameType == 2 && timeRemaining <= 0))
	{
		[self drawFinished];
		setGame.isActive = NO;
		ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
		if(setGame.gameType == 2)
			[appDelegate insertScore:setGame.setsComplete :setGame.gameType :setGame.finishedDate];
	}
	else
	{
		[self drawPieces];
	}
	if(showRight > 0)
		showRight --;
	
	if(showWrong > 0)
		showWrong --;
	
	if(setGame.gameType == 1)
		timeRemaining +=0.1;
	else
		timeRemaining -=0.1;

	randomTwitch  = randomTwitch ++;
	brain_randomTwitch = brain_randomTwitch ++;
	timeSinceLastRightAnswer ++;
	if(timeSinceLastRightAnswer >= 50 && hintVisible == NO)
	{
		hintVisible = YES;
	}
	
	if(setGame.gameType == 1){
		randomTwitch  = randomTwitch % twitchRate;
		brain_randomTwitch = brain_randomTwitch % brain_twitchRate;
	}
	else if (setGame.gameType == 2){
		
		//NSTimeInterval timeInterval = -1 * [setGame.startDate timeIntervalSinceNow];
		//double timeLeft = ((setGame.gameTime - timeInterval) / (double) setGame.gameTime);
		double timeLeft = timeRemaining / 60.0;
		
		if(timeLeft < 0)
			timeLeft = 0.001;
		
		twitchRate = 30 * timeLeft;
		brain_twitchRate = 40 * timeLeft;
		if(brain_twitchRate < 2)
			brain_twitchRate = 2;
		if(twitchRate < 5)
			twitchRate = 5;
		randomTwitch  = randomTwitch % twitchRate;
		brain_randomTwitch = brain_randomTwitch % brain_twitchRate;
		NSLog(@"Twitch Rate %d", twitchRate);
		NSLog(@"Time Left %f", timeLeft);
	
	}
	
}

-(void) viewWillAppear:(BOOL)animated{
	timeSinceLastRightAnswer = 0;
	hintVisible = NO;
	[self drawPieces];
	showPiece1 = 0;
	showPiece2 = 0;
	showPiece3 = 0;
	
	twitchRate = 30;
	setGame.isActive = YES;
	
	firstClick = NO;
	showWrong = 0;
	showRight = 0;
	showPiece1 = 0;
	showPiece2 = 0;
	showPiece3 = 0;
	
	randomTwitch = 0;
	twitchRate = 30;
	brain_randomTwitch = 1;
	brain_twitchRate = 30;
	
	if(setGame.gameType == 1)
		timeRemaining = 0;
	else {
		timeRemaining= 60;
	}

	
	
	SetPiece *p= (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:0] intValue]];
	
	//[appDelegate readScoresFromDatabase];
	
	[self playSound:p.shape:6];
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
}


- (void)dealloc {
    [super dealloc];
//	[theGame release];
	[setGame release];
}

@end
