/**
 * ti.barcodescanner
 *
 * Created by Your Name
 * Copyright (c) 2016 Your Company. All rights reserved.
 */

#import "TiModule.h"
#import "TiBarcodeViewController.h"
#import "MTBBarcodeScanner.h"

@interface TiBarcodescannerModule : TiModule {
    TiBarcodeViewController *barcodeViewController;
    
    MTBCamera selectedCamera;
    
    MTBTorchMode selectedLEDMode;
    
    BOOL allowRotation;
    
    NSString *displayedMessage;
}

- (id)canShow:(id)unused;

- (void)capture:(id)args;

- (void)freezeCapture:(id)unused;

- (void)unfreezeCapture:(id)unused;

- (void)captureStillImage:(id)value;

- (void)cancel:(id)unused;

- (void)setUseLED:(id)value;

- (id)useLED;

- (void)setAllowRotation:(id)value;

- (void)setUseFrontCamera:(id)value;

- (id)useFrontCamera;

@end
