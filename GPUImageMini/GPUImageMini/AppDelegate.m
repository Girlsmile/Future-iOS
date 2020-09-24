//
//  AppDelegate.m
//  GPUImageMini
//
//  Created by 古智鹏 on 2020/9/24.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    self.window = window;
    
    window.rootViewController = [[ViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
