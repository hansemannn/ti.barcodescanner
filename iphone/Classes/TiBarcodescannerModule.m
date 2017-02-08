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
#import "TiViewProxy.h"
#import "MTBBarcodeScanner.h"
#import "TiApp.h"

@implementation TiBarcodescannerModule

#pragma mark Internal

-(id)moduleGUID
{
	return @"dcf42617-0190-48f1-b3a6-96070fb439fc";
}

-(NSString*)moduleId
{
	return @"ti.barcodescanner";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];

	NSLog(@"[DEBUG] %@ loaded",self);
}

#pragma mark Public API's

- (TiBarcodeViewController *)barcodeViewController
{
    if (!barcodeViewController) {
        barcodeViewController = [[TiBarcodeViewController alloc] init];
    }
    
    return barcodeViewController;
}

- (id)canShowScanner:(id)unused
{
    return NUMBOOL([MTBBarcodeScanner cameraIsPresent] && ![MTBBarcodeScanner scanningIsProhibited]);
}

- (void)capture:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    BOOL keepOpen = [TiUtils boolValue:[args objectForKey:@"keepOpen"] def:NO];
    BOOL animate = [TiUtils boolValue:[args objectForKey:@"animate"] def:YES];
    NSArray *acceptedFormats = [args objectForKey:@"acceptedFormats"];
    TiViewProxy *overlayProxy = [args objectForKey:@"overlay"];
    
    NSError *error = nil;
    
    if (overlayProxy != nil) {
        [[self barcodeViewController] setOverlayView:[self prepareOverlayWithProxy:overlayProxy]];
    }
    
    if (acceptedFormats != nil) {
        [[[self barcodeViewController] scanner] setMetaDataObjectTypes:[TiBarcodescannerModule formattedMetaDataObjectTypes:acceptedFormats]];
        // TODO: Implement custom functionality
    }
    
    [[[self barcodeViewController] scanner] startScanningWithResultBlock:^(NSArray *codes) {
        [self fireEvent:@"success" withObject:@{
            @"result": [(AVMetadataMachineReadableCodeObject*)[codes firstObject] stringValue],
            @"contentType": @""
        }];
        
        if (!keepOpen) {
            [self closeScanner];
        }
    } error:&error];
    
    if (error) {
        [self fireEvent:@"error" withObject:@{
            @"message": [error localizedDescription] ?: @"Unknown error occurred.",
            @"contentType": @""
        }];
        
        if (!keepOpen) {
            [self closeScanner];
        }
    }
    
    [[[[TiApp app] controller] topPresentedController] presentViewController:[self barcodeViewController] animated:animate completion:nil];
}

- (void)cancel:(id)unused
{
    [self closeScanner];
    [self fireEvent:@"cancel" withObject:nil];
}

- (void)setUseLED:(id)value
{
    [[[self barcodeViewController] scanner] setTorchMode:[TiUtils boolValue:value def:YES] ? MTBTorchModeOn : MTBTorchModeOff];
}

- (id)useLED
{
    return NUMBOOL([[[self barcodeViewController] scanner] torchMode] == MTBTorchModeOn);
}

- (void)setDisplayedMessage:(id)value
{
    ENSURE_TYPE(value, NSString);
    [self replaceValue:value forKey:@"displayedMessage" notification:NO];

    // TODO: Implement custom functionality
}

- (void)setAllowRotation:(id)value
{
    ENSURE_TYPE(value, NSNumber);
    [self replaceValue:value forKey:@"allowRotation" notification:NO];

    // TODO: Implement custom functionality
}

- (void)setUseFrontCamera:(id)value
{
    ENSURE_TYPE(value, NSNumber);
    [self replaceValue:value forKey:@"useFrontCamera" notification:NO];
    
    [[[self barcodeViewController] scanner] setCamera:[TiUtils boolValue:value def:YES] ? MTBCameraFront : MTBCameraBack];
}

- (id)useFrontCamera
{
    return NUMBOOL([[[self barcodeViewController] scanner] camera] == MTBCameraFront);
}

#pragma mark Internal

- (NSArray *)formattedMetaDataObjectTypes:(NSArray *)array
{
    return @[AVMetadataObjectTypeQRCode];
}

- (UIView *)prepareOverlayWithProxy:(TiViewProxy *)overlayProxy
{
        [overlayProxy windowWillOpen];
        
        CGSize size = [overlayProxy view].bounds.size;
        
#ifndef TI_USE_AUTOLAYOUT
        CGFloat width = [overlayProxy autoWidthForSize:CGSizeMake(MAXFLOAT,MAXFLOAT)];
        CGFloat height = [overlayProxy autoHeightForSize:CGSizeMake(width,0)];
#else
        CGSize s = [[overlayProxy view] sizeThatFits:CGSizeMake(MAXFLOAT,MAXFLOAT)];
        CGFloat width = s.width;
        CGFloat height = s.height;
#endif
        
        if (width > 0 && height > 0) {
            size = CGSizeMake(width, height);
        }
        
        if (CGSizeEqualToSize(size, CGSizeZero) || width==0 || height == 0) {
            size = [UIScreen mainScreen].bounds.size;
        }
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        [TiUtils setView:[overlayProxy view] positionRect:rect];
        [overlayProxy layoutChildren:NO];
    
    return [overlayProxy view];
}

- (void)closeScanner
{
    if ([[[self barcodeViewController] scanner] isScanning]) {
        [[[self barcodeViewController] scanner] stopScanning];
    }
    
    [[self barcodeViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
