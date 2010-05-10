//
//  ZombieGameAppDelegate.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface ZombieGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
   MainMenuViewController *viewController;
	
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainMenuViewController *viewController;


@end

