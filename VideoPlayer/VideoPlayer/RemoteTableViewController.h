//
//  RemoteTableViewController.h
//  VideoPlayer
//
//  Created by Xu Jingwei on 9/6/13.
//  Copyright (c) 2013 xu jingwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AddURLViewController.h"
#import "ParagonAppDelegate.h"
@interface RemoteTableViewController : UITableViewController<addURLDelegate,NSFetchedResultsControllerDelegate>{
    MPMoviePlayerController *moviePlayer;
}

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)addUrl:(id)sender;

@end
