//
//  AppDelegate.m
//  GCD
//
//  Created by 古智鹏 on 2020/9/19.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    
    _window.rootViewController = [[ViewController alloc] init];
    
    [_window makeKeyAndVisible];
    
    return YES;
}

@end

