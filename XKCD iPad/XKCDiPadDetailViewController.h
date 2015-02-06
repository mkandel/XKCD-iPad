//
//  XKCDiPadDetailViewController.h
//  XKCD iPad
//
//  Created by marc on 1/28/13.
//  Copyright (c) 2013 marc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XKCDiPadDetailViewController : UIViewController <UISplitViewControllerDelegate>

- (void)configureView;

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *comicImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
