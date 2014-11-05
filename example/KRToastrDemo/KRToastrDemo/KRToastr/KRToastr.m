//
//  KRToastr.m
//  KRToastrDemo
//
//  Created by Kieran O'Neill on 05/11/2014.
//
//

#import "KRToastr.h"

@interface KRToastr ()

@property (strong, nonatomic) UIViewController* viewController;

-(id)initWithViewController:(UIViewController*)viewController;

@end

@implementation KRToastr

NSTimeInterval const kToastrLengthShort = 1.5;
NSTimeInterval const kToastrLengthLong = 3.5;

@synthesize transparency;
@synthesize backgroundColour;
@synthesize font;
@synthesize image;
@synthesize length;
@synthesize message;
@synthesize textColour;
// Hidden variables.
@synthesize viewController;

#pragma mark - Initialisers.

-(id)initWithViewController:(UIViewController *)_viewController
{
    self = [super init];
    
    if(self)
    {
        self.viewController = _viewController;
        
        // Set default values.
        self.transparency = 0.74f;
        self.backgroundColour = [UIColor blackColor];
        self.font = [UIFont systemFontOfSize:12.0f];
        self.image = nil;
        self.length = kToastrLengthShort;
        self.message = @"";
        self.textColour = [UIColor whiteColor];
    }
    
    return self;
}

#pragma mark - Static methods.

+(KRToastr*)initialiseWithViewController:(UIViewController *)viewController
{
    KRToastr* toastView = [[KRToastr alloc] initWithViewController:viewController];
    
    return toastView;
}

+(void)showToastrMessage:(UIViewController *)viewController message:(NSString *)message length:(NSTimeInterval)length completion:(void (^)(BOOL))completion
{
    KRToastr* toastView = [KRToastr initialiseWithViewController:viewController];
    
    // Set values.
    toastView.message = message;
    toastView.length = length;
    
    // Show the message.
    [toastView show:completion];
}

+(void)showToastrMessageWithImage:(UIViewController *)viewController image:(UIImage *)image message:(NSString *)message length:(NSTimeInterval)length completion:(void (^)(BOOL))completion
{
    KRToastr* toastView = [KRToastr initialiseWithViewController:viewController];
    
    // Set values.
    toastView.message = message;
    toastView.length = length;
    toastView.image = image;
    
    // Show the message.
    [toastView show:completion];
}

#pragma mark - Hidden methods.

-(void)show:(void (^)(BOOL))completion
{
    CGSize toastContainerViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 50.0f);
    UIView* toastContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, [UIScreen mainScreen].bounds.size.height, toastContainerViewSize.width, toastContainerViewSize.height)];
    UIView* toastInnerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, toastContainerViewSize.width, toastContainerViewSize.height)];
    UIView* toastBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, toastContainerViewSize.width, toastContainerViewSize.height)];
    UILabel* label = nil;
    
    // If there is no image, display a label only.
    if(self.image != nil)
    {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8.0f, 8.0f, 34.0f, 34.0f)];
        label = [[UILabel alloc] initWithFrame:CGRectMake((imageView.frame.origin.x + imageView.frame.size.width + 8.0f), 8.0f, (toastContainerViewSize.width - 16.0f - (imageView.frame.origin.x + imageView.frame.size.width + 8.0f)), 34.f)];
        
        // Set image styling.
        imageView.image = self.image;
        
        [toastInnerView addSubview:imageView];
    }
    else
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(8.0f, 8.0f, (toastContainerViewSize.width - 16.0f), 34.f)];
    }
    
    // Add to the view heirarchies.
    [toastInnerView addSubview:label];
    [toastContainerView addSubview:toastBackgroundView];
    [toastContainerView addSubview:toastInnerView];
    [self.viewController.view addSubview:toastContainerView];
    
    // Set background colours.
    toastBackgroundView.alpha = self.transparency;
    toastBackgroundView.backgroundColor = self.backgroundColour;
    toastContainerView.backgroundColor = [UIColor clearColor];
    toastInnerView.backgroundColor = [UIColor clearColor];
    
    // Set label styling.
    label.text = self.message;
    label.textColor = self.textColour;
    label.font = self.font;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 2;
    
    // Animate the toast into view.
    [UIView animateWithDuration:0.4f animations:^
    {
        toastContainerView.frame = CGRectMake(toastContainerView.frame.origin.x, (toastContainerView.frame.origin.y - toastContainerView.frame.size.height), toastContainerView.frame.size.width, toastContainerView.frame.size.height);
    }
    completion:^(BOOL finished)
    {
        // After a delay animate the view off screen.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, self.length * NSEC_PER_SEC), dispatch_get_main_queue(), ^
        {
            [UIView animateWithDuration:0.4f animations:^
            {
                toastContainerView.frame = CGRectMake(toastContainerView.frame.origin.x, (toastContainerView.frame.origin.y + toastContainerView.frame.size.height), toastContainerView.frame.size.width, toastContainerView.frame.size.height);
            }
            completion:^(BOOL finished)
            {
                // Remove the view.
                [toastContainerView removeFromSuperview];
                
                // Run the completion block if not nil.
                if(completion != nil)
                {
                    completion(finished);
                }
            }];
        });
    }];
}

@end
