//
//  MFExpandableMenuViewController.h
//  MFExpandableMenu
//
//  Created by Mark Fayngersh on 3/30/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MFExpandableMenuDelegate;
@protocol MFExpandableMenuDataSource;

@interface MFExpandableMenuViewController : UIViewController

@property(nonatomic, weak) id <MFExpandableMenuDelegate> delegate;
@property(nonatomic, weak) id <MFExpandableMenuDataSource> dataSource;

/**
* Optionally set custom UIFont to use for each menu item
*/
@property(nonatomic) UIFont *customMenuItemFont;

/**
* Optionally set initial menu item background color to fade from
*/
@property(nonatomic) UIColor *customBackgroundFadeColor;

/**
* Optionally set custom UIColor to use for each menu item's label text
*/
@property(nonatomic) UIColor *customMenuItemTextColor;

@end

@protocol MFExpandableMenuDelegate <NSObject>

@optional

/**
* Tells the delegate that the item at the specified index was selected and will show the detail view.
*
* @param menuViewController MFExpandableMenuViewController instance
* @param index              The index of the menu item that will expand into the detail view
*/
- (void)          menuViewController:(MFExpandableMenuViewController *)menuViewController
willShowDetailViewForMenuItemAtIndex:(NSInteger)index;

/**
* Tells the delegate that the item at the specified index was selected and will hide the detail view, returning to the
* list of menu items.
*
* @param menuViewController MFExpandableMenuViewController instance
* @param index              The index of the menu item that was in detail
*/
- (void)          menuViewController:(MFExpandableMenuViewController *)menuViewController
willHideDetailViewForMenuItemAtIndex:(NSInteger)index;

@end

@protocol MFExpandableMenuDataSource <NSObject>

@required

/**
* Used by MenuViewController to determine how many menu items there are
*
* @param menuViewController MFExpandableMenuViewController instance
*
* @return An integer representing the number of menu items
*/
- (NSInteger)numberOfItemsInMenuViewController:(MFExpandableMenuViewController *)menuViewController;

/**
* Used by MenuViewController to determine the title to display for each menu item
*
* @param menuViewController MFExpandableMenuViewController instance
* @param index              The index of the menu item. 0 represents the first menu item.
*
* @return A string representing the title of the menu item at given index
*/
- (NSString *)menuViewController:(MFExpandableMenuViewController *)menuViewController
         titleForMenuItemAtIndex:(NSInteger)index;

/**
* Used by MenuViewController to determine what UIView to show when a menu item is selected
*
* @param menuViewController MFExpandableMenuViewController instance
* @param index              The index of the menu item. 0 represents the first menu item.
*
* @return A view that will show when the menu item at given index is selected
*/
- (UIView *)menuViewController:(MFExpandableMenuViewController *)menuViewController
  detailViewForMenuItemAtIndex:(NSInteger)index;

@end