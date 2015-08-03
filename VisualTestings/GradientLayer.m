//
//  GradientLayer.m
//  VisualTestings
//
//  Created by Vladica Pesic on 28/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import "GradientLayer.h"

@implementation GradientLayer

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setNeedsDisplay];
	}
	return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
	
	size_t gradLocationsNum = 2;
	CGFloat gradLocations[2] = {0.8f, 0.9f};
	CGFloat gradColors[8] = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,1.f};
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, gradColors, gradLocations, gradLocationsNum);
	CGColorSpaceRelease(colorSpace);
	
	CGPoint gradCenter= CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
	float gradRadius = MIN(self.bounds.size.width , self.bounds.size.height) ;
	
	CGContextDrawRadialGradient (ctx, gradient, gradCenter, 0, gradCenter, gradRadius, kCGGradientDrawsAfterEndLocation);
	
	
	CGGradientRelease(gradient);
}

@end
