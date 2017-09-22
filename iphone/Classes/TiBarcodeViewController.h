/**
 * Ti.BarcodeScanner
 * Copyright (c) 2017-present by Hans Knöchel. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

@class MTBBarcodeScanner;

@interface TiBarcodeViewController : UIViewController {

}

- (instancetype)initWithObjectTypes:(NSArray *)objectTypes;

- (void)setOverlayView:(UIView *)view;

@property(nonatomic, strong) MTBBarcodeScanner *scanner;

@property(nonatomic, assign) BOOL shouldAutorotate;

@end
