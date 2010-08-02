//
//  ZombieGameViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//

#import <UIKit/UIKit.h>
@class SetGame;

@interface ZombieGameViewController : UIViewController {
	IBOutlet UIButton *button1;
	IBOutlet UIButton *button2;
	IBOutlet UIButton *button3;
	IBOutlet UIButton *button4;
	IBOutlet UIButton *button5;
	IBOutlet UIButton *button6;
	IBOutlet UIButton *button7;
	IBOutlet UIButton *button8;
	IBOutlet UIButton *button9;
	IBOutlet UIButton *button10;
	IBOutlet UIButton *button11;
	IBOutlet UIButton *button12;
	IBOutlet UIButton *playAgainButton;
	IBOutlet UIButton *optionsButton;
	IBOutlet UIButton *goBackButton;
	
	IBOutlet UIImageView *selected1View;
	IBOutlet UIImageView *selected2View;
	IBOutlet UIImageView *selected3View;
	IBOutlet UIImageView *selected4View;
	IBOutlet UIImageView *selected5View;
	IBOutlet UIImageView *selected6View;
	IBOutlet UIImageView *selected7View;
	IBOutlet UIImageView *selected8View;
	IBOutlet UIImageView *selected9View;
	IBOutlet UIImageView *selected10View;
	IBOutlet UIImageView *selected11View;
	IBOutlet UIImageView *selected12View;

	IBOutlet UIImageView *hint1View;
	IBOutlet UIImageView *hint2View;
	IBOutlet UIImageView *hint3View;
	IBOutlet UIImageView *hint4View;
	IBOutlet UIImageView *hint5View;
	IBOutlet UIImageView *hint6View;
	IBOutlet UIImageView *hint7View;
	IBOutlet UIImageView *hint8View;
	IBOutlet UIImageView *hint9View;
	IBOutlet UIImageView *hint10View;
	IBOutlet UIImageView *hint11View;
	IBOutlet UIImageView *hint12View;
	
	IBOutlet UIImageView *endGameRank1;
	IBOutlet UIImageView *endGameRank2;
	IBOutlet UIImageView *endGameRank3;
	
	IBOutlet UIImageView *brainView1;
	IBOutlet UIImageView *brainView2;
	IBOutlet UIImageView *brainView3;
	IBOutlet UIImageView *brainView4;
	IBOutlet UIImageView *brainView5;
	
	
	IBOutlet UIImageView *gameBG;
	
	IBOutlet UILabel *finishedLabel;
	IBOutlet UILabel *finishedLabel2;
	IBOutlet UILabel *moveLabel;
	IBOutlet UILabel *timerLabel;
	IBOutlet UILabel *moveLabel2;
	IBOutlet UIImageView *brainView;
	SetGame *setGame;
	
	BOOL firstClick;
	int showWrong;
	int showRight;
	int showPiece1;
	int showPiece2;
	int showPiece3;
	
	int randomTwitch;
	int twitchRate;
	int brain_randomTwitch;
	int brain_twitchRate;
	
	int timeSinceLastRightAnswer;
	BOOL hintVisible;
	NSTimer *gameTimer;
	
	double timeRemaining;	
	
	int brainPulseTimer;
	int gamePlacement;
	int berzerkEndTime;
	
	
	NSMutableArray *brains;
	
	UIImageView *m_brainView1;
	UIImageView *m_brainView2;
	UIImageView *m_brainView3;
	UIImageView *m_brainView4;
	UIImageView *m_brainView5;
	UIImageView *m_brainView6;
	UIImageView *m_brainView7;
	UIImageView *m_brainView8;
	UIImageView *m_brainView9;
	UIImageView *m_brainView10;
	
	
	UIImageView *m_brainView11;
	UIImageView *m_brainView12;
	UIImageView *m_brainView13;
	UIImageView *m_brainView14;
	UIImageView *m_brainView15;
	UIImageView *m_brainView16;
	UIImageView *m_brainView17;
	UIImageView *m_brainView18;
	UIImageView *m_brainView19;
	UIImageView *m_brainView20;
	
	
	UIImageView *m_brainView21;
	UIImageView *m_brainView22;
	UIImageView *m_brainView23;
	UIImageView *m_brainView24;
	UIImageView *m_brainView25;
	UIImageView *m_brainView26;
	UIImageView *m_brainView27;
	UIImageView *m_brainView28;
	UIImageView *m_brainView29;
	UIImageView *m_brainView30;
	
	
	UIImageView *m_brainView31;
	UIImageView *m_brainView32;
	UIImageView *m_brainView33;
	UIImageView *m_brainView34;
	UIImageView *m_brainView35;
	UIImageView *m_brainView36;
	UIImageView *m_brainView37;
	UIImageView *m_brainView38;
	UIImageView *m_brainView39;
	UIImageView *m_brainView40;
	
	
	UIImageView *m_brainView41;
	UIImageView *m_brainView42;
	UIImageView *m_brainView43;
	UIImageView *m_brainView44;
	UIImageView *m_brainView45;
	UIImageView *m_brainView46;
	UIImageView *m_brainView47;
	UIImageView *m_brainView48;
	UIImageView *m_brainView49;
	UIImageView *m_brainView50;
	
	
	UIImageView *m_brainView51;
	UIImageView *m_brainView52;
	UIImageView *m_brainView53;
	UIImageView *m_brainView54;
	UIImageView *m_brainView55;
	UIImageView *m_brainView56;
	UIImageView *m_brainView57;
	UIImageView *m_brainView58;
	UIImageView *m_brainView59;
	UIImageView *m_brainView60;
	UIImageView *m_bGun;
}

//@property (nonatomic) BOOL flipper;
//@property (nonatomic, retain) GameLogic *theGame;
@property (nonatomic, retain) SetGame *setGame;

-(BOOL) buttonDown:(int) index:(id)sender;

-(IBAction) button1Down:(id)sender;
-(IBAction) button2Down:(id)sender;
-(IBAction) button3Down:(id)sender;
-(IBAction) button4Down:(id)sender;
-(IBAction) button5Down:(id)sender;
-(IBAction) button6Down:(id)sender;
-(IBAction) button7Down:(id)sender;
-(IBAction) button8Down:(id)sender;
-(IBAction) button9Down:(id)sender;
-(IBAction) button10Down:(id)sender;
-(IBAction) button11Down:(id)sender;
-(IBAction) button12Down:(id)sender;


-(IBAction) button1Up:(id)sender;
-(IBAction) button2Up:(id)sender;
-(IBAction) button3Up:(id)sender;
-(IBAction) button4Up:(id)sender;
-(IBAction) button5Up:(id)sender;
-(IBAction) button6Up:(id)sender;
-(IBAction) button7Up:(id)sender;
-(IBAction) button8Up:(id)sender;
-(IBAction) button9Up:(id)sender;
-(IBAction) button10Up:(id)sender;
-(IBAction) button11Up:(id)sender;
-(IBAction) button12Up:(id)sender;

-(IBAction) finishedButtonDown:(id)sender;
-(IBAction) replayButtonDown:(id)sender;
-(IBAction) optionsButtonDown:(id)sender;

-(BOOL) isButtonPressed:(int) index;

-(void) HideCards;
-(void) ShowCards;

-(BOOL) isGameFinished;

@property (nonatomic, retain) UILabel *finishedLabel;

@property (nonatomic, retain) UILabel *finishedLabel2;
@property (nonatomic, retain) UILabel *moveLabel;
@property (nonatomic, retain) UILabel *moveLabel2;
@property (nonatomic, retain) UILabel *timerLabel;
@property (nonatomic,retain) UIImageView *brainView;

@property (nonatomic,retain) UIImageView *gameBG;

@property (nonatomic,retain) UIButton *button1;
@property (nonatomic,retain) UIButton *button2;
@property (nonatomic,retain) UIButton *button3;
@property (nonatomic,retain) UIButton *button4;
@property (nonatomic,retain) UIButton *button5;
@property (nonatomic,retain) UIButton *button6;
@property (nonatomic,retain) UIButton *button7;
@property (nonatomic,retain) UIButton *button8;
@property (nonatomic,retain) UIButton *button9;
@property (nonatomic,retain) UIButton *button10;
@property (nonatomic,retain) UIButton *button11;
@property (nonatomic,retain) UIButton *button12;
@property (nonatomic,retain) UIButton *playAgainButton;
@property (nonatomic,retain) UIButton *optionsButton;
@property (nonatomic,retain) UIButton *goBackButton;





@property (nonatomic,retain) UIImageView *selected1View;
@property (nonatomic,retain) UIImageView *selected2View;
@property (nonatomic,retain) UIImageView *selected3View;
@property (nonatomic,retain) UIImageView *selected4View;
@property (nonatomic,retain) UIImageView *selected5View;
@property (nonatomic,retain) UIImageView *selected6View;
@property (nonatomic,retain) UIImageView *selected7View;
@property (nonatomic,retain) UIImageView *selected8View;
@property (nonatomic,retain) UIImageView *selected9View;
@property (nonatomic,retain) UIImageView *selected10View;
@property (nonatomic,retain) UIImageView *selected11View;
@property (nonatomic,retain) UIImageView *selected12View;


@property (nonatomic,retain) UIImageView *hint1View;
@property (nonatomic,retain) UIImageView *hint2View;
@property (nonatomic,retain) UIImageView *hint3View;
@property (nonatomic,retain) UIImageView *hint4View;
@property (nonatomic,retain) UIImageView *hint5View;
@property (nonatomic,retain) UIImageView *hint6View;
@property (nonatomic,retain) UIImageView *hint7View;
@property (nonatomic,retain) UIImageView *hint8View;
@property (nonatomic,retain) UIImageView *hint9View;
@property (nonatomic,retain) UIImageView *hint10View;
@property (nonatomic,retain) UIImageView *hint11View;
@property (nonatomic,retain) UIImageView *hint12View;


@property (nonatomic,retain) UIImageView *endGameRank1;
@property (nonatomic,retain) UIImageView *endGameRank2;
@property (nonatomic,retain) UIImageView *endGameRank3;



@property (nonatomic,assign) BOOL firstClick;
@property (nonatomic,assign) int showWrong;
@property (nonatomic,assign) int showRight;
@property (nonatomic,assign) int showPiece1;
@property (nonatomic,assign) int showPiece2;
@property (nonatomic,assign) int showPiece3;

@property (nonatomic,assign) int randomTwitch;
@property (nonatomic,assign) int twitchRate;
@property (nonatomic,assign) int brain_randomTwitch;
@property (nonatomic,assign) int brain_twitchRate;

@property (nonatomic,assign) int timeSinceLastRightAnswer;
@property (nonatomic,assign) BOOL hintVisible;
@property (nonatomic,retain) NSTimer *gameTimer;

@property (nonatomic,assign) double timeRemaining;	

@property (nonatomic,assign) int brainPulseTimer;
@property (nonatomic,assign) int gamePlacement;
@property (nonatomic,assign) int berzerkEndTime;


@property (nonatomic,retain) NSMutableArray *brains;

@property (nonatomic,retain) UIImageView *m_brainView1;
@property (nonatomic,retain) UIImageView *m_brainView2;
@property (nonatomic,retain) UIImageView *m_brainView3;
@property (nonatomic,retain) UIImageView *m_brainView4;
@property (nonatomic,retain) UIImageView *m_brainView5;
@property (nonatomic,retain) UIImageView *m_brainView6;
@property (nonatomic,retain) UIImageView *m_brainView7;
@property (nonatomic,retain) UIImageView *m_brainView8;
@property (nonatomic,retain) UIImageView *m_brainView9;
@property (nonatomic,retain) UIImageView *m_brainView10;


@property (nonatomic,retain) UIImageView *m_brainView11;
@property (nonatomic,retain) UIImageView *m_brainView12;
@property (nonatomic,retain) UIImageView *m_brainView13;
@property (nonatomic,retain) UIImageView *m_brainView14;
@property (nonatomic,retain) UIImageView *m_brainView15;
@property (nonatomic,retain) UIImageView *m_brainView16;
@property (nonatomic,retain) UIImageView *m_brainView17;
@property (nonatomic,retain) UIImageView *m_brainView18;
@property (nonatomic,retain) UIImageView *m_brainView19;
@property (nonatomic,retain) UIImageView *m_brainView20;


@property (nonatomic,retain) UIImageView *m_brainView21;
@property (nonatomic,retain) UIImageView *m_brainView22;
@property (nonatomic,retain) UIImageView *m_brainView23;
@property (nonatomic,retain) UIImageView *m_brainView24;
@property (nonatomic,retain) UIImageView *m_brainView25;
@property (nonatomic,retain) UIImageView *m_brainView26;
@property (nonatomic,retain) UIImageView *m_brainView27;
@property (nonatomic,retain) UIImageView *m_brainView28;
@property (nonatomic,retain) UIImageView *m_brainView29;
@property (nonatomic,retain) UIImageView *m_brainView30;



@property (nonatomic,retain) UIImageView *m_brainView31;
@property (nonatomic,retain) UIImageView *m_brainView32;
@property (nonatomic,retain) UIImageView *m_brainView33;
@property (nonatomic,retain) UIImageView *m_brainView34;
@property (nonatomic,retain) UIImageView *m_brainView35;
@property (nonatomic,retain) UIImageView *m_brainView36;
@property (nonatomic,retain) UIImageView *m_brainView37;
@property (nonatomic,retain) UIImageView *m_brainView38;
@property (nonatomic,retain) UIImageView *m_brainView39;
@property (nonatomic,retain) UIImageView *m_brainView40;


@property (nonatomic,retain) UIImageView *m_brainView41;
@property (nonatomic,retain) UIImageView *m_brainView42;
@property (nonatomic,retain) UIImageView *m_brainView43;
@property (nonatomic,retain) UIImageView *m_brainView44;
@property (nonatomic,retain) UIImageView *m_brainView45;
@property (nonatomic,retain) UIImageView *m_brainView46;
@property (nonatomic,retain) UIImageView *m_brainView47;
@property (nonatomic,retain) UIImageView *m_brainView48;
@property (nonatomic,retain) UIImageView *m_brainView49;
@property (nonatomic,retain) UIImageView *m_brainView50;


@property (nonatomic,retain) UIImageView *m_brainView51;
@property (nonatomic,retain) UIImageView *m_brainView52;
@property (nonatomic,retain) UIImageView *m_brainView53;
@property (nonatomic,retain) UIImageView *m_brainView54;
@property (nonatomic,retain) UIImageView *m_brainView55;
@property (nonatomic,retain) UIImageView *m_brainView56;
@property (nonatomic,retain) UIImageView *m_brainView57;
@property (nonatomic,retain) UIImageView *m_brainView58;
@property (nonatomic,retain) UIImageView *m_brainView59;
@property (nonatomic,retain) UIImageView *m_brainView60;

@property (nonatomic,retain) UIImageView *m_bGun;

@end

