//
//  XKCDiPadDetailViewController.m
//  XKCD iPad
//
//  Created by marc on 1/28/13.
//  Copyright (c) 2013 marc. All rights reserved.
//

#import "XKCDiPadDetailViewController.h"

@interface XKCDiPadDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation XKCDiPadDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    //NSLog(@"Setting detailItem");
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    UIImage *image;

    if (self.detailItem) {
        self.title = [[self.detailItem valueForKey:@"comic_name"] description];
        image = [UIImage imageWithData:
                 [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:[self.detailItem valueForKey:@"image_url"]]]];
    } else {
        self.title = @"XKCD Browser";
        NSURL *logoImage = [[NSBundle mainBundle]URLForResource:@"xkcd_512x512" withExtension:@"png"];
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:logoImage]];
    }
    CGRect imageRect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    self.comicImage.frame = imageRect;
    self.comicImage.image = image;
    self.scrollView.contentSize = image.size;
    [self.scrollView addSubview:self.comicImage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
