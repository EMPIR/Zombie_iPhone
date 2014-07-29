//
//  ClassicLevels.h
//  ZombieGame
//
//  Created by David Guinnip on 9/26/10.
//  Copyright 2010 Kaselo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ClassicLevels : UIViewController {
	UILabel *pageNumberLabel;
    int pageNumber;
	
	int score1;
	int score2;
	int score3;
	int score4;
	int score5;
	
	int score6;
	int score7;
	int score8;
	int score9;
	int score10;
	
	int score11;
	int score12;
	int score13;
	int score14;
	int score15;
	

	
	//level buttons
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
	IBOutlet UIButton *button13;
	IBOutlet UIButton *button14;
	IBOutlet UIButton *button15;
	
	
	IBOutlet UIImageView *badge1;
	IBOutlet UIImageView *badge2;
	IBOutlet UIImageView *badge3;
	IBOutlet UIImageView *badge4;
	IBOutlet UIImageView *badge5;
	IBOutlet UIImageView *badge6;
	IBOutlet UIImageView *badge7;
	IBOutlet UIImageView *badge8;
	IBOutlet UIImageView *badge9;
	IBOutlet UIImageView *badge10;
	IBOutlet UIImageView *badge11;
	IBOutlet UIImageView *badge12;
	IBOutlet UIImageView *badge13;
	IBOutlet UIImageView *badge14;
	IBOutlet UIImageView *badge15;

	IBOutlet UIImageView *hover1;
	IBOutlet UIImageView *hover2;
	IBOutlet UIImageView *hover3;
	IBOutlet UIImageView *hover4;
	IBOutlet UIImageView *hover5;
	IBOutlet UIImageView *hover6;
	IBOutlet UIImageView *hover7;
	IBOutlet UIImageView *hover8;
	IBOutlet UIImageView *hover9;
	IBOutlet UIImageView *hover10;
	IBOutlet UIImageView *hover11;
	IBOutlet UIImageView *hover12;
	IBOutlet UIImageView *hover13;
	IBOutlet UIImageView *hover14;
	IBOutlet UIImageView *hover15;
	
	
	IBOutlet UILabel *level1;
	IBOutlet UILabel *level2;
	IBOutlet UILabel *level3;
	IBOutlet UILabel *level4;
	IBOutlet UILabel *level5;
	IBOutlet UILabel *level6;
	IBOutlet UILabel *level7;
	IBOutlet UILabel *level8;
	IBOutlet UILabel *level9;
	IBOutlet UILabel *level10;
	IBOutlet UILabel *level11;
	IBOutlet UILabel *level12;
	IBOutlet UILabel *level13;
	IBOutlet UILabel *level14;
	IBOutlet UILabel *level15;
	
	
	
	
}

/*
@property (nonatomic,retain) int score1;
@property (nonatomic,retain) int score2;
@property (nonatomic,retain) int score3;
@property (nonatomic,retain) int score4;
@property (nonatomic,retain) int score5;

@property (nonatomic,retain) int score6;
@property (nonatomic,retain) int score7;
@property (nonatomic,retain) int score8;
@property (nonatomic,retain) int score9;
@property (nonatomic,retain) int score10;

@property (nonatomic,retain) int score11;
@property (nonatomic,retain) int score12;
@property (nonatomic,retain) int score13;
@property (nonatomic,retain) int score14;
@property (nonatomic,retain) int score15;
*/

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
@property (nonatomic,retain) UIButton *button13;
@property (nonatomic,retain) UIButton *button14;
@property (nonatomic,retain) UIButton *button15;



@property (nonatomic,retain) UIImageView *badge1;
@property (nonatomic,retain) UIImageView *badge2;
@property (nonatomic,retain) UIImageView *badge3;
@property (nonatomic,retain) UIImageView *badge4;
@property (nonatomic,retain) UIImageView *badge5;
@property (nonatomic,retain) UIImageView *badge6;
@property (nonatomic,retain) UIImageView *badge7;
@property (nonatomic,retain) UIImageView *badge8;
@property (nonatomic,retain) UIImageView *badge9;
@property (nonatomic,retain) UIImageView *badge10;
@property (nonatomic,retain) UIImageView *badge11;
@property (nonatomic,retain) UIImageView *badge12;
@property (nonatomic,retain) UIImageView *badge13;
@property (nonatomic,retain) UIImageView *badge14;
@property (nonatomic,retain) UIImageView *badge15;

@property (nonatomic,retain) UIImageView *hover1;
@property (nonatomic,retain) UIImageView *hover2;
@property (nonatomic,retain) UIImageView *hover3;
@property (nonatomic,retain) UIImageView *hover4;
@property (nonatomic,retain) UIImageView *hover5;
@property (nonatomic,retain) UIImageView *hover6;
@property (nonatomic,retain) UIImageView *hover7;
@property (nonatomic,retain) UIImageView *hover8;
@property (nonatomic,retain) UIImageView *hover9;
@property (nonatomic,retain) UIImageView *hover10;
@property (nonatomic,retain) UIImageView *hover11;
@property (nonatomic,retain) UIImageView *hover12;
@property (nonatomic,retain) UIImageView *hover13;
@property (nonatomic,retain) UIImageView *hover14;
@property (nonatomic,retain) UIImageView *hover15;


@property (nonatomic,retain) UILabel *label1;
@property (nonatomic,retain) UILabel *label2;
@property (nonatomic,retain) UILabel *label3;
@property (nonatomic,retain) UILabel *label4;
@property (nonatomic,retain) UILabel *label5;
@property (nonatomic,retain) UILabel *label6;
@property (nonatomic,retain) UILabel *label7;
@property (nonatomic,retain) UILabel *label8;
@property (nonatomic,retain) UILabel *label9;
@property (nonatomic,retain) UILabel *label10;
@property (nonatomic,retain) UILabel *label11;
@property (nonatomic,retain) UILabel *label12;
@property (nonatomic,retain) UILabel *label13;
@property (nonatomic,retain) UILabel *label14;
@property (nonatomic,retain) UILabel *label15;


@property (nonatomic, retain) IBOutlet UILabel *pageNumberLabel;

-(IBAction) buttonHover:(id)sender;

- (id)initWithPageNumber:(int)page;
-(void)setPageLabels:(int)label;

@end
