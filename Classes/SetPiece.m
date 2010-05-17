//
//  SetPiece.m
//  ZombieGame
//
//  Created by David Guinnip on 4/28/10.


#import "SetPiece.h"


@implementation SetPiece
@synthesize color,fill,number,shape,index,image,image2,isDown;

typedef enum ColorType
{
	Red = 1,
	Green = 2,
	Blue = 3
}Color;

enum FillType
{
	Solid = 1,
	Hollow = 2,
	Striped = 3
}Fill;

enum ShapeType
{
	Diamond = 1,
	Cylinder = 2,
	Squiggle = 3
}Shape;

enum NumberType
{
	One = 1,
	Two = 2,
	Three = 3
}Number;

- (BOOL)isEqual:(SetPiece *) other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
 
	return	([self shape]  != [other shape]) && 
			([self color]  != [other color]) &&
			([self fill]   != [other fill])  && 
			([self number] != [other number]);
}


-(id) initPiece:(int)_shape:(int)_color:(int)_fill:(int)_number:(NSString *)_image:(NSString *) _image2{
	if(self = [super init]){
		self.shape = _shape;
		self.color = _color;
		self.fill = _fill;
		self.number = _number;
		self.image = [_image retain];
		self.image2 = [_image2 retain];
		self.isDown = NO;
	}
	return self;
}



-(void) dealloc{
	[super dealloc];
	[image release];
	[image2 release];
	
}


	

@end
