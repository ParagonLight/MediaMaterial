//
//  ParagonViewController.m
//  VideoPlayer
//
//  Created by XU Jingwei on 6/21/13.
//  Copyright (c) 2013 xu jingwei. All rights reserved.
//

#import "ParagonViewController.h"

@interface ParagonViewController ()

@end

@implementation ParagonViewController
@synthesize moviePlayer = _moviePlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


-(IBAction)playMovieRemote{
    NSURL *url = [NSURL URLWithString:@"https://d396qusza40orc.cloudfront.net/startup/source_videos%2Flecture2-part1-your-first-webapp.mp4"];

    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayerBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer];
    
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}


-(IBAction)playMovieLocal{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp4"]];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayerBackDidFinish:)
                                        name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer];
    
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}

-(void)moviePlayerBackDidFinish:(NSNotification*)notification{
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if([player respondsToSelector:@selector(setFullscreen:animated:)]){
        [player.view removeFromSuperview];
    }
}

@end
