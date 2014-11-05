//
//  KRToastrDemoViewController.m
//  KRToastrDemo
//
//  Created by Kieran O'Neill on 05/11/2014.
//
//

#import "KRToastrDemoViewController.h"

#import "KRToastr.h"

@interface KRToastrDemoViewController ()

@property (readwrite, nonatomic) BOOL isToastrShowing;

@end

@implementation KRToastrDemoViewController

#pragma mark - Life-cycle methods.

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - IBActions.

-(IBAction)onToastrWithImageSelected:(id)sender
{
    if(!self.isToastrShowing)
    {
        self.isToastrShowing = YES;
        
        [KRToastr showToastrMessageWithImage:self image:[UIImage imageNamed:@"alert_icon"] message:@"This is a Toastr with an image" length:kToastrLengthShort completion:^(BOOL finished)
        {
            self.isToastrShowing = NO;
        }];
    }
}

-(IBAction)onToastrNoImageSelected:(id)sender
{
    if(!self.isToastrShowing)
    {
        self.isToastrShowing = YES;
        
        [KRToastr showToastrMessage:self message:@"This is a Toastr with no image." length:kToastrLengthShort completion:^(BOOL finished)
        {
            self.isToastrShowing = NO;
        }];
    }
}

-(IBAction)onToastrWithDifferentColourSelected:(id)sender
{
    if(!self.isToastrShowing)
    {
        KRToastr* toastr = [KRToastr initialiseWithViewController:self];
        
        toastr.message = @"This is a Toastr with no image.";
        toastr.textColour = [UIColor blackColor];
        toastr.backgroundColour = [UIColor redColor];
        toastr.transparency = 1.0f;
        
        self.isToastrShowing = YES;
        
        [toastr show:^(BOOL finished)
        {
            self.isToastrShowing = NO;
        }];
    }
}

@end
