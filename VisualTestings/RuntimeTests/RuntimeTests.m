//
//  RuntimeTests.m
//  VisualTestings
//
//  Created by Vladica Pesic on 30/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import "RuntimeTests.h"

#import <objc/runtime.h>

/*!
 
 objc_... interact with toplevel runtime (eg register a class)
 class_... interact with classes (eg make a subclass)
 object_... interact with objects (eg get classname)
 method_... interact with methods (eg get the number of arguments)
 ivar_... interact with ivars (eg get the type of an ivar)
 property_... interact with properties (eg get the name of a property)
 protocol_... interact with protocols (eg get properties of a protocol)
 sel_... interact with selectors (eg register selector names)
 imp_... interact with method implementations (provide implementations using blocks)

 */

@implementation RuntimeTests

- (instancetype)init {
	if (self = [super init]) {
		
	}
	return self;
}

@end
