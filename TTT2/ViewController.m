//
//  ViewController.m
//  TTT2
//
//  Created by Aijaz Ansari on 10/18/14.
//  Copyright (c) 2014 Euclid Software, LLC. All rights reserved.
//

#import "ViewController.h"
#import "TicTacToeBoard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UIButton *b5;
@property (weak, nonatomic) IBOutlet UIButton *b6;
@property (weak, nonatomic) IBOutlet UIButton *b7;
@property (weak, nonatomic) IBOutlet UIButton *b8;
@property (weak, nonatomic) IBOutlet UIButton *b9;

@property (strong, nonatomic) NSString *currentTurn;
@property (strong, nonatomic) UIColor *xColor;
@property (strong, nonatomic) UIColor *oColor;

@property (strong, nonatomic) NSString *xTitle;
@property (strong, nonatomic) NSString *oTitle;
@property (weak, nonatomic) IBOutlet UITextField *xField;
@property (weak, nonatomic) IBOutlet UITextField *oField;
@property (strong, nonatomic) TicTacToeBoard * myBoard;
@property (weak, nonatomic) IBOutlet UILabel *victoryLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.xTitle = @"A";
    self.oTitle = @"B";
    self.currentTurn = self.xTitle;
    self.xColor = [UIColor redColor];
    self.oColor = [UIColor purpleColor];
    self.myBoard = [[TicTacToeBoard alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handleButtonTap:(UIButton *)sender {
    /*
     if the square is blank
        Put in the proper character
        change the currentTurn from X -> O or O -> X
     else
        don't do anything
     */
    
    /*
     Object called A
     A has a B
     We want to tell it to do 'greet'
     [A.B greet];
     */
    
    if ([self.myBoard gameOver]) {
        return;
    }
 
    if ([sender.currentTitle isEqualToString:@" "]) {
        [sender setTitle:self.currentTurn forState:UIControlStateNormal];
        NSInteger theLocation = sender.tag;
        
        if ([self.currentTurn isEqualToString:self.xTitle]) {
            [self.myBoard playPiece:@"X" atLocation:theLocation];
            [sender setTitleColor:self.xColor forState:UIControlStateNormal];
            if ([self.myBoard didPlayerWin:@"X"]) {
                self.victoryLabel.text = @"GAME OVER";
            }
            self.currentTurn = self.oTitle;
        }
        else {
            [self.myBoard playPiece:@"O" atLocation:theLocation];
            [sender setTitleColor:self.oColor forState:UIControlStateNormal];
            if ([self.myBoard didPlayerWin:@"O"]) {
                self.victoryLabel.text = @"GAME OVER";
            }
            self.currentTurn = self.xTitle;
        }
        
    }
    else {
        // do nothing
    }
    
    
}

- (IBAction)reset:(UIButton *)sender {
    [self.b1 setTitle:@" " forState:UIControlStateNormal];
    [self.b2 setTitle:@" " forState:UIControlStateNormal];
    [self.b3 setTitle:@" " forState:UIControlStateNormal];
    [self.b4 setTitle:@" " forState:UIControlStateNormal];
    [self.b5 setTitle:@" " forState:UIControlStateNormal];
    [self.b6 setTitle:@" " forState:UIControlStateNormal];
    [self.b7 setTitle:@" " forState:UIControlStateNormal];
    [self.b8 setTitle:@" " forState:UIControlStateNormal];
    [self.b9 setTitle:@" " forState:UIControlStateNormal];
    self.victoryLabel.text = @"";
    self.currentTurn = self.xTitle;
    [self.myBoard reset];
}



-(void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.xField) {
        if ([self.currentTurn isEqualToString:self.xTitle]) {
            self.currentTurn = textField.text;
        }
        self.xTitle = textField.text;
    }
    else {
        if ([self.currentTurn isEqualToString:self.oTitle]) {
            self.currentTurn = textField.text;
        }
        self.oTitle = textField.text;
    }
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//-(BOOL) isTheBoardAWinForPlayer:
@end








































