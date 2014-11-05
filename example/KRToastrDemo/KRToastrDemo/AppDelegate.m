//
//  AppDelegate.m
//  KRToastrDemo
//
//  Created by Kieran O'Neill on 05/11/2014.
//
//

#import "AppDelegate.h"

#import "KRToastrDemoViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[KRToastrDemoViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
