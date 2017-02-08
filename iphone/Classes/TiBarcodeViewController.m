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
        _scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:[self view]];
        _shouldAutorotate = NO;
    }
    
    return self;
}

- (void)setOverlayView:(UIView *)view
{
    [view setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [[self view] addSubview:view];
}

- (BOOL)shouldAutorotate
{
    return _shouldAutorotate;
}

@end
