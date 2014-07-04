//
//  JSViewController.m
//  JSProgressObserver
//
//  Created by Jonas Schmid on 07/04/2014.
//  Copyright (c) 2014 Jonas Schmid. All rights reserved.
//

#import "JSViewController.h"

#import "JSProgressObserver.h"

@interface JSViewController ()
@property(weak, nonatomic) IBOutlet UIProgressView *progressView;

@property NSProgress *progress;
@end

@implementation JSViewController {
  JSProgressObserver *obs;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [self launchProgress];
}

- (void)launchProgress {
  self.progress = [NSProgress progressWithTotalUnitCount:100];

  obs = [[JSProgressObserver alloc] initWithProgressView:self.progressView
                                                progress:self.progress];

  dispatch_async(
      dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
          for (int i = 0; i < 100; ++i) {
            self.progress.completedUnitCount++;
            [NSThread sleepForTimeInterval:1];
          }
      });
}

@end
