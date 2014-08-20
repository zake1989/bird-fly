//
//  xyzViewController.h
//  Bird fly
//
//  Created by Stephen on 7/03/2014.
//  Copyright (c) 2014 Stephen. All rights reserved.
//

#import <UIKit/UIKit.h>

int Y;
BOOL Start;
int RandomPosition;
int ScoreNumber;
int HighScore;

@interface xyzViewController : UIViewController
{
    
    IBOutlet UILabel *Intro1;
    IBOutlet UILabel *Intro2;
    IBOutlet UILabel *Intro3;
    
    IBOutlet UIImageView *Bird;
    
    NSTimer *timer;
    
    IBOutlet UIImageView *Bar;
    IBOutlet UIImageView *Woodbar;
    IBOutlet UIImageView *Box1;
    IBOutlet UIImageView *Box2;
    IBOutlet UIImageView *Box3;
    IBOutlet UIImageView *Box4;
    IBOutlet UIImageView *Box5;
    IBOutlet UIImageView *Box6;
    IBOutlet UIImageView *Box7;
    IBOutlet UIImageView *Box8;
    
    
    IBOutlet UILabel *Score;
    NSTimer *Scorer;
}

-(void)BirdMove;
-(void)Collision;
-(void)EndGame;
-(void)NewGame;
-(void)Scoring;

@end

