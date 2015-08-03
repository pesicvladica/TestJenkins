//
//  SimpleTimer.m
//  VisualTestings
//
//  Created by Vladica Pesic on 30/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import "SimpleTimer.h"

static NSDate *TimerDate;

@interface SimpleTimer ()

@end

@implementation SimpleTimer

+ (void)start {
	TimerDate = [NSDate date];
}

+ (void)stop {
	NSLog(@"Execution time: %f", -[TimerDate timeIntervalSinceNow]);
}

@end
