//
//  HighScoresViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/13/10.


#import <UIKit/UIKit.h>


@interface HighScoresViewController : UIViewController {
	IBOutlet UILabel *crawler1;
	IBOutlet UILabel *crawler2;
	IBOutlet UILabel *crawler3;
	IBOutlet UILabel *crawler4;
	IBOutlet UILabel *crawler5;
	
	IBOutlet UILabel *berserk1;
	IBOutlet UILabel *berserk2;
	IBOutlet UILabel *berserk3;
	IBOutlet UILabel *berserk4;
	IBOutlet UILabel *berserk5;
}

-(IBAction) highScores:(id) sender;


@property (nonatomic, retain) UILabel *crawler1;
@property (nonatomic, retain) UILabel *crawler2;
@property (nonatomic, retain) UILabel *crawler3;
@property (nonatomic, retain) UILabel *crawler4;
@property (nonatomic, retain) UILabel *crawler5;

@property (nonatomic, retain) UILabel *berserk1;
@property (nonatomic, retain) UILabel *berserk2;
@property (nonatomic, retain) UILabel *berserk3;
@property (nonatomic, retain) UILabel *berserk4;
@property (nonatomic, retain) UILabel *berserk5;



@end
