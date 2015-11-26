//
//  Player.m
//  liarsDice
//
//  Created by Patrick on 11/25/15.
//  Copyright (c) 2015 FSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>
#import "Player.h"

@implementation Player{
    
}
// r = arc4random_uniform(6);

-(id)init:(int)num{
    //initialize player name with correct number passed as a paramater
    self.name = [NSString stringWithFormat:@"Player %d", num];
    self.hand = [[NSMutableArray alloc] init];
    self.handSize = 5;
    //initialize new player with a full hand
    for(int i = 0 ; i < 5; i++){
        [self.hand addObject:@(arc4random_uniform(6) + 1)];
    }
    
    return self;
}

-(void) newHand{
    [self.hand removeAllObjects];
    for (int i = 0 ; i <self.handSize ; i++){
        [self.hand addObject:@(arc4random_uniform(6) + 1)];
    }
}


@end