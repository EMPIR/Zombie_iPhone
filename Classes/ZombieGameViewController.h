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
	
	IBOutlet UILabel *finishedLabel;
	IBOutlet UILabel *moveLabel;
	IBOutlet UILabel *timerLabel;
	IBOutlet UILabel *moveLabel2;
	IBOutlet UIImageView *brainView;
	SetGame *setGame;
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
-(BOOL) isButtonPressed:(int) index;


@property (nonatomic, retain) UILabel *finishedLabel;
@property (nonatomic, retain) UILabel *moveLabel;
@property (nonatomic, retain) UILabel *moveLabel2;
@property (nonatomic, retain) UILabel *timerLabel;
@property (nonatomic,retain) UIImageView *brainView;

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


@end

