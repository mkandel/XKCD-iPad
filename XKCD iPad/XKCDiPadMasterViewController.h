//
//  XKCDiPadMasterViewController.h
//  XKCD iPad
//
//  Created by marc on 1/28/13.
//  Copyright (c) 2013 marc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XKCDiPadDetailViewController;

#import <CoreData/CoreData.h>

@interface XKCDiPadMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) XKCDiPadDetailViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)randomPressed:(UIBarButtonItem *)sender;

@end
