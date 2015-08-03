//
//  main.m
//  VisualTestings
//
//  Created by Vladica Pesic on 28/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#include <dlfcn.h>

typedef int (*ObjCLogProc)(BOOL, const char *, const char *, SEL);
typedef void (*logObjcMessageSends_t)(ObjCLogProc logProc);
logObjcMessageSends_t logObjcMessageSends = 0;


int main(int argc, char * argv[]) {
	@autoreleasepool {
		logObjcMessageSends = dlsym(RTLD_DEFAULT, "logObjcMessageSends");
		
		if (logObjcMessageSends != 0)
//			logObjcMessageSends(MyLogObjCMessageSend);
		
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
