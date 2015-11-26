//
//  Player.h
//  liarsDice
//
//  Created by Patrick on 11/25/15.
//  Copyright (c) 2015 FSU. All rights reserved.
//

#ifndef liarsDice_Player_h
#define liarsDice_Player_h

@interface Player : NSObject{
   // r = arc4random_uniform(6);
}

@property NSString *name;
@property NSMutableArray *hand;
@property int handSize;

-(void)newHand;
-(id) init:(int)num;


@end

#endif
