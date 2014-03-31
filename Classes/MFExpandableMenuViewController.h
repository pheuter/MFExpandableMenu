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

@property(nonatomic) UIColor *cellFadeBaseColor;

@end

@protocol MFExpandableMenuDelegate <NSObject>

@end

@protocol MFExpandableMenuDataSource <NSObject>

@required

- (NSInteger)numberOfItemsInMenuViewController:(MFExpandableMenuViewController *)menuViewController;

- (NSString *)menuViewController:(MFExpandableMenuViewController *)menuViewController
             titleForCellAtIndex:(NSInteger)index;

- (UIView *)menuViewController:(MFExpandableMenuViewController *)menuViewController
      detailViewForCellAtIndex:(NSInteger)index;

@end