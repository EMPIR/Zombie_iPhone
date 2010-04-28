//
//  ZombieGameViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameLogic;

@interface ZombieGameViewController : UIViewController {
	IBOutlet UIImageView *button1;
	IBOutlet UIImageView *selected1View;
    GameLogic *theGame;
	BOOL flipper;
}
@property (nonatomic) BOOL flipper;
@property (nonatomic, retain) GameLogic *theGame;

-(IBAction) button1Down:(id)sender;
@property (nonatomic,retain) UIImageView *button1;
@property (nonatomic,retain) UIImageView *selected1View;


@end

