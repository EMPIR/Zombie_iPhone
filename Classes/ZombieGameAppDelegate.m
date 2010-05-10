//
//  ZombieGameAppDelegate.m
//  ZombieGame
//
//  Created by David Guinnip on 4/25/10.
//  Copyright ArchVision 2010. All rights reserved.
//

#import "ZombieGameAppDelegate.h"
#import "MainMenuViewController.h"

@implementation ZombieGameAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	// Now try to set the orientation to landscape (right)
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
	
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
