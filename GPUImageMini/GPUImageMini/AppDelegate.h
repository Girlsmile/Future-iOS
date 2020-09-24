//
//  AppDelegate.h
//  GPUImageMini
//
//  Created by 古智鹏 on 2020/9/24.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic, strong) UIWindow *window;

@end



//note


//@property(nonatomic, retain) UITextField *userName;
//系统生成的代码如下：

//- (UITextField *) userName {
//    return userName;
//}
//
//- (void) setUserName:(UITextField *)userName_ {
//    [userName_ retain];
//    [userName release];
//    userName = userName_;
//}



//@property(retain) UITextField *userName;
//系统生成的代码如下：

//- (UITextField *) userName {
//    UITextField *retval = nil;
//    @synchronized(self) {
//        retval = [[userName retain] autorelease];
//    }
//    return retval;
//}
//
//- (void) setUserName:(UITextField *)userName_ {
//    @synchronized(self) {
//      [userName release];
//      userName = [userName_ retain];
//    }
//}
