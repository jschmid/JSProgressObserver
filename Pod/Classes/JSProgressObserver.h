//
//  JSProgressObserver.h
//  Pods
//
//  Created by Jonas Schmid on 04/07/14.
//
//

#import <Foundation/Foundation.h>

@interface JSProgressObserver : NSObject

@property(readonly) UIProgressView *progressView;
@property(readonly) NSProgress *progress;

- (instancetype)initWithProgressView:(UIProgressView *)view
                            progress:(NSProgress *)progress;

@end
