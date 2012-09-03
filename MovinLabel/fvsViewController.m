//
//  fvsViewController.m
//  MovinLabel
//
//  Created by DevZloi on 04.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "fvsViewController.h"
#import "MovingLabel.h"

@interface fvsViewController () <MovingLableDelegate>
@property(nonatomic, retain) MovingLabel *movinlabel;
@end

@implementation fvsViewController
@synthesize movinlabel = _movinlabel;

-(void) dealloc {
    [_movinlabel release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movinlabel =
      [[[MovingLabel alloc] initWithFrame:(CGRect){10,20,200,50}] autorelease];  
    self.movinlabel.delegate = self;
    [self.movinlabel setText:@"create movinlabel class......................."];
    [self.movinlabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:self.movinlabel];
}

- (void)viewDidUnload {
    self.movinlabel = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonLeft:(id)sender {
    [self.movinlabel setText:@"button Left Click......................."];
    [self.movinlabel setTextColor:[UIColor redColor]];
}

- (IBAction)buttonRight:(id)sender {
    [self.movinlabel setText:@"button Rigth class......................."];
    [self.movinlabel setTextColor:[UIColor blueColor]];
}

- (IBAction)buttonStop:(id)sender {
    [self.movinlabel stopAnimationText];
}

-(void) movingLabelClick:(id)touch {
    [self.movinlabel setTextFont:[UIFont boldSystemFontOfSize:18]];
    [self.movinlabel setText:@"Tap Click!"];
    [self.movinlabel setTextColor:[UIColor yellowColor]];
}
@end
