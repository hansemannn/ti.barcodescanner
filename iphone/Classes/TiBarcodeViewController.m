/**
 * Ti.BarcodeScanner
 * Copyright (c) 2017-present by Hans Knöchel. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiBarcodeViewController.h"
#import "MTBBarcodeScanner.h"

@implementation TiBarcodeViewController

- (instancetype)initWithObjectTypes:(NSArray *)objectTypes
{
    if (self = [super init]) {
        _scanner = [[MTBBarcodeScanner alloc] initWithMetadataObjectTypes:objectTypes
                                                              previewView:[self view]];
        _shouldAutorotate = NO;
    }
    
    return self;
}

- (void)setOverlayView:(UIView *)view
{
    [[self view] addSubview:view];
}

- (BOOL)shouldAutorotate
{
    return _shouldAutorotate;
}

@end
