//
//  AppDelegate.h
//  Demo
//
//  Created by Mark Fayngersh on 3/31/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MFExpandableMenu/MFExpandableMenuViewController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, MFExpandableMenuDataSource, MFExpandableMenuDelegate>

@property(strong, nonatomic) UIWindow *window;

@end
