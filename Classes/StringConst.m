//
//  StringConst.m
//  ZombieGame
//
//  Created by David Guinnip on 6/16/10.
//  Copyright 2010 Kaselo. All rights reserved.
//

#import "StringConst.h"


@implementation StringConst

+(NSString *) GetImgConst:(const char *) c
{
	NSString *ret = [NSString stringWithFormat:@"%s" , c];
	return ret;
}

@end
