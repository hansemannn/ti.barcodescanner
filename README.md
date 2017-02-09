# Ti.BarcodeScanner

And experimental attempt to map the Ti.Barcode API to a `AVCaptureDevice` based implementation.

## API's
### Methods
- [x] canShow()
- [x] capture(args)
- [x] cancel()

### Properties
- [x] useLED [true/false]
- [x] useFrontCamera [true/false]
- [x] overlay
- [x] allowRotation
- [x] acceptedFormats

### Constants
- [x] FORMAT_NONE // Deprecated, don't specify types instead
- [x] FORMAT_QR_CODE
- [x] FORMAT_DATA_MATRIX
- [x] FORMAT_UPC_E
- [x] FORMAT_UPC_A
- [x] FORMAT_EAN_8
- [x] FORMAT_EAN_13
- [x] FORMAT_CODE_128
- [x] FORMAT_CODE_39
- [x] FORMAT_CODE_93 // New!
- [x] FORMAT_CODE_39_MOD_43 // New!
- [x] FORMAT_ITF
- [x] FORMAT_PDF_417 // New!
- [x] FORMAT_AZTEC // New!
- [x] FORMAT_FACE // New!
- [x] FORMAT_INTERLEAVED_2_OF_5 // New!

## Example
Check `example/app.js` for an example.

## Author
Hans Knöchel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

## License
Apache 2.0

## Contributing
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/hansemannn/ti.barcodescanner/pull/new/master)!

