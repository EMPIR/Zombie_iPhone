//
//  SetPiece.h
//  ZombieGame
//
//  Created by David Guinnip on 4/28/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

//#import <Cocoa/Cocoa.h>
#include <stdlib.h>

@interface SetPiece : NSObject {
	
	int color;
	int fill;
	int shape;
	int number;
	int index;
	NSString *image;
	NSString *image2;
	BOOL isDown;
	

}

-(id) initPiece:(int)_shape:(int)_color:(int)_fill:(int)_number:(NSString *)_image:(NSString *)_image2;
- (BOOL)isEqual:(id)other;


@property (assign, nonatomic) int color;
@property (assign, nonatomic) int fill;
@property (assign, nonatomic) int shape;
@property (assign, nonatomic) int number;
@property (assign, nonatomic) int index;
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *image2;
@property (assign, nonatomic) BOOL isDown;


@end
