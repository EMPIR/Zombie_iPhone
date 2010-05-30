//
//  OptionsViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/16/10.


#import <UIKit/UIKit.h>


@interface OptionsViewController : UIViewController {
	IBOutlet UIButton *deleteButton;
	IBOutlet UISlider *volumeSlider;
	NSTimer *gameTimer;
	
	int randomTwitch;
	int twitchRate;
	BOOL isFX;
	BOOL isHints;
	
}



-(IBAction) onFinished:(id) sender;

-(IBAction) onDeletedButton:(id) sender;


-(IBAction) onSwitchFX:(UIButton *) sender;
-(IBAction) onSwitchHints:(UIButton *) sender;

-(IBAction) onSlideVolume:(id) sender;

@property (nonatomic, assign) UISlider *volumeSlider;
@property (nonatomic, retain) NSTimer *gameTimer;
@property (nonatomic, assign) int randomTwitch;
@property (nonatomic, assign) int twitchRate;
@property (nonatomic, assign) BOOL isFX;
@property (nonatomic, assign) BOOL isHints;


@end
