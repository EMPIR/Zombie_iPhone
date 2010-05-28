//
//  BrainPiece.m
//  ZombieGame
//
//  Created by David Guinnip on 5/25/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "BrainPiece.h"


@implementation BrainPiece
@synthesize speed, image, x, y, height, width;

-(id) initPiece:(int)_speed: (int) _x: (int) _y: (int) _width: (int) _height: (NSString *)_image{
	if(self = [super init]){
		self.image = [_image retain];
		self.speed = _speed;
		self.x = _x;
		self.y = _y;
		self.height = _height;
		self.width = _width;
	}
	return self;
}
@end
