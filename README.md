KRToastr
========

A lightweight view that displays a customisable toast-like message for iOS.

![Screenshot](/screenshots/krtoastr_screenshot.png?raw=true)

## Installation

1. Simply add the `KRToastr.h` and `KRToastr.m` source files to your project.
2. Include KRToastr wherever you need it with `#import "KRToastr.h"`.

## Usage

There are three static methods to use show the toast message, all three methods require a `UIViewController` in order to attach it's self to a view.

The two `[KRToastr showToastrMessageWithImage:]` methods (one with an image, one without) are convenience methods that display the KRToastr view with default attributes, aside from the attributes specified in the parameters.

```objective-c
[KRToastr showToastrMessageWithImage:self 
  image:[UIImage imageNamed:@"alert_icon"] 
  message:@"This is a Toastr with an image" 
  length:kToastrLengthShort 
  completion:nil];
```
For extended customisation of the view, the method `[KRToastr initialiseWithViewController:]` returns an initialised view that can have it's attributes changed before it is displayed. To display the KRToastr view simply use `[KRToastr show:]`.

```objective-c
KRToastr* toastr = [KRToastr initialiseWithViewController:self];

// Configure the attributes.
toastr.image = [UIImage imageNamed:@"alert_icon"];
toastr.message = @"This is a Toastr message.";
toastr.textColour = [UIColor blackColor];
toastr.backgroundColour = [UIColor redColor];
toastr.transparency = 0.55f;
  
// Shows the KRToastr message.
[toastr show:nil];
```
Each of the methods have a completion block that is run once the KRToastr message disappears.

## License

Copyright (c) 2014 Kieran O'Neill

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

- If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
