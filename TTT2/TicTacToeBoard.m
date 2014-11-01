//
//  TicTacToeBoard.m
//  TTT2
//
//  Created by Aijaz Ansari on 10/25/14.
//  Copyright (c) 2014 Euclid Software, LLC. All rights reserved.
//

#import "TicTacToeBoard.h"

@interface TicTacToeBoard ()

@property (strong, nonatomic) NSMutableArray * board;
@end

@implementation TicTacToeBoard

- (instancetype)init
{
    self = [super init];
    if (self) {
        _board = [NSMutableArray arrayWithCapacity:9];
        [self reset];
    }
    return self;
}

-(void)reset {
    for (int i = 0; i < 9; i = i + 1) {
        _board[i] = @" ";
    }
    _gameOver = NO;
}

-(void)playPiece:(NSString *)piece atLocation:(NSInteger)location {
    if (location >= 0 && location < 9) {
        self.board[location] = piece;
    }
    else {
        // no error reported
    }
}

-(BOOL)didPlayerWin:(NSString *)piece {
    NSArray * listOfWinningLines = @[
                                     @[@0, @1, @2],
                                     @[@3, @4, @5],
                                     @[@6, @7, @8],
                                     
                                     @[@0, @3, @6],
                                     @[@1, @4, @7],
                                     @[@2, @5, @8],
                                     
                                     @[@0, @4, @8],
                                     @[@2, @4, @6]
                                     ];

    for (NSArray * line in listOfWinningLines) {
        if ([self didPlayer: piece winLine: line]) {
            _gameOver = YES;
            return YES;
        }
    }
    return NO;
}

-(BOOL) didPlayer: (NSString *) piece winLine: (NSArray * ) line {
    NSInteger index1 = [line[0] integerValue];
    NSInteger index2 = [line[1] integerValue];
    NSInteger index3 = [line[2] integerValue];
    
    if ([self.board[index1] isEqualToString:piece]
        &&
        [self.board[index2] isEqualToString:piece]
        &&
        [self.board[index3] isEqualToString:piece]
        ) {
        return YES;
    }
    else {
        return NO;
    }
}



@end
