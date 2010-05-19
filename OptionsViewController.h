//
//  OptionsViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/16/10.


#import <UIKit/UIKit.h>


@interface OptionsViewController : UIViewController {
	IBOutlet UIButton *deleteButton;
	IBOutlet UISlider *volumeSlider;
	IBOutlet UISwitch *soundFX;
	
	
}

-(IBAction) onFinished:(id) sender;

-(IBAction) onDeletedButton:(id) sender;

-(IBAction) onSwitchFX:(UISwitch *) sender;

-(IBAction) onSlideVolume:(id) sender;


@end
