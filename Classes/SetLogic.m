//
//  SetLogic.m
//  ZombieGame
//
//  Created by David Guinnip on 4/30/10.
//  Copyright 2010 ArchVision. All rights reserved.
//

#import "SetLogic.h"
#import "SetPiece.h"
#import "GameLogic.h"

@implementation SetLogic

+(SetPiece *) CreatePiece{
	SetPiece *p = [[[SetPiece alloc] init] autorelease];
	p.color =  [GameLogic randomNumber:1,3];
	p.shape =  [GameLogic randomNumber:1,3];
	p.fill =   [GameLogic randomNumber:1,3];
	p.number = [GameLogic randomNumber:1,3];
	
	return p;
}


+(BOOL) Contains:(SetPiece *)piece:(NSMutableArray *)pieces{

	NSEnumerator *enumerator = [pieces objectEnumerator];
	SetPiece *object;
	while ((object = [enumerator nextObject])) {
		
		// do something with object...
		if([object isEqual:piece])
			return YES;
		
	}
	return NO;
}


/// <summary>
/// Creates a Set Piece with Random color, number, shape, fill that does not exist in the
/// given list of pieces
/// </summary>
/// <returns></returns>
+(SetPiece *)CreatePiece:(NSMutableArray *) pieces
{
	BOOL cont = YES;
	SetPiece *p = [[[SetPiece alloc] init]autorelease];
	
	while(cont)
	{
		p.color =  [GameLogic randomNumber:1,3];
		p.shape =  [GameLogic randomNumber:1,3];
		p.fill =   [GameLogic randomNumber:1,3];
		p.number = [GameLogic randomNumber:1,3];
		if(![self Contains:p:pieces])
			cont = NO;
	}
	
	return p;
	
}

+(SetPiece *) CreateSimplePiece{
	SetPiece *p = [[[SetPiece alloc] init]autorelease];
	p.color =  [GameLogic randomNumber:1,3];
	p.shape =  [GameLogic randomNumber:1,3];
	p.number = [GameLogic randomNumber:1,3];
	p.fill =   1;
	return p;
}



/// <summary>
/// Creates a List of total Set Pieces with Random color, number, shape. Fill is constant
/// </summary>
/// <param name="total"></param>
/// <returns></returns>
+(NSMutableArray *) CreatePieces:(int) total{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	
	for(int i=0;i<total; ++i)
	{
		SetPiece *p = [self CreatePiece];
		[ret addObject:p];
	}
	
	return ret;
}

/// <summary>
/// Creates a List of total Set Pieces with Random color, number, shape. Fill is constant
/// </summary>
/// <param name="total"></param>
/// <returns></returns>
+(NSMutableArray *) CreateSimplePieces:(int) total{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	
	for(int i=0;i<total; ++i)
	{
		SetPiece *p = [self CreateSimplePiece];
		[ret addObject:p];
	}
	
	return ret;
}

/// <summary>
/// This routine determines if the set of pieces contains a Set Match.
/// If there are less than 3 pieces in the list, then the routine automatically
/// returns false. If there are 3 or more, then all possible combinations of
/// 3 pieces are examined for a match. If a match is found, the returning
/// list of integers is filled with the 3 indexes that makes the match in the
/// input array. If no matches are found, the returned list is empty.
/// </summary>
/// <param name="pieces"></param>
/// <returns></returns>
+(NSMutableArray *) ContainsMatch:(NSMutableArray *) pieces: (NSMutableArray *) state{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	
	NSLog (@"ContainsMatch Start");
	if (pieces.count < 3)
		return ret;
	
	//0,1,2,3
	//0,1,2
	//0,1,3
	//
	
	int p1; //permutation runner
	int r1; //runner 1
	int r2; //runner 2
	
	
	for(p1 = 0; p1 < state.count - 2; ++p1)
	{
		for (r1 = p1 + 1; r1 < state.count - 1; ++r1)
		{
			for(r2 = r1 + 1; r2 < state.count; ++r2)
			{
				//int aa = (int) state[p1];
				
				NSNumber *aa = (NSNumber *) [state objectAtIndex:p1];
				NSNumber *bb = (NSNumber *) [state objectAtIndex:r1];
				NSNumber *cc = (NSNumber *) [state objectAtIndex:r2];
				int a = [aa intValue];
				int b = [bb intValue];
				int c = [cc intValue];
				//if (ContainsMatch(pieces[state[p1]], pieces[state[r1]], pieces[state[r2]]))
				
				if([self ContainsMatch: (SetPiece *)[pieces objectAtIndex:a]:(SetPiece *)[pieces objectAtIndex:b]:(SetPiece *)[pieces objectAtIndex:c]])
				{
					//ret.Add(state[p1]);
					//ret.Add(state[r1]);
					//ret.Add(state[r2]);
					NSLog(@"Found match: %d %d %d", p1,r1,r2);
					[ret addObject:(SetPiece *)[state objectAtIndex:p1]];
					[ret addObject:(SetPiece *)[state objectAtIndex:r1]];
					[ret addObject:(SetPiece *)[state objectAtIndex:r2]];
					NSLog(@"ContainsMatch End, Found Match");
					return ret;
				}
			}
		}
	}
	
	//no matches were found, so return the empty list;
	NSLog (@"ContainsMatch End, No Match Found!");

	return NULL;
}


/// <summary>
/// This routine determines if the set of pieces contains a Set Match.
/// If there are less than 3 pieces in the list, then the routine automatically
/// returns false. If there are 3 or more, then all possible combinations of
/// 3 pieces are examined for a match. If a match is found, the returning
/// list of integers is filled with the 3 indexes that makes the match in the
/// input array. If no matches are found, the returned list is empty.
/// </summary>
/// <param name="pieces"></param>
/// <returns></returns>
+(BOOL) isMatch:(NSMutableArray *) pieces: (NSMutableArray *) state{
	
	NSLog (@"isMacth Start");
	if (pieces.count < 3)
		return NO;
	
	//0,1,2,3
	//0,1,2
	//0,1,3
	//
	
	int p1; //permutation runner
	int r1; //runner 1
	int r2; //runner 2
	
	
	for(p1 = 0; p1 < state.count - 2; ++p1)
	{
		for (r1 = p1 + 1; r1 < state.count - 1; ++r1)
		{
			for(r2 = r1 + 1; r2 < state.count; ++r2)
			{
				//int aa = (int) state[p1];
				
				NSNumber *aa = (NSNumber *) [state objectAtIndex:p1];
				NSNumber *bb = (NSNumber *) [state objectAtIndex:r1];
				NSNumber *cc = (NSNumber *) [state objectAtIndex:r2];
				int a = [aa intValue];
				int b = [bb intValue];
				int c = [cc intValue];
				//if (ContainsMatch(pieces[state[p1]], pieces[state[r1]], pieces[state[r2]]))
				
				if([self ContainsMatch: (SetPiece *)[pieces objectAtIndex:a]:(SetPiece *)[pieces objectAtIndex:b]:(SetPiece *)[pieces objectAtIndex:c]])
				{
					return YES;
				}
			}
		}
	}
	
	//no matches were found, so return the empty list;
	NSLog (@"isMatch End, No Match Found!");
	
	return NO;
}
/// <summary>
/// This routine determines if the set of pieces contains a Set Match.
/// If there are less than 3 pieces in the list, then the routine automatically
/// returns false. If there are 3 or more, then all possible combinations of
/// 3 pieces are examined for a match. If a match is found, the returning
/// list of integers is filled with the 3 indexes that makes the match in the
/// input array. If no matches are found, the returned list is empty.
/// </summary>
/// <param name="pieces"></param>
/// <returns></returns>
+(NSMutableArray *) GetMatchIndices:(NSMutableArray *) pieces: (NSMutableArray *) state{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	
	if (pieces.count < 3)
		return ret;
	
	//0,1,2,3
	//0,1,2
	//0,1,3
	//
	
	int p1; //permutation runner
	int r1; //runner 1
	int r2; //runner 2
	
	
	for(p1 = 0; p1 < state.count - 2; ++p1)
	{
		for (r1 = p1 + 1; r1 < state.count - 1; ++r1)
		{
			for(r2 = r1 + 1; r2 < state.count; ++r2)
			{
				//int aa = (int) state[p1];
				
				NSNumber *aa = (NSNumber *) [state objectAtIndex:p1];
				NSNumber *bb = (NSNumber *) [state objectAtIndex:r1];
				NSNumber *cc = (NSNumber *) [state objectAtIndex:r2];
				int a = [aa intValue];
				int b = [bb intValue];
				int c = [cc intValue];
				//if (ContainsMatch(pieces[state[p1]], pieces[state[r1]], pieces[state[r2]]))
				
				if([self ContainsMatch: (SetPiece *)[pieces objectAtIndex:a]:(SetPiece *)[pieces objectAtIndex:b]:(SetPiece *)[pieces objectAtIndex:c]])
				{
					//ret.Add(state[p1]);
					//ret.Add(state[r1]);
					//ret.Add(state[r2]);
					NSLog(@"Found match: %d %d %d", p1,r1,r2);
					aa = [NSNumber numberWithInt:p1];
					bb = [NSNumber numberWithInt:r1];
					cc = [NSNumber numberWithInt:r2];
				
					[ret addObject:aa];
					[ret addObject:bb];
					[ret addObject:cc];
					
					return ret;
				}
			}
		}
	}
	
	//no matches were found, so return the empty list;
	return ret;
}


/// <summary>
/// Match Contains the matching logic, which is the 3 numbers
/// have to be the same or all 3 have to be different to return
/// true. Otherwise, it returns false.
/// </summary>
/// <param name="a"></param>
/// <param name="b"></param>
/// <param name="c"></param>
/// <returns></returns>
+(BOOL) Match:(int) a: (int) b:(int) c{
	if ((a == b && b == c) || (a != b && b != c && a != c))
	{
		return YES;
	}
	return NO;
}


/// <summary>
/// Given 3 set pieces, this routine determines is there is a Match.
/// To get a Match, all 4 variables (Color, Shape, Fill, and Number)
/// must all be the same or all be different. If a Match is found,
/// the function returns true. Otherwise, it returns false.
/// </summary>
/// <param name="a"></param>
/// <param name="b"></param>
/// <param name="c"></param>
/// <returns></returns>
+(BOOL) ContainsMatch:(SetPiece *)a: (SetPiece *)b: (SetPiece *)c{
	BOOL ret = YES;
	if (![self Match:a.number: b.number: c.number])
		ret = NO;
	if (ret && ![self Match:a.color: b.color: c.color])
		ret = NO;
	if (ret && ![self Match:a.shape: b.shape: c.shape])
		ret = NO;
	if (ret && ![self Match:a.fill: b.fill: c.fill])
		ret = false;
	
	return ret;
}




/// <summary>
/// Creates the set of total pieces into an array
/// </summary>
+(NSMutableArray *) CreateHardPieces{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	for (int i = 1; i <= 3; ++i)
	{
		for (int j = 1; j <= 3; ++j)
		{
			for (int k = 1; k <= 3; ++k)
			{
				for (int l = 1; l <= 3; ++l)
				{
					NSString *imagestr = [[[NSString alloc]init]autorelease]; 
					
					imagestr = [NSString stringWithFormat:@"%d%d%d%d.jpg", i,j,k,l];
					SetPiece *p = [[SetPiece alloc] initPiece:i :j:k :l :imagestr];
					[ret addObject:(SetPiece *)p];
					
				}
			}
		}
	}
	return ret;
}

/// <summary>
/// Creates the set of total pieces into an array
/// </summary>
+(NSMutableArray *) CreateMediumPieces{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	for (int i = 1; i <= 3; ++i)
	{
		for (int j = 1; j <= 3; ++j)
		{
			for (int k = 1; k <= 3; ++k)
			{
				for (int l = 0; l <= 0; ++l)
				{
					NSString *imagestr = [[[NSString alloc]init]autorelease]; 
					NSLog(@"%", imagestr);
					imagestr = [NSString stringWithFormat:@"%d%d%d%da.png", i,j,k,l];
					SetPiece *p = [[SetPiece alloc] initPiece:i :j:k :l :imagestr];
					[ret addObject:(SetPiece *)p];
					
				}
			}
		}
	}
	return ret;
}

/// <summary>
/// Creates the set of total pieces into an array
/// </summary>
+(NSMutableArray *) CreateEasyPieces{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	for (int i = 1; i <= 3; ++i)
	{
		for (int j = 1; j <= 3; ++j)
		{
			for (int k = 1; k <= 1; ++k)
			{
				for (int l = 1; l <= 1; ++l)
				{
					NSString *imagestr = [[[NSString alloc]init]autorelease]; 
					
					imagestr = [NSString stringWithFormat:@"%d%d%d%d.jpg", i,j,k,l];
					SetPiece *p = [[SetPiece alloc] initPiece:i :j:k :l :imagestr];
					[ret addObject:(SetPiece *)p];
					
				}
			}
		}
	}
	return ret;
}

+(NSMutableArray *) CreateState:(NSMutableArray *)pieces:(int)totalPieces{
	NSMutableArray *ret = [[[NSMutableArray alloc]init]autorelease];
	BOOL again = YES;
	while(again){
		for(int i=0;i<12;++i){
			int ra = [GameLogic randomNumber:0,(totalPieces-1)];
			NSNumber *ns = [NSNumber numberWithInt:ra];
			NSLog(@"Creating State: %d %d", i, ra);
			[ret addObject: ns];
		}
	
		if([self ContainsMatch:pieces:ret])
		{
			again = NO;
			

		}
		else {
			[ret release];
			ret = [[[NSMutableArray alloc]init]autorelease];
		}

	}
	return ret;
}

+(void) CreateState:(NSMutableArray *)pieces:(NSMutableArray *)state:(int) totalPieces{
	BOOL again = YES;
	while(again){
		for(int i=0;i<12;++i){
			int ra = [GameLogic randomNumber:0,(totalPieces-1)];
			NSNumber *ns = [NSNumber numberWithInt:ra];
			NSLog(@"Creating State: %d %d", i, ra);
			[state replaceObjectAtIndex:i withObject:ns];

		}
		
		if([self ContainsMatch:pieces:state])
		{
			again = NO;
			
		}
	}

}


+(void) GetNewPieces:(int)a:(int)b:(int)c: (NSMutableArray *)ret: (NSMutableArray *)pieces:(int) totalPieces{
	
	NSLog( @"GetNewPieces Start");
	BOOL again = YES;
	while(again){
		int ra = [GameLogic randomNumber:0,(totalPieces-1)];
		NSNumber *ns = [NSNumber numberWithInt:ra];
		NSUInteger r = a;
		//[ret replaceObjectAtIndex:r: withObject:ns];
		[ret replaceObjectAtIndex:a withObject:ns];
		
		ra = [GameLogic randomNumber:0,(totalPieces-1)];
		ns = [NSNumber numberWithInt:ra];
		r = b;
		//[ret replaceObjectAtIndex:r: withObject:ns];
		[ret replaceObjectAtIndex:b withObject:ns];
		
		ra = [GameLogic randomNumber:0,(totalPieces-1)];
		ns = [NSNumber numberWithInt:ra];
		r = c;
		//[ret replaceObjectAtIndex:r: withObject:ns];
		[ret replaceObjectAtIndex:c withObject:ns];
	
		BOOL ans  = [self isMatch:pieces:ret];
		
		
		if(ans)
		{
			again = NO;
			
		}
		
	}
	
	NSLog(@"GetNewPieces End");
}




@end
