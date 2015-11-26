//
//  ViewController.h
//  liarsDice
//
//  Created by Patrick on 11/25/15.
//  Copyright (c) 2015 FSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *statusText;

@property (weak, nonatomic) IBOutlet UILabel *claimText;
@property (weak, nonatomic) IBOutlet UILabel *diceInPlayText;
@property (weak, nonatomic) IBOutlet UIImageView *dice1;
@property (weak, nonatomic) IBOutlet UIImageView *dice2;
@property (weak, nonatomic) IBOutlet UIImageView *dice3;
@property (weak, nonatomic) IBOutlet UIImageView *dice4;
@property (weak, nonatomic) IBOutlet UIImageView *dice5;
@property (weak, nonatomic) IBOutlet UILabel *playersTurnText;

- (IBAction)claimButton:(id)sender;
- (IBAction)doubtButton:(id)sender;
- (IBAction)exactButton:(id)sender;


@end

