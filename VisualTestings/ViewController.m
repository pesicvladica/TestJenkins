//
//  ViewController.m
//  VisualTestings
//
//  Created by Vladica Pesic on 28/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import "ViewController.h"

#import "SimpleTimer.h"

#import "GradientLayer.h"
#import "CorneredView.h"

#define INIT   NSDate *startTime;
#define TICK   startTime = [NSDate date];
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);

#define TOP_LEFT(X, Y)\
CGPointMake(rect.origin.x + X * limitedRadius,\
rect.origin.y + Y * limitedRadius)
#define TOP_RIGHT(X, Y)\
CGPointMake(rect.origin.x + rect.size.width - X * limitedRadius,\
rect.origin.y + Y * limitedRadius)
#define BOTTOM_RIGHT(X, Y)\
CGPointMake(rect.origin.x + rect.size.width - X * limitedRadius,\
rect.origin.y + rect.size.height - Y * limitedRadius)
#define BOTTOM_LEFT(X, Y)\
CGPointMake(rect.origin.x + X * limitedRadius,\
rect.origin.y + rect.size.height - Y * limitedRadius)

@import QuartzCore;

@interface UIView (RoundedRect)

- (void)giveBorderWithCornerRadious:(CGFloat)radius borderColor:(UIColor *)borderColor andBorderWidth:(CGFloat)borderWidth;
+ (UIBezierPath*)bezierPathWithIOS7RoundedRect:(CGRect)rect cornerRadius:(CGFloat)radius;

@end

@implementation UIView (RoundedRect)

+ (UIBezierPath*)bezierPathWithIOS7RoundedRect: (CGRect)rect
								  cornerRadius: (CGFloat)radius
{
	UIBezierPath* path = UIBezierPath.bezierPath;
	[path addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2)
					radius:radius
				startAngle:0
				  endAngle:360
				 clockwise:YES];
//	[path addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2)
//					radius:radius
//				startAngle:0
//				  endAngle:360
//				 clockwise:YES];
	[path closePath];
	return path;
}

- (void)giveBorderWithCornerRadious:(CGFloat)radius borderColor:(UIColor *)borderColor andBorderWidth:(CGFloat)borderWidth
{
	
	
	CGRect rect = self.bounds;
	
	//Make round
	// Create the path for to make circle
	UIBezierPath *maskPath = [UIView bezierPathWithIOS7RoundedRect:rect cornerRadius:radius];//[UIBezierPath bezierPathWithRoundedRect:rect
												//   byRoundingCorners:UIRectCornerAllCorners
													//	 cornerRadii:CGSizeMake(NSIntegerMax,0)];
	maskPath.lineCapStyle = kCGLineCapRound;
	maskPath.lineJoinStyle = kCGLineJoinRound;
	
	// Create the shape layer and set its path
	CAShapeLayer *maskLayer = [CAShapeLayer layer];
	
	maskLayer.frame = rect;
	maskLayer.path  = maskPath.CGPath;
	
	// Set the newly created shape layer as the mask for the view's layer
	self.layer.mask = maskLayer;
	
	//Give Border
	//Create path for border
	UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:rect
													 byRoundingCorners:UIRectCornerAllCorners
														   cornerRadii:CGSizeMake(NSIntegerMax, 0)];
	borderPath.lineCapStyle = kCGLineCapRound;
	maskPath.lineJoinStyle = kCGLineJoinRound;
	
	// Create the shape layer and set its path
	CAShapeLayer *borderLayer = [CAShapeLayer layer];
	
	borderLayer.frame       = rect;
	borderLayer.path        = borderPath.CGPath;
	borderLayer.strokeColor = borderColor.CGColor;
	borderLayer.fillColor   = [UIColor clearColor].CGColor;
	borderLayer.lineWidth   = borderWidth;
	
	//Add this layer to give border.
	[[self layer] addSublayer:borderLayer];
}

@end


@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIImageView *imageView4;

@property (nonatomic, strong) CorneredView *viewCircle;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	_imageView1 = (UIImageView *)[self.view viewWithTag:1];
	_imageView2 = (UIImageView *)[self.view viewWithTag:2];
	
	
	
	_imageView4 = (UIImageView *)[self.view viewWithTag:4];
	
	_viewCircle = (CorneredView *)[self.view viewWithTag:5];
	
	[_imageView1 setClipsToBounds:YES];
//	[_imageView2 setClipsToBounds:YES];
	
	[_imageView4 setClipsToBounds:YES];
	
	[_viewCircle setClipsToBounds:YES];
	
	_imageView1.layer.cornerRadius = CGRectGetHeight(_imageView1.frame)/2;
	_imageView2.layer.cornerRadius = CGRectGetHeight(_imageView2.frame)/2;
	
	_imageView4.layer.cornerRadius = CGRectGetHeight(_imageView4.frame)/2;
	
	GradientLayer *gradientLayer = [GradientLayer new];
	gradientLayer.frame = _imageView1.bounds;
	[_imageView1.layer addSublayer:gradientLayer];

//	_imageView1.layer.borderColor = [UIColor blackColor].CGColor;
//	_imageView1.layer.borderWidth = 2;
//	_imageView4.layer.borderColor = [UIColor blackColor].CGColor;
//	_imageView4.layer.borderWidth = 2;
	
	CALayer *sublayer2 = [CALayer layer];
	sublayer2.contents = (id) [UIImage imageNamed:@"Face02"].CGImage;
	sublayer2.shadowOffset = CGSizeMake(0, 3);
	sublayer2.shadowRadius = 5.0;
	sublayer2.shadowColor = [UIColor blackColor].CGColor;
	sublayer2.shadowOpacity = 0.8;
	sublayer2.frame = _imageView2.bounds;
	sublayer2.cornerRadius = 10.0;
	[_imageView2.layer addSublayer:sublayer2];

	[SimpleTimer start];
	_view3 = [self.view viewWithTag:3];
	[_view3 setClipsToBounds:YES];
	_view3.layer.cornerRadius = CGRectGetHeight(_view3.frame)/2;
	_view3.layer.borderWidth = 15;
	_view3.layer.borderColor = [UIColor blackColor].CGColor;
	GradientLayer *gradientLayer3 = [GradientLayer new];
	gradientLayer3.frame = _view3.bounds;
	[_view3.layer addSublayer:gradientLayer3];
	[SimpleTimer stop];
	
	[SimpleTimer start];
	GradientLayer *gradientLayer6 = [GradientLayer new];
	gradientLayer6.frame = [self.view viewWithTag:6].bounds;
	[[self.view viewWithTag:6].layer addSublayer:gradientLayer6];
	[[self.view viewWithTag:6] giveBorderWithCornerRadious:CGRectGetHeight([self.view viewWithTag:6].frame)/2 borderColor:[UIColor blackColor] andBorderWidth:2];
	[SimpleTimer stop];
	
	[[self.view viewWithTag:7].layer setShadowColor:[UIColor yellowColor].CGColor];
	[[self.view viewWithTag:7].layer setShadowOpacity:0.8];
	[[self.view viewWithTag:7].layer setShadowRadius:3.0];
	[[self.view viewWithTag:7].layer setShadowOffset:CGSizeMake(2.0, 2.0)];
	
	[self.view layoutIfNeeded];
	_slider.transform = CGAffineTransformMakeRotation(M_PI_2);
	[_slider setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_slider.superview addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_slider.superview attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
	[_slider.superview addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_slider.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
	[_slider.superview addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_slider.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
	CGRect s = _slider.frame;
	s.size.width = _slider.superview.frame.size.height;
	_slider.frame = s;
	_slider.center = CGPointMake(_slider.superview.frame.size.width/2, _slider.superview.frame.size.height/2);
	[self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
