//
//  ViewController.m
//  liarsDice
//
//  Created by Patrick on 11/25/15.
//  Copyright (c) 2015 FSU. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

@interface ViewController ()

@end

@implementation ViewController
int numPlayers = 0;
int claimq = 0;
int claimf = 0;
int currentPlayer = 1;
int diceInPlay;
NSMutableArray *playerArray;
NSMutableArray * diceArray;



@synthesize statusText, claimText, diceInPlayText, playersTurnText, dice1, dice2, dice3, dice4, dice5;

-(void) newGame{
    //assign dice image views to an array
    diceArray = [[NSMutableArray alloc] init];
    [diceArray addObject:dice1];
    [diceArray addObject:dice2];
    [diceArray addObject:dice3];
    [diceArray addObject:dice4];
    [diceArray addObject:dice5];

    //set begining of game text
    claimText.text = @"Claim: Make Claim";
    playersTurnText.text = @"Players turn: Player 1";
    //alert box to get number of players
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Select Number of Players" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"2", @"3",@"4",nil];
    alert.tag = 0;
    [alert show];
    
    //numPlayers should now have number of players gathered from the alertView
    NSString *players = [NSString stringWithFormat:@"%d", numPlayers];
    NSLog(players);
    
    //fill Player array list with number of players
    
    

}
-(void) loadDice:(int)player{
    //load players hand to image view
    Player *current = [playerArray objectAtIndex:(player - 1)];
    NSLog(@"loadDIce");
    NSLog(@"%d", [current hand].count);


    for(int i = 0; i < 5 ; i++){
        
        if (i < [current hand].count){
            NSNumber* num = [[current hand] objectAtIndex:i];
            NSLog(@"%@", num);
            if([num integerValue] == 1){
                [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"one.png"]];
            }
            else if([num integerValue] == 2){
                [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"two.png"]];

            }
            else if([num integerValue] == 3){
                [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"three.png"]];

            }
            else if([num integerValue] == 4){
                [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"four.png"]];

            }
            else if([num integerValue] == 5){
                [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"five.png"]];

            }
            else if([num integerValue] == 6){
                [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"six.png"]];

            }
        }
        else{
            [[diceArray objectAtIndex:i] setImage:[UIImage imageNamed:@"dead.png"]];

        }
    }
}

- (void) addPlayers:(int) num{
    NSLog (@"InHere0");
    playerArray = [NSMutableArray array];
    
    for (int i = 0 ; i < num ; i ++){
        Player *entry = [[Player alloc]init:(i + 1)];
        [playerArray addObject: entry];
        

    }
  
    //meant for testing print name and hand of each player
    [self printHand];
    //player array now has desired umber of players with respective names and hands
    diceInPlayText.text = ([NSString stringWithFormat: @"Dice In Play: %d" , (playerArray.count * 5)]);
    diceInPlay = (playerArray.count * 5);
    [self loadDice:1];
}

-(void)printHand{
    for (int i = 0 ; i <playerArray.count ; i++){
        NSLog([[playerArray objectAtIndex:i] name]);
        NSLog(@"%d", [[playerArray objectAtIndex:i]hand].count);
        
        for(int x = 0; x < [[playerArray objectAtIndex:i]hand].count; x++){
            NSLog(@": %@",[[[playerArray objectAtIndex:i]hand]objectAtIndex:x] );
        }
    }
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(alertView.tag ==0){
        NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
        if ([title isEqualToString: @"2"]){
            numPlayers = 2;
            [self addPlayers:2];
        }
        else if ([title isEqualToString: @"3"]){
            numPlayers = 3;
            NSLog(@"3");
            [self addPlayers:3];
        }
        else if ([title isEqualToString: @"4"]){
            numPlayers = 4;
            NSLog(@"4");
            [self addPlayers:4];
        }
    }
    else if(alertView.tag ==1){
        NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
        if ([title isEqualToString: @"1"]){
            claimf = 1;
        }
        else if ([title isEqualToString: @"2"]){
            claimf = 2;
        }
        else if ([title isEqualToString: @"3"]){
            claimf = 3;
        }
        else if ([title isEqualToString: @"4"]){
            claimf = 4;
        }
        else if ([title isEqualToString: @"5"]){
            claimf = 5;
        }
        else if ([title isEqualToString: @"6"]){
            claimf = 6;
        }
        [self getQuant];
    }
    else if(alertView.tag ==2){
        //TODO: new claim has to either be same quanity as last claim but higher face value
        //      or higher quanitty. Add user input error checking.
        
        UITextField *textField = [alertView textFieldAtIndex:0];
        claimq = [textField.text integerValue];
        
        NSLog(@"Quantity %d",claimq);
        
        claimText.text = [NSString stringWithFormat:@"Claim: %d %d's", claimq, claimf];
        
        int next;
        NSLog(@"currentPlayer: %d",currentPlayer);

        if(currentPlayer + 1 <= numPlayers){
            next = (currentPlayer + 1);
            currentPlayer++;
        }
        else{
            next = 1;
            currentPlayer = 1;
        }
        NSLog(@"Next: %d",next);

        [self nextTurn:next];
        
    }

    
}

-(void) nextTurn:(int)next{
    //TODO: 5 seconds to hide dice and change status text to pass to the next person
    //after 5 seconds, load dice of next player and change player text
    playersTurnText.text = [NSString stringWithFormat:@"Player: Player %d", next];
    //load dice of currentPlayer
    currentPlayer = next;
    [self loadDice:next];
}

-(void) getQuant{
    //get quantity
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quantity" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    alert.alertViewStyle= UIAlertViewStylePlainTextInput;
    alert.tag = 2;
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //instantiate global variables and call newGame()
    [self newGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)claimButton:(id)sender {
    //get face value
    UIAlertView * alert1 = [[UIAlertView alloc] initWithTitle:@"Face Value of your claim" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"1",@"2", @"3",@"4", @"5", @"6", nil];
    alert1.tag = 1;
    [alert1 show];

    
}

-(void)removeDie:(int)player{
    if([[playerArray objectAtIndex:player] handSize] >= 2){
        int oldSize = [[playerArray objectAtIndex:player] handSize];
        [[playerArray objectAtIndex:player] setHandSize:(oldSize-1)];
    }
    else{
        //TODO player lost and is out of the game decrement player array, etc.
    }
    diceInPlay--;
    diceInPlayText.text = [NSString stringWithFormat:@"Dice In Play: %d", diceInPlay];
}
- (IBAction)doubtButton:(id)sender {
    //go through all dice on the table and see if the claim is correct
    int realQ = 0;
    
    for (int i = 0; i < playerArray.count ; i++){
        for(int x = 0 ; x < [[playerArray objectAtIndex:i] hand].count ; x++){
            int num = [[[[playerArray objectAtIndex:i] hand] objectAtIndex:x] integerValue];
            if (num == claimf | num == 1 ){
                realQ++;
            }
        }
    }
    
    //if the claim is not correct take a dice from the previous player and start next turn with them
    
    statusText.text = [NSString stringWithFormat: @"Actual %d %d's", realQ, claimf];

    if(realQ < claimq){
        if (currentPlayer == 1){
            [self removeDie:(numPlayers-1)];
            [self reRoll];
            [self nextTurn:(numPlayers)];
        }
        else{
            [self removeDie:(currentPlayer - 2)];   //-2 beacouse we have to handle 0 array index start
            [self reRoll];
            [self nextTurn:(currentPlayer-1)];

        }
    }
    //else take dice from current player and start next turn with them
    else{
        [self removeDie:(currentPlayer-1)];
        [self reRoll];
        [self nextTurn:currentPlayer];

    }
    
    //TODO: check if whoever lost a die is down to 0 dice, if so remove them from the playerList
    
    //TODO: check end game conditions
}

-(void) reRoll{
    //loop through all players and call there member reroll function
    for (int i = 0; i < playerArray.count ; i++){
        [[playerArray objectAtIndex:i] newHand];
    }
    [self printHand];
    claimText.text = @"Make A Claim";

}

- (IBAction)exactButton:(id)sender {
    //go through all dice and see if there is exactly what is claimed to be
    
    //if there is then add a die to current players hand if they have less then 5
    
    //else take a dice
    
    //Next turn starts with currentPlayer as long as they have 1 or more die

    
    //TODO: check if whoever lost a die is down to 0 dice, if so remove them from the playerList
    
    //TODO: check end game conditions
    
}
@end
