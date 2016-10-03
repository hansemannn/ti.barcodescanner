/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiBarcodescannerScannerViewProxy.h"
#import "TiBarcodescannerScannerView.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation TiBarcodescannerScannerViewProxy

-(MTBBarcodeScanner*)scanner
{
    return [(TiBarcodescannerScannerView*)[self view] scanner];
}

- (NSNumber*)canShowScanner:(id)unused
{
    // There must be a camera and permissions need to be granted
    return NUMBOOL([MTBBarcodeScanner cameraIsPresent] && ![MTBBarcodeScanner scanningIsProhibited]);
}

- (void)startScanning:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    KrollCallback *successCallback = [args objectForKey:@"success"];
    KrollCallback *errorCallback = [args objectForKey:@"error"];
    
    NSError *error = nil;

    [[self scanner] startScanningWithResultBlock:^(NSArray *codes) {
        AVMetadataMachineReadableCodeObject *code = [codes firstObject];
        NSLog(@"Found code: %@", code.stringValue);
        
        NSDictionary * propertiesDict = @{
            @"success": NUMBOOL(YES),
            @"result": [(AVMetadataMachineReadableCodeObject*)[codes firstObject] stringValue]
        };
        NSArray * invocationArray = [[NSArray alloc] initWithObjects:&propertiesDict count:1];
        
        [successCallback call:invocationArray thisObject:self];
        [invocationArray release];
        
        [self hide:nil];
    } error:&error];
    
    if (error) {
        NSDictionary * propertiesDict = @{
            @"success": NUMBOOL(NO),
            @"error": [error localizedDescription],
            @"code": NUMINTEGER([error code])
        };
        NSArray * invocationArray = [[NSArray alloc] initWithObjects:&propertiesDict count:1];
        
        [errorCallback call:invocationArray thisObject:self];
        [invocationArray release];
    }
}

- (void)stopScanning:(id)unused
{
    [[self scanner] stopScanning];
}

#pragma mark Helper

USE_VIEW_FOR_CONTENT_WIDTH

USE_VIEW_FOR_CONTENT_HEIGHT

- (TiDimension)defaultAutoWidthBehavior:(id)unused
{
    return TiDimensionAutoFill;
}

- (TiDimension)defaultAutoHeightBehavior:(id)unused
{
    return TiDimensionAutoFill;
}

@end
