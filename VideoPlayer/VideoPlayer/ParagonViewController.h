//
//  ParagonViewController.h
//  VideoPlayer
//
//  Created by XU Jingwei on 6/21/13.
//  Copyright (c) 2013 xu jingwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ParagonViewController : UIViewController{
    MPMoviePlayerController *moviePlayer;
}

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

-(IBAction) playMovieLocal;
-(IBAction) playMovieRemote;

@end
