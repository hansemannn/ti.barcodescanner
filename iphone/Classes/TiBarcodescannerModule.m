/**
 * ti.barcodescanner
 *
 * Created by Your Name
 * Copyright (c) 2016 Your Company. All rights reserved.
 */

#import "TiBarcodescannerModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiBarcodescannerModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"dcf42617-0190-48f1-b3a6-96070fb439fc";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.barcodescanner";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[DEBUG] %@ loaded",self);
}

@end
