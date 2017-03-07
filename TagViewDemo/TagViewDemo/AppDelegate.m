//
//  AppDelegate.m
//  TagViewDemo
//
//  Created by yhj on 2017/3/7.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController=[[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    _window.backgroundColor=[UIColor whiteColor];
    [_window makeKeyAndVisible];

    return YES;
}

@end
