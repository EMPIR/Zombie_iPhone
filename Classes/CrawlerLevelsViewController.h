//
//  CrawlerLevelsViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 8/2/10.
//  Copyright 2010 Kaselo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CrawlerLevelsViewController : UIViewController {
	IBOutlet UIButton *buttonStart;
	IBOutlet UILabel  *currentLevel;
	IBOutlet UILabel  *currentScore;
}

@property (nonatomic,retain) UIButton *buttonStart;
@property (nonatomic,retain) UILabel  *currentLevel;
@property (nonatomic,retain) UILabel  *currentScore;

-(IBAction) onButtonStart:(id) sender;

@end
