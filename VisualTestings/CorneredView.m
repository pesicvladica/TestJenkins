//
//  CorneredView.m
//  VisualTestings
//
//  Created by Vladica Pesic on 29/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import "CorneredView.h"

@implementation CorneredView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
//	NSMutableArray *marrColors = [@[(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[UIColor greenColor].CGColor] mutableCopy];
//	
//	CGContextRef ref = UIGraphicsGetCurrentContext();
//	CFArrayRef colors =(__bridge CFArrayRef)([NSArray arrayWithArray:marrColors]);
//	CGColorSpaceRef colorSpc = CGColorSpaceCreateDeviceRGB();
//	CGFloat gradLocations[3] = {0.8f, 0.9f, 1.0f};
//	CGGradientRef gradient = CGGradientCreateWithColors(colorSpc, colors, gradLocations);
//
//	 //generates Radial Gradient
//	CGContextDrawRadialGradient(ref, gradient, CGPointMake(self.frame.size.width/2,self.frame.size.height/2), 0, CGPointMake(self.frame.size.width/2,self.frame.size.height/2), 330, 0);
//	
//	CGColorSpaceRelease(colorSpc);
//	CGGradientRelease(gradient);
}


@end
