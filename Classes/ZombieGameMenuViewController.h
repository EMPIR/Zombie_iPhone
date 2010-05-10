//
//  ZombieGameMenuViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/4/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZombieGameViewController;
@interface ZombieGameMenuViewController : UIViewController {

	ZombieGameViewController *gameController;
}

-(IBAction) play;

@end
