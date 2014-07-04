//
//  JSProgressObserver.m
//  Pods
//
//  Created by Jonas Schmid on 04/07/14.
//
//

#import "JSProgressObserver.h"

void *observerContext = &observerContext;

@implementation JSProgressObserver

- (instancetype)initWithProgressView:(UIProgressView *)view
                            progress:(NSProgress *)progress {

  if (self = [super init]) {
    _progressView = view;
    _progress = progress;
    [self observe];
  }

  return self;
}

- (void)dealloc {
  [_progress removeObserver:self forKeyPath:@"fractionCompleted"];
}

- (void)observe {
  [_progress addObserver:self
              forKeyPath:@"fractionCompleted"
                 options:NSKeyValueObservingOptionNew
                 context:observerContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {

  if (observerContext == context) {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = self.progress.fractionCompleted;
    });
  } else {
    [super observeValueForKeyPath:keyPath
                         ofObject:object
                           change:change
                          context:context];
  }
}

@end
