//
// KRToastr.h
//
// Copyright (c) 2014 Kieran O'Neill
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface KRToastr : UIView

extern NSTimeInterval const kToastrLengthShort;
extern NSTimeInterval const kToastrLengthLong;

@property (readwrite, nonatomic) CGFloat transparency;
@property (strong, nonatomic) UIColor* backgroundColour;
@property (strong, nonatomic) UIFont* font;
@property (strong, nonatomic) UIImage* image;
@property (readwrite, nonatomic) NSTimeInterval length;
@property (strong, nonatomic) NSString* message;
@property (strong, nonatomic) UIColor* textColour;

/**
 * Shows the KRToastr for a while then slides it off screen and
 * removes it from the superview. Once the KRToastr has been removed,
 * the completion block is run.
 *
 * @param completion a block to run when the KRToastr view disappears.
 */
-(void)show:(void (^)(BOOL finished))completion;

#pragma mark - Static methods.

/**
 * Intialises the view with the default values. It returns an
 * instance of the KRToastr view for customisation.
 *
 * @param viewController the viewcontroller to add the KRToastr to.
 * @return an initialised instance of KRToastr.
 */
+(KRToastr*)initialiseWithViewController:(UIViewController*)viewController;

/**
 * Intialises and shows the KRToastr view. This is an all-in-one method
 * that will display the KRToastr view in the view controller with
 * the values supplied. This displays a KRToastr without an image.
 *
 * @param viewController the viewcontroller to add the KRToastr to.
 * @param message the message to display in the label.
 * @param length the length of time to display the KRToastr.
 * @param completion a block to run when the KRToastr view disappears.
 */
+(void)showToastrMessage:(UIViewController*)viewController message:(NSString*)message length:(NSTimeInterval)length completion:(void (^)(BOOL finished))completion;

/**
 * Intialises and shows the KRToastr view. This is an all-in-one method
 * that will display the KRToastr view in the view controller with
 * the values supplied. This displays a KRToastr with an image.
 *
 * @param viewController the viewcontroller to add the KRToastr to.
 * @param image an image to display.
 * @param message the message to display in the label.
 * @param length the length of time to display the KRToastr.
 * @param completion a block to run when the KRToastr view disappears.
 */
+(void)showToastrMessageWithImage:(UIViewController*)viewController image:(UIImage*)image message:(NSString*)message length:(NSTimeInterval)length completion:(void (^)(BOOL finished))completion;

@end
