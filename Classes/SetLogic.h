//
//  SetLogic.h
//  ZombieGame
//
//  Created by David Guinnip on 4/30/10.


//#import <Cocoa/Cocoa.h>

@class SetPiece;
@interface SetLogic : NSObject {

}

/// <summary>
/// Creates a Set Piece with Random color, number, shape, fill
/// </summary>
/// <returns></returns>
+(SetPiece *) CreatePiece;

/// <summary>
/// Creates a Set Piece with Random color, number, shape. Fill is constant
/// </summary>
/// <returns></returns>
+(SetPiece *) CreateSimplePiece;


+(BOOL) Contains:(SetPiece *)piece : (NSMutableArray *)pieces;

/// <summary>
/// Creates a Set Piece with Random color, number, shape, fill that does not exist in the
/// given list of pieces
/// </summary>
/// <returns></returns>
+(SetPiece *)CreatePiece : (NSMutableArray *) pieces;

/// <summary>
/// Creates a List of total Set Pieces with Random color, number, shape. Fill is constant
/// </summary>
/// <param name="total"></param>
/// <returns></returns>
+(NSMutableArray *) CreatePieces:(int) total;

/// <summary>
/// Creates a List of total Set Pieces with Random color, number, shape. Fill is constant
/// </summary>
/// <param name="total"></param>
/// <returns></returns>
+(NSMutableArray *) CreateSimplePieces:(int) total;

//+(NSMutableArray *)CreateRandomSet;


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
+(NSMutableArray *) ContainsMatch:(NSMutableArray *) pieces :  (NSMutableArray *) state;
+(BOOL) isMatch:(NSMutableArray *) pieces : (NSMutableArray *) state;

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
+(BOOL) ContainsMatch:(SetPiece *)a : (SetPiece *)b : (SetPiece *)c;
+(NSMutableArray *) GetMatchIndices:(NSMutableArray *) pieces : (NSMutableArray *) state;

/// <summary>
/// Match Contains the matching logic, which is the 3 numbers
/// have to be the same or all 3 have to be different to return
/// true. Otherwise, it returns false.
/// </summary>
/// <param name="a"></param>
/// <param name="b"></param>
/// <param name="c"></param>
/// <returns></returns>
+(BOOL) Match:(int) a : (int) b : (int) c;


/// <summary>
/// Match Contains the matching logic, which is the 3 numbers
/// have to be the same or all 3 have to be different to return
/// true. Otherwise, it returns false.
/// </summary>
/// <param name="a"></param>
/// <param name="b"></param>
/// <param name="c"></param>
/// <returns></returns>
+(BOOL) Match:(int) a : (int) b : (int) c;

/// <summary>
/// Creates the set of total pieces into an array
/// </summary>
+(NSMutableArray *) CreateEasyPieces;
+(NSMutableArray *) CreateMediumPieces;
+(NSMutableArray *) CreateHardPieces;
//+(void) DeletePieces:(NSMutableArray *)array;

/*+(NSMutableArray *) CreateLevel1Pieces;
+(NSMutableArray *) CreateLevel2Pieces;
+(NSMutableArray *) CreateLevel3Pieces;
+(NSMutableArray *) CreateLevel4Pieces;
+(NSMutableArray *) CreateLevel5Pieces;
+(NSMutableArray *) CreateLevel6Pieces;
+(NSMutableArray *) CreateLevel7Pieces;
+(NSMutableArray *) CreateLevel8Pieces;
+(NSMutableArray *) CreateLevel9Pieces;
+(NSMutableArray *) CreateLevel10Pieces;
+(NSMutableArray *) CreateLevel11Pieces;
+(NSMutableArray *) CreateLevel12Pieces;
+(NSMutableArray *) CreateLevel13Pieces;
+(NSMutableArray *) CreateLevel14Pieces;
+(NSMutableArray *) CreateLevel15Pieces;
+(NSMutableArray *) CreateLevel16Pieces;
+(NSMutableArray *) CreateLevel17Pieces;
+(NSMutableArray *) CreateLevel18Pieces;
+(NSMutableArray *) CreateLevel19Pieces;
+(NSMutableArray *) CreateLevel20Pieces;
+(NSMutableArray *) CreateLevel21Pieces;
+(NSMutableArray *) CreateLevel22Pieces;*/

+(int) GetTotalLevels;
+(NSMutableArray *) CreateLevelPieces:(int) level;
+(int) GetLevelStart:(int) level;
+(int) GetLevelTotal:(int) level;
+(int) MatchScore:(SetPiece *)a : (SetPiece *)b : (SetPiece *)c;

+(void) CreateState:(NSMutableArray *)pieces : (NSMutableArray *)state : (int)totalPieces;
+(void) GetNewPieces:(int)a : (int)b : (int)c : (NSMutableArray *)ret : (NSMutableArray *)pieces : (int) totalPieces;
+(NSMutableArray *) CreateState:(NSMutableArray *)pieces : (int)totalPieces;


@end
