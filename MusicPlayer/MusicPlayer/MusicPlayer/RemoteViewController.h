//
//  RemoteViewController.h
//  MusicPlayer
//
//  Created by Xu Jingwei on 9/7/13.
//  Copyright (c) 2013 Codigator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AddURLViewController.h"
#import "MPAppDelegate.h"
@interface RemoteViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,addURLDelegate,NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
