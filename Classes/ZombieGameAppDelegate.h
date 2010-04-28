//
//  ZombieGameAppDelegate.h
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZombieGameViewController;

@interface ZombieGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ZombieGameViewController *viewController;
	
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ZombieGameViewController *viewController;


@end

