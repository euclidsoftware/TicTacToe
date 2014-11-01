//
//  TicTacToeBoard.h
//  TTT2
//
//  Created by Aijaz Ansari on 10/25/14.
//  Copyright (c) 2014 Euclid Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacToeBoard : NSObject

/**
 *  Play an X or an O at the specified location
 *
 *  @param piece    A String that MUST BE @"X" or "O"
 *  @param location A number from 1 - 9
 */
-(void) playPiece: (NSString *) piece atLocation: (NSInteger) location;

/**
 *  Check to see if the board is a winning board for this player
 *
 *  @param piece A String that MUST BE @"X" or @"O"
 *
 *  @return YES if the board is a winning board, NO otherwise
 */
-(BOOL) didPlayerWin: (NSString *) piece;

@property(readonly, nonatomic) BOOL gameOver;

-(void) reset;
@end
