/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

@class MTBBarcodeScanner;

@interface TiBarcodeViewController : UIViewController {

}

- (void)setOverlayView:(UIView *)view;

@property(nonatomic, strong) MTBBarcodeScanner *scanner;

@end
