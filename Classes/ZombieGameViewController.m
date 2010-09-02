//
//  ZombieGameViewController.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.


#import "ZombieGameViewController.h"
#import "ZombieGameHelpers.h"
#import "ZombieGameAppDelegate.h"
#import "GameLogic.h"
#import "SetPiece.h"
#import "SetLogic.h"
#import "SetGame.h"
#import "ZombieAudio.h"
#import "BrainPieces.h"
#import "BrainPiece.h"
#import "StringConst.h"
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreGraphics/CoreGraphics.h>


@implementation ZombieGameViewController
@synthesize button1,button2,button3,button4,button5,button6,button7,button8,button9,button10,button11,button12;
@synthesize playAgainButton,goBackButton, mainMenuPlank, returnGamePlank, pauseButton;
@synthesize selected1View,selected2View,selected3View;
@synthesize selected4View,selected5View,selected6View;
@synthesize selected7View,selected8View,selected9View;
@synthesize selected10View,selected11View,selected12View, brainView, gameBG;

@synthesize hint1View,hint2View,hint3View;
@synthesize hint4View,hint5View,hint6View;
@synthesize hint7View,hint8View,hint9View;
@synthesize hint10View,hint11View,hint12View;
@synthesize finishedLabel, finishedLabel2, moveLabel,moveLabel2,timerLabel;
@synthesize endGameRank1, endGameRank2, endGameRank3;
@synthesize setGame;
@synthesize firstClick, showWrong, showRight, showPiece1, showPiece2, showPiece3;
@synthesize randomTwitch, twitchRate, brain_randomTwitch, brain_twitchRate;
@synthesize timeSinceLastRightAnswer, hintVisible, gameTimer;
@synthesize timeRemaining, brainPulseTimer, gamePlacement, berzerkEndTime;
@synthesize brains;
@synthesize m_brainView1, m_brainView2, m_brainView3,m_brainView4, m_brainView5;
@synthesize m_brainView6, m_brainView7, m_brainView8,m_brainView9, m_brainView10;
@synthesize m_brainView11, m_brainView12, m_brainView13,m_brainView14, m_brainView15;
@synthesize m_brainView16, m_brainView17, m_brainView18,m_brainView19, m_brainView20;
@synthesize m_brainView21, m_brainView22, m_brainView23,m_brainView24, m_brainView25;
@synthesize m_brainView26, m_brainView27, m_brainView28,m_brainView29, m_brainView30;

@synthesize m_brainView31, m_brainView32, m_brainView33,m_brainView34, m_brainView35;
@synthesize m_brainView36, m_brainView37, m_brainView38,m_brainView39, m_brainView40;
@synthesize m_brainView41, m_brainView42, m_brainView43,m_brainView44, m_brainView45;
@synthesize m_brainView46, m_brainView47, m_brainView48,m_brainView49, m_brainView50;
@synthesize m_brainView51, m_brainView52, m_brainView53,m_brainView54, m_brainView55;
@synthesize m_brainView56, m_brainView57, m_brainView58,m_brainView59, m_brainView60;


@synthesize m_bGun;

int TOTAL_BRAINS = 60;




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
-(UIImageView *) getBrains:(int) val
{
	
	if( val == 0)
		return m_brainView1;
	if(val == 1)
		return m_brainView2;
	if(val == 2)
		return m_brainView3;
	if(val == 3)
		return m_brainView4;
	if(val == 4)
		return m_brainView5;
	if(val == 5)
		return m_brainView6;
	if(val == 6)
		return m_brainView7;
	if(val == 7)
		return m_brainView8;
	if(val == 8)
		return m_brainView9;
	if(val == 9)
		return m_brainView10;
	
	if( val == 10)
		return m_brainView11;
	if(val == 11)
		return m_brainView12;
	if(val == 12)
		return m_brainView13;
	if(val == 13)
		return m_brainView14;
	if(val == 14)
		return m_brainView15;
	if(val == 15)
		return m_brainView16;
	if(val == 16)
		return m_brainView17;
	if(val == 17)
		return m_brainView18;
	if(val == 18)
		return m_brainView19;
	if(val == 19)
		return m_brainView20;
	
	if( val == 20)
		return m_brainView21;
	if(val == 21)
		return m_brainView22;
	if(val == 22)
		return m_brainView23;
	if(val == 23)
		return m_brainView24;
	if(val == 24)
		return m_brainView25;
	if(val == 25)
		return m_brainView26;
	if(val == 26)
		return m_brainView27;
	if(val == 27)
		return m_brainView28;
	if(val == 28)
		return m_brainView29;
	if(val == 29)
		return m_brainView30;
	
	
	
	
	if( val == 30)
		return m_brainView31;
	if(val == 31)
		return m_brainView32;
	if(val == 32)
		return m_brainView33;
	if(val == 33)
		return m_brainView34;
	if(val == 34)
		return m_brainView35;
	if(val == 35)
		return m_brainView36;
	if(val == 36)
		return m_brainView37;
	if(val == 37)
		return m_brainView38;
	if(val == 38)
		return m_brainView39;
	if(val == 39)
		return m_brainView40;
	
	if( val == 40)
		return m_brainView41;
	if(val == 41)
		return m_brainView42;
	if(val == 42)
		return m_brainView43;
	if(val == 43)
		return m_brainView44;
	if(val == 44)
		return m_brainView45;
	if(val == 45)
		return m_brainView46;
	if(val == 46)
		return m_brainView47;
	if(val == 47)
		return m_brainView48;
	if(val == 48)
		return m_brainView49;
	if(val == 49)
		return m_brainView50;
	
	if( val == 50)
		return m_brainView51;
	if(val == 51)
		return m_brainView52;
	if(val == 52)
		return m_brainView53;
	if(val == 53)
		return m_brainView54;
	if(val == 54)
		return m_brainView55;
	if(val == 55)
		return m_brainView56;
	if(val == 56)
		return m_brainView57;
	if(val == 57)
		return m_brainView58;
	if(val == 58)
		return m_brainView59;
	if(val == 59)
		return m_brainView60;
	
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
	self.timerLabel.hidden = NO;
	self.finishedLabel.hidden = YES;
	self.finishedLabel2.hidden = YES;
	self.moveLabel2.hidden = NO;
	self.playAgainButton.hidden = YES;
	self.goBackButton.hidden = YES;
	self.mainMenuPlank.hidden = YES;
	self.returnGamePlank.hidden = YES;
	self.pauseButton.hidden = NO;
	self.endGameRank1.hidden = YES;
	self.endGameRank2.hidden = YES;
	self.endGameRank3.hidden = YES;
	
	
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
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSLog(@"appDelegate.showHint %B", appDelegate.showHint);
	
	if(appDelegate.showHint == YES && hintVisible != YES)
	{
		selView = [self getHint:a];
		if(selView != NULL)
			selView.hidden = NO;
		selView = [self getHint:b];
		if(selView != NULL)
			selView.hidden = NO;
		//selView = [self getHint:c];
		//if(selView != NULL)
		//	selView.hidden = NO;
		
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
	

	
	
		
	
	
	NSString *message;
	if(setGame.gameType == 1)
		message =[[NSString alloc] initWithFormat:@"Move %d of %d, Level %d", setGame.currentMove + 1, setGame.totalMoves, [appDelegate getCachedCrawlerDifficulty] + 1];
	else {
		message =[[NSString alloc] initWithFormat:@"Level %d", (setGame.setsComplete / 10) + 1];
	}

	
	[moveLabel setText:message];
	
	[message release];
	[match release];
	
	
	 message =[[NSString alloc] initWithFormat:@"Comboz: %d", setGame.setsComplete];
	[moveLabel2 setText:message];
	
	[message release];
	//NSTimeInterval timeInterval = -1 * [setGame.startDate timeIntervalSinceNow];
	//setGame.currentTime = timeInterval;
	
	
	if(setGame.gameType == 2 )//countdown
	{
		if(![setGame isFinished])
		{
			message =[[NSString alloc] initWithFormat:@"Time: %0.0lf", timeRemaining];
			[timerLabel setText:message];
			[message release];
		}			
		
	}
	else {
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
			NSString *str = [StringConst GetImgConst: IMG_ALLBAD];
			img = [UIImage imageNamed:str];
			[ZombieGameHelpers playSound:0:1]; //0 = synth, 1 = wrong
			
		}
		else if(showRight > 0 && (showPiece1 == i || showPiece2 == i || showPiece3 == i))
		{
			img = [UIImage imageNamed:[StringConst GetImgConst: IMG_ALLGOOD]];
			[ZombieGameHelpers  playSound:0:2]; //0 = synth, 2 = correct
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
						[ZombieGameHelpers  playSound:p.shape:2]; //p.shape =zombieID, 2 = HAPPY!
					else
						[ZombieGameHelpers  playSound:p.shape:1]; //p.shape =zombieID, 2 = HAPPY!
				
				//}
				
			}
			
			
		}
		
		
		UIButton *btn = [self getButton:i];
		[btn setImage:img forState:UIControlStateNormal];
		[btn setShowsTouchWhenHighlighted:YES];
		
	}
	if(brain_twitchey != -1)
	{
		[ZombieGameHelpers  playSound:-1:-1];
		UIImage *img;
		img = [UIImage imageNamed:[StringConst GetImgConst: IMG_BRAIN2]];
		[brainView setImage:img];
		
	}
	else{
		UIImage *img;
		img = [UIImage imageNamed:[StringConst GetImgConst: IMG_BRAIN1]];
		[brainView setImage:img];
		
	}
	
	if(!setGame.isActive)
	{
		[self HideCards];
		goBackButton.hidden = YES;
		self.mainMenuPlank.hidden = NO;
		self.returnGamePlank.hidden = NO;
		pauseButton.hidden = YES;
	}
	

	
}

-(void) setButtonPressed:(int) index:(int) value
{
	[setGame.pressed_state replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:value]];
}


-(void) incrementCrawlerDifficulty:(int) level:(int) score{
	
	
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	if(level+ 1 < [SetLogic GetTotalLevels])
	{
		[appDelegate setCrawlerDifficulty:level+1 :score];
	}
	
	
	
}

-(void) drawCrawlerFinished
{
	
	self.timerLabel.hidden = YES;
	self.brainView.hidden = YES;
	self.playAgainButton.hidden = NO;
	self.goBackButton.hidden = NO;
	self.mainMenuPlank.hidden = YES;
	self.returnGamePlank.hidden = YES;
	self.pauseButton.hidden = YES;
	self.endGameRank1.hidden = YES;
	self.endGameRank2.hidden = YES;
	self.endGameRank3.hidden = YES;
	
	//NSTimeInterval timeInterval = [setGame.startDate timeIntervalSinceDate:setGame.finishedDate];
	
	NSString *message =[[NSString alloc] initWithFormat:@"Your Time: %0.0f", timeRemaining];
	//NSLog(@"Game Over, here was your time in seconds: %@", message);
	[finishedLabel setText:message];
	[message release];
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(timeRemaining > 50)
	{
		//message = [[NSString alloc] initWithFormat:@"Your Placement: %d", gamePlacement];
		message = [[NSString alloc] initWithFormat:@"Too Slow! Try Level %d Again!", [appDelegate getCrawlerDifficulty] + 1];
	}
	else {
		message = [[NSString alloc] initWithFormat:@"Level %d Complete!", [appDelegate getCrawlerDifficulty] + 1];
	}
	[finishedLabel2 setText:message];
	[message release];
		
	//int top5Avg = (int) [appDelegate getCrawlerTopFiveAverage];
	int currentTime =  timeRemaining;
	
	
	UIImage *img;
	if(currentTime <= 20)
	{
		img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_BG_CLASSICC]];
		[self.gameBG setImage:img];
		self.endGameRank1.hidden = NO;
		//self.endGameRank2.hidden = NO;
		//self.endGameRank3.hidden = NO;
		[self incrementCrawlerDifficulty:[appDelegate getCrawlerDifficulty]:currentTime];
		

	}
	else if(currentTime <=40)
	{
		img  = [UIImage imageNamed: [StringConst GetImgConst: IMG_BG_CLASSICB]];
		[self.gameBG setImage:img];
		//self.endGameRank1.hidden = NO;
		self.endGameRank2.hidden = NO;
		[self incrementCrawlerDifficulty:[appDelegate getCrawlerDifficulty]:currentTime];
		
	}
	else if(currentTime <= 50)
	{
		//IMG_BG_CLASSICA
		img  = [UIImage imageNamed: [StringConst GetImgConst: IMG_BG_CLASSICA]];
		[self.gameBG setImage:img];
		self.endGameRank3.hidden = NO;

	}
	else
	{
		img  = [UIImage imageNamed: [StringConst GetImgConst: IMG_BG_CLASSICA]];
		[self.gameBG setImage:img];

		
	}
	
	
	

	self.moveLabel.hidden = YES;
	self.moveLabel2.hidden = YES;
	self.finishedLabel.hidden = NO;
	self.finishedLabel2.hidden = NO;
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
-(void) HideCards
{
	for(int i=0;i<12; ++i)
	{
		[self getView:i].hidden = YES;
		[self getButton:i].hidden = YES;
		[self getHint:i].hidden = YES;
	}	
	
}

-(void) ShowCards
{
	for(int i=0;i<12; ++i)
	{
		[self getView:i].hidden = NO;
		[self getButton:i].hidden = NO;
		[self getHint:i].hidden = NO;
	}	
	
	
}

-(void) drawBerzerkFinished
{
	
	
	
	self.timerLabel.hidden = YES;
	self.pauseButton.hidden = YES;
	self.endGameRank1.hidden = YES;
	self.endGameRank2.hidden = YES;
	self.endGameRank3.hidden = YES;
	
	NSString *message =[[NSString alloc] initWithFormat:@"%d Zombie Comboz!", setGame.setsComplete];
	[finishedLabel setText:message];
	[message release];
	
	if(gamePlacement != 1)
		message = [[NSString alloc] initWithFormat:@"Your Placement: %d", gamePlacement];
	else {
		message = [[NSString alloc] initWithFormat:@"New High Score!"];
	}

	[finishedLabel2 setText:message];
	[message release];
	
	int firstMark = 10;
	int secondMark = 12;
	if(gamePlacement != 1)
	{
		firstMark -= 10;
		secondMark -=10;
	}
	UIImage *img;
	if(!setGame.isActive){ 
		self.playAgainButton.hidden = NO;
		self.goBackButton.hidden = NO;
		self.mainMenuPlank.hidden = YES;
		self.returnGamePlank.hidden = YES;
		if(gamePlacement == 1)//You Win!
		{
			
			self.m_bGun.hidden = NO;
			//IMG_BG_ENDGAMEB_WIN
			img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_BG_ENDGAMEB_WIN]];
		}
		else //You Lose!
		{
			self.m_bGun.hidden = YES;
			img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_BG_ENDGAMEB_LOSE]];
		}


		[self.gameBG setImage:img];
		
		self.brainView.hidden = YES;
		[brains release];
		for(int i=0;i<TOTAL_BRAINS;++i){
			UIImageView *aview = [self getBrains:i];
			aview.hidden = YES;
		}
		self.moveLabel.hidden = YES;
		self.moveLabel2.hidden = YES;
		self.finishedLabel.hidden = NO;
		self.finishedLabel2.hidden = NO;
		for(int i=0;i<12; ++i)
		{
			[self getView:i].hidden = YES;
			[self getButton:i].hidden = YES;
			[self getHint:i].hidden = YES;
		}	
		
	}
	else if(berzerkEndTime < firstMark && gamePlacement == 1)
	{
		if(berzerkEndTime == 0)
			[ZombieGameHelpers playSound:0:4];
		if(gamePlacement == 1)//You Win!
		{
			self.m_bGun.hidden = NO;
		}
		else {
			self.m_bGun.hidden = YES;
		}

		for(int i=0;i<TOTAL_BRAINS;++i){
			UIImageView *aview = [self getBrains:i];
			aview.hidden = YES;
		}
	}
	else if(berzerkEndTime > secondMark)
	{
		if(gamePlacement == 1)//You Win!
		{
			self.m_bGun.hidden = NO;
			
		}
		else {
			self.m_bGun.hidden = YES;
		}
		
		//Draw Brain Pieces
		for(int i=0;i< TOTAL_BRAINS;++i){
			BrainPiece *piece = (BrainPiece *)[brains objectAtIndex:i];
			UIImageView *aview = [self getBrains:i];
			UIImage *image;// = [UIImage imageNamed:piece.image];
			aview.transform = CGAffineTransformTranslate(aview.transform, 0.0, piece.speed);
			aview.hidden = NO;
			image = [UIImage imageNamed:[StringConst GetImgConst: IMG_BRAIN3]];
			self.brainView.image = image;
			
		}
	}
	else if(berzerkEndTime >= firstMark){ //Transition Period
		
		
		if(gamePlacement == 1)//You Win!
		{
			self.m_bGun.hidden = NO;
			
		}
		else {
			self.m_bGun.hidden = YES;
		}
		
		if(berzerkEndTime == firstMark)
			[ZombieGameHelpers playSound:0:6];
		UIImage *image = [UIImage imageNamed:[StringConst GetImgConst: IMG_BRAIN3]];
		self.brainView.image = image;
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
	//added this check to prevent state changes after game finishes
	if([self isGameFinished])
		return NO;
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
							//NSTimeInterval timeInterval = [setGame.startDate timeIntervalSinceDate:setGame.finishedDate];
							//NSLog(@"Game Over, here was your time in seconds: %@", message);
							//[appDelegate readScoresFromDatabase];
							gamePlacement = (int) [appDelegate getCrawlerPlacement:(int)timeRemaining];
							
							[appDelegate insertScore:timeRemaining :setGame.gameType :setGame.finishedDate];
							
							
							
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

-(IBAction) replayButtonDown:(id)sender{
	self.m_bGun.hidden = YES;
	[gameTimer invalidate];
	[gameTimer release];
	setGame.isActive = NO;
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	//[appDelegate PlayNonGameTrack];
	//[appDelegate StopEatingTrack];
	//[self dismissModalViewControllerAnimated:NO];
	if(setGame.gameType == 1){
		[setGame newGame:1:[appDelegate getCrawlerDifficulty]];
	}
	else {
		[setGame newGame:2:[appDelegate getBerzerkDifficulty]];
	}

	[self viewWillAppear:false];
	
}


-(IBAction) finishedButtonDown:(id)sender{
	
	self.m_bGun.hidden = YES;
	[gameTimer invalidate];
	[gameTimer release];
	setGame.isActive = NO;
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
		[appDelegate PlayNonGameTrack];
	[appDelegate StopEatingTrack];
	
	[self dismissModalViewControllerAnimated:NO];
	//[[self parentViewController] dismissModalViewControllerAnimated:NO];
}

-(IBAction) optionsButtonDown:(id) sender{
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	setGame.isActive = !setGame.isActive;
	
	//UIImage *img;
	if(setGame.isActive){
		//img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_PAUSE_OFF]];
		//[sender setImage:img forState:UIControlStateNormal];
		[appDelegate ShowHint:YES];
		[appDelegate PauseSound:NO];
		pauseButton.hidden = NO;
		
		
	}
	else {
		//img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_PAUSE_ON]];
		//[sender setImage:img forState:UIControlStateNormal];
		[appDelegate ShowHint:NO];
		[appDelegate PauseSound:YES];
		pauseButton.hidden = YES;
		
		
		[self drawPieces];
		
	}
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
	
	//PLAY START SOUND??
    [super viewDidLoad];
	
/*	for(int i=0;i<1;++i)
	{
		UIImageView *aview = [self getBrains:i];
		aview = [[UIImageView alloc]init];
		[self.view addSubview:aview];
		
	} */
	
	
	
	
	m_brainView1 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView1];
	m_brainView2 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView2];
	m_brainView3 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView3];
	m_brainView4 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView4];
	m_brainView5 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView5];
	m_brainView6 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView6];
	m_brainView7 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView7];
	m_brainView8 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView8];
	m_brainView9 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView9];
	m_brainView10 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView10];

	
	m_brainView11 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView11];
	m_brainView12 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView12];
	m_brainView13 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView13];
	m_brainView14 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView14];
	m_brainView15 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView15];
	m_brainView16 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView16];
	m_brainView17 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView17];
	m_brainView18 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView18];
	m_brainView19 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView19];
	m_brainView20 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView20];

	m_brainView21 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView21];
	m_brainView22 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView22];
	m_brainView23 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView23];
	m_brainView24 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView24];
	m_brainView25 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView25];
	m_brainView26 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView26];
	m_brainView27 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView27];
	m_brainView28 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView28];
	m_brainView29 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView29];
	m_brainView30 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView30];
	
	
	
	
	m_brainView31 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView31];
	m_brainView32 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView32];
	m_brainView33 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView33];
	m_brainView34 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView34];
	m_brainView35 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView35];
	m_brainView36 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView36];
	m_brainView37 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView37];
	m_brainView38 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView38];
	m_brainView39 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView39];
	m_brainView40 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView40];
	
	
	m_brainView41 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView41];
	m_brainView42 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView42];
	m_brainView43 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView43];
	m_brainView44 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView44];
	m_brainView45 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView45];
	m_brainView46 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView46];
	m_brainView47 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView47];
	m_brainView48 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView48];
	m_brainView49 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView49];
	m_brainView50 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView50];
	
	m_brainView51 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView51];
	m_brainView52 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView52];
	m_brainView53 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView53];
	m_brainView54 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView54];
	m_brainView55 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView55];
	m_brainView56 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView56];
	m_brainView57 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView57];
	m_brainView58 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView58];
	m_brainView59 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView59];
	m_brainView60 = [[UIImageView alloc]init];
	[self.view addSubview:m_brainView60];
	
	twitchRate = 30;
	
	m_bGun = [[UIImageView alloc]init];
	[self.view addSubview:m_bGun];
	
	UIImage *img = [UIImage imageNamed:[StringConst GetImgConst: IMG_ENDGAME_GUN]];
	self.m_bGun.image = img;
#ifdef IPAD	
	
	m_bGun.frame = CGRectMake(753,300,271,272);
#else
	m_bGun.frame = CGRectMake(360, 70, 129, 132);
#endif	
	m_bGun.hidden = YES;
	
}
-(BOOL) isGameFinished{
	if((setGame.gameType == 1 && [setGame isFinished])  || (setGame.gameType == 2 && timeRemaining <= 0))
		return YES;
	return NO;
}

-(void) gameloop {
	if(!setGame.isActive)
		return;
	
	
	//ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	
	
	//[setGame GameLoop];
	//if([setGame isFinished])
	//if((setGame.gameType == 1 && [setGame isFinished])  || (setGame.gameType == 2 && timeRemaining <= 0))
	if([self isGameFinished])
	{
		
		
		ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
		if(setGame.gameType == 2){
			if(berzerkEndTime ==0)
			{
				[ZombieGameHelpers  playSound:0:3];
				gamePlacement = (int) [appDelegate getBerzerkPlacement:setGame.setsComplete];
				[appDelegate insertScore:setGame.setsComplete :setGame.gameType :setGame.finishedDate];
				
				brains = [[BrainPieces CreatePieces] retain];
				
				for(int i=0;i<TOTAL_BRAINS;++i){
					BrainPiece *piece = (BrainPiece *)[brains objectAtIndex:i];
					UIImageView *aview = [self getBrains:i];
					UIImage *image = [UIImage imageNamed:piece.image];
					
					//aview = [ [ UIImageView alloc ] initWithFrame:CGRectMake(piece.x, piece.y, image.size.width, image.size.height)];
					aview.image = image;
					//aview.frame = CGRectMake(piece.x, piece.y, image.size.width, image.size.height);
					aview.frame = CGRectMake(piece.x, piece.y, piece.width, piece.height);

					aview.transform = CGAffineTransformIdentity;
					aview.transform = CGAffineTransformTranslate(aview.transform, 0, piece.speed);
					aview.hidden = YES;
					NSLog(@"Piece %d x %d y %d", i, piece.x, piece.y);
					
					
				}
			}
			[self drawBerzerkFinished];
			berzerkEndTime ++;
			if(berzerkEndTime >= 40)
			{
				[appDelegate PlayEatingTrack];
				setGame.isActive = NO;
				[self drawBerzerkFinished];
			}
				
		}
		else
		{
			setGame.isActive = NO;
			[self drawCrawlerFinished];
		}
		
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
	{
		int level  = pow((setGame.setsComplete / 10),3);
		double levelPenalty = 0.002 * level;
		
		timeRemaining -= (0.1 + levelPenalty);
								
	}	
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
		setGame.gameTime +=0.01;
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
	//[self drawPieces];
	showPiece1 = 0;
	showPiece2 = 0;
	showPiece3 = 0;
	

	[setGame reset];
	twitchRate = 30;
	setGame.isActive = YES;
	
	firstClick = NO;
	showWrong = 0;
	showRight = 0;
	showPiece1 = 0;
	showPiece2 = 0;
	showPiece3 = 0;
	
	randomTwitch = 1;
	twitchRate = 30;
	brain_randomTwitch = 1;
	brain_twitchRate = 30;
	gamePlacement = 0;
	berzerkEndTime = 0;
	self.endGameRank1.hidden = YES;
	self.endGameRank2.hidden = YES;
	self.endGameRank3.hidden = YES;
	
	if(setGame.gameType == 1)
		timeRemaining = 0;
	else {
#ifdef DEBUG
		timeRemaining= 5;
#else		
		timeRemaining = 60;
#endif		
	}
	
	UIImage *img;
	
	//img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_PAUSE_OFF]];
	
		
	
	ZombieGameAppDelegate *appDelegate = (ZombieGameAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	//[appDelegate ShowHint:YES];
	[appDelegate PauseSound:NO];
	///test adding, getting and deleting from the levels database
	//[appDelegate setCrawlerDifficulty:1 : 30];
	//[appDelegate getCrawlerDifficulty];
	//[appDelegate deleteCrawlerDifficulty];
	
	
	if(setGame.gameType == 2){
		
		[appDelegate PlayBerzerkTrack];
	}
	else {
		[appDelegate PlayCrawlerTrack];
	}

	
	
	//
	
	img  = [UIImage imageNamed:[StringConst GetImgConst: IMG_BG_GAMEPLAY]]; 
	[self.gameBG setImage:img];
		
	
	SetPiece *p= (SetPiece *)[setGame.pieces objectAtIndex:[[setGame.state objectAtIndex:0] intValue]];
	
	//[appDelegate readScoresFromDatabase];
	
	
	
	[ZombieGameHelpers  playSound:p.color:6];
	
	gameTimer = [[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(gameloop) userInfo:nil repeats:YES] retain];
	[self drawPieces];
	
	

}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
	// Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);	
#ifdef IPAD	
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	/*8/29/2010 Taking this out because analyzer had message "Incorrect Decrement of the reference count of an object that is not owned at this point by the caller
	 for(int i=0;i<TOTAL_BRAINS;++i)
	{
		UIImageView *aview = [self getBrains:i];
		[aview release];
		aview = nil;
	}*/
	
}


- (void)dealloc {
    [super dealloc];
	[finishedLabel release];
	[finishedLabel2 release];
	[moveLabel release];
	[moveLabel2 release];
	[timerLabel release];
	[brainView release];
	[gameBG release];
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
	[playAgainButton release];
	[goBackButton release];
	[mainMenuPlank release];
	[returnGamePlank release];
	[pauseButton release];
	[selected1View release];
	[selected2View release];
	[selected3View release];
	[selected4View release];
	[selected5View release];
	[selected6View release];
	[selected7View release];
	[selected8View release];
	[selected9View release];
	[selected10View release];
	[selected11View release];
	[selected12View release];
	[hint1View release];
	[hint2View release];
	[hint3View release];
	[hint4View release];
	[hint5View release];
	[hint6View release];
	[hint7View release];
	[hint8View release];
	[hint9View release];
	[hint10View release];
	[hint11View release];
	[hint12View release];
	[endGameRank1 release];
	[endGameRank2 release];
	[endGameRank3 release];
	
	
	[setGame release];
}

@end
