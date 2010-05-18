//
//  OptionsViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/16/10.


#import <UIKit/UIKit.h>


@interface OptionsViewController : UIViewController {
	IBOutlet UIButton *deleteButton;
	
	
}

-(IBAction) onFinished:(id) sender;

-(IBAction) onDeletedButton:(id) sender;


@end
