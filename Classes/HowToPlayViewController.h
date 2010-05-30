//
//  HowToPlayViewController.h
//  ZombieGame
//
//  Created by David Guinnip on 5/17/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HowToPlayViewController : UIViewController {
	IBOutlet UIButton *button1;
	IBOutlet UIButton *button2;
	IBOutlet UIButton *button3;
	IBOutlet UIScrollView *scrollView;
}



@property (nonatomic,retain) UIButton *button1;
@property (nonatomic,retain) UIButton *button2;
@property (nonatomic,retain) UIButton *button3;
@property (nonatomic, retain) UIScrollView *scrollView;
-(IBAction) backMainMenu:(id) sender;
-(IBAction) generateMatch:(id) sender;


@end
