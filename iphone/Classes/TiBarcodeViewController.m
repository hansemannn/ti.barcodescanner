/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiBarcodeViewController.h"
#import "MTBBarcodeScanner.h"

@implementation TiBarcodeViewController

- (instancetype)init
{
    if (self = [super init]) {
        _scanner = [[MTBBarcodeScanner alloc] initWithMetadataObjectTypes:nil previewView:[self view]];
    }
    
    return self;
}


- (void)setOverlayView:(UIView *)view
{
    [view setCenter:CGPointMake(([[UIScreen mainScreen] bounds].size.width / 2), ([[UIScreen mainScreen] bounds].size.width / 2))];
    [[self view] addSubview:view];
}

@end
