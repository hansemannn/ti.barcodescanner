/**
 * ti.barcodescanner
 *
 * Created by Your Name
 * Copyright (c) 2016 Your Company. All rights reserved.
 */

#import "TiModule.h"
#import "TiBarcodeViewController.h"

@interface TiBarcodescannerModule : TiModule {
    TiBarcodeViewController *barcodeViewController;
}

- (NSNumber*)canShowScanner:(id)unused;

- (void)capture:(id)args;

@end
