//
//  MPAppDelegate.h
//  MusicPlayer
//
//  Created by dev27 on 5/13/13.
//  Copyright (c) 2013 Codigator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
