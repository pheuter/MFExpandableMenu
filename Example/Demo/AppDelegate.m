//
//  AppDelegate.m
//  Demo
//
//  Created by Mark Fayngersh on 3/31/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import "AppDelegate.h"
#import "View+MASAdditions.h"

@interface AppDelegate () {
  MFExpandableMenuViewController *_menuViewController;
  UIView *_customView;
}

@property(readonly) MFExpandableMenuViewController *menuViewController;
@property(readonly) UIView *customView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  self.window.rootViewController = self.menuViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

#pragma mark - Getters

- (MFExpandableMenuViewController *)menuViewController {
  if (!_menuViewController) {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor greenColor];
    label.font = [UIFont systemFontOfSize:16];

    _menuViewController = [[MFExpandableMenuViewController alloc] init];
    _menuViewController.customBackgroundFadeColor = [UIColor purpleColor];
    _menuViewController.dataSource = self;
    _menuViewController.delegate = self;
  }

  return _menuViewController;
}

- (UIView *)customView {
  if (!_customView) {
    _customView = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Custom UIView here!";
    label.font = [UIFont systemFontOfSize:32];
    label.textColor = [UIColor whiteColor];

    [_customView addSubview:label];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
      make.center.equalTo(_customView);
    }];
  }

  return _customView;
}

#pragma mark - MFExpandableMenuDataSource Methods

- (NSInteger)numberOfItemsInMenuViewController:(MFExpandableMenuViewController *)menuViewController {
  return 4;
}

- (NSString *)menuViewController:(MFExpandableMenuViewController *)menuViewController
         titleForMenuItemAtIndex:(NSInteger)index1 {
  return [NSString stringWithFormat:@"Menu Item %d", index1 + 1];
}

- (UIView *)menuViewController:(MFExpandableMenuViewController *)menuViewController
  detailViewForMenuItemAtIndex:(NSInteger)index1 {
  return self.customView;
}

#pragma mark - MFExpandableMenuDelegate Methods

- (void)          menuViewController:(MFExpandableMenuViewController *)menuViewController
willShowDetailViewForMenuItemAtIndex:(NSInteger)index {
  NSLog(@"Showing detail view for menu item at index: %i", index);
}

- (void)          menuViewController:(MFExpandableMenuViewController *)menuViewController
willHideDetailViewForMenuItemAtIndex:(NSInteger)index {
  NSLog(@"Hiding detail view for menu item at index: %i", index);
}

@end
