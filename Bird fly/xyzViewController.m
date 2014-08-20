//
//  xyzViewController.m
//  Bird fly
//
//  Created by Stephen on 7/03/2014.
//  Copyright (c) 2014 Stephen. All rights reserved.
//

#import "xyzViewController.h"

@interface xyzViewController ()

@end

@implementation xyzViewController

-(void)Scoring
{
    ScoreNumber = ScoreNumber + 1;
    Score.text = [NSString stringWithFormat:@"Score:%i",ScoreNumber];
}

-(void)Collision
{
    if (CGRectIntersectsRect(Bird.frame, Bar.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Woodbar.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box1.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box2.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box3.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box4.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box5.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box6.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box7.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Box8.frame)) {
        [self EndGame];
    }
    
    if (Bird.center.y >260) {
        [self EndGame];
    }
    
    if (Bird.center.y <1) {
        [self EndGame];
    }
}

-(void)EndGame
{
    if (ScoreNumber > HighScore) {
        HighScore = ScoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScore forKey:@"HighScoreSaved"];
    }
    
    Bird.hidden = YES;
    [timer invalidate];
    [Scorer invalidate];
    
    [self performSelector:@selector(NewGame) withObject:nil afterDelay:2];
    
}

-(void)NewGame
{
    Box1.hidden = YES;
    Box2.hidden = YES;
    Box3.hidden = YES;
    Box4.hidden = YES;
    Box5.hidden = YES;
    Box6.hidden = YES;
    Box7.hidden = YES;
    Box8.hidden = YES;
    Bar.hidden = YES;
    Woodbar.hidden = YES;
    
    Intro1.hidden = NO;
    Intro2.hidden = NO;
    Intro3.hidden = NO;
    
    Bird.hidden = NO;
    Bird.image = [UIImage imageNamed:@"bird.png"];
    Bird.center = CGPointMake(87, 146);
    
    Start = YES;
    
    ScoreNumber = 0;
    Score.text = [NSString stringWithFormat:@"Score: 0"];
    Intro3.text = [NSString stringWithFormat:@"High Score: %i", HighScore];
}

-(void)BirdMove
{
    [self Collision];
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y + Y);
    
    Bar.center = CGPointMake(Bar.center.x - 10, Bar.center.y);
    Woodbar.center = CGPointMake(Woodbar.center.x - 10, Woodbar.center.y);
    Box1.center = CGPointMake(Box1.center.x - 10, Box1.center.y);
    Box2.center = CGPointMake(Box2.center.x - 10, Box2.center.y);
    Box3.center = CGPointMake(Box3.center.x - 10, Box3.center.y);
    Box4.center = CGPointMake(Box4.center.x - 10, Box4.center.y);
    Box5.center = CGPointMake(Box5.center.x - 10, Box5.center.y);
    Box6.center = CGPointMake(Box6.center.x - 10, Box6.center.y);
    Box7.center = CGPointMake(Box7.center.x - 10, Box7.center.y);
    Box8.center = CGPointMake(Box8.center.x - 10, Box8.center.y);
    
    if (Bar.center.x < 0) {
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition +90;
        Bar.center = CGPointMake(810, RandomPosition);
    }
    
    if (Woodbar.center.x < 0) {
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition +90;
        Woodbar.center = CGPointMake(810, RandomPosition);
    }
    
    if (Box1.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box1.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box2.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box2.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box3.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box3.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box3.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box3.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box4.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box4.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box5.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box5.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box6.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box6.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box7.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box7.center = CGPointMake(560, RandomPosition);
    }
    
    if (Box8.center.x < -40) {
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition +265;
        Box8.center = CGPointMake(560, RandomPosition);
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (Start == YES) {
        Intro1.hidden = YES;
        Intro2.hidden = YES;
        Intro3.hidden = YES;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(BirdMove) userInfo:nil repeats:YES];
        Scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Scoring) userInfo:nil repeats:YES];
        
        Start = NO;
        
        Box1.hidden = NO;
        Box2.hidden = NO;
        Box3.hidden = NO;
        Box4.hidden = NO;
        Box5.hidden = NO;
        Box6.hidden = NO;
        Box7.hidden = NO;
        Box8.hidden = NO;
        Bar.hidden = NO;
        Woodbar.hidden = NO;
        
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition + 90;
        Bar.center = CGPointMake(570, RandomPosition);
        
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition + 90;
        Woodbar.center = CGPointMake(1055, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box1.center = CGPointMake(560, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box2.center = CGPointMake(650, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box3.center = CGPointMake(710, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box4.center = CGPointMake(790, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box5.center = CGPointMake(870, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box6.center = CGPointMake(950, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box7.center = CGPointMake(1030, RandomPosition);
        
        RandomPosition = arc4random() %55;
        RandomPosition = RandomPosition + 265;
        Box8.center = CGPointMake(1110, RandomPosition);

    }
    
    Y = -8;
    Bird.image = [UIImage imageNamed:@"birdup.png"];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    Y = 8;
    Bird.image = [UIImage imageNamed:@"birddown.png"];
}

- (void)viewDidLoad
{
    Start = YES;
    Box1.hidden = YES;
    Box2.hidden = YES;
    Box3.hidden = YES;
    Box4.hidden = YES;
    Box5.hidden = YES;
    Box6.hidden = YES;
    Box7.hidden = YES;
    Box8.hidden = YES;
    Bar.hidden = YES;
    Woodbar.hidden = YES;
    
    HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    Intro3.text = [NSString stringWithFormat:@"High Score: %i", HighScore];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
