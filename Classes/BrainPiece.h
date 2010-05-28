//
//  BrainPiece.h
//  ZombieGame
//
//  Created by David Guinnip on 5/25/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrainPiece : NSObject {
	NSString *image;
	int speed;
	int x;
	int y;
	int height;
	int width;
}

-(id) initPiece:(int)_speed: (int) x: (int) y: (int) width: (int) height: (NSString *)_image;
@property (nonatomic, assign) int speed;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int width;

@end
