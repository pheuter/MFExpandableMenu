//
//  DemoTests.m
//  DemoTests
//
//  Created by Mark Fayngersh on 3/31/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <Specta/Specta.h>

#define EXP_SHORTHAND

#import <Expecta/Expecta.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#import <MFExpandableMenu/MFExpandableMenuViewController.h>

SpecBegin(MFExpandableMenu)

    describe(@"MFExpandableMenuViewController", ^{
      __block id <MFExpandableMenuDelegate> delegate = mockProtocol(@protocol(MFExpandableMenuDelegate));
      __block id <MFExpandableMenuDataSource> dataSource = mockProtocol(@protocol(MFExpandableMenuDataSource));
      __block MFExpandableMenuViewController *menuViewController;
      __block UIView *firstDetailView;
      __block UIView *lastDetailView;

      beforeEach(^{
        menuViewController = [[MFExpandableMenuViewController alloc] init];
        firstDetailView = [[UIView alloc] init];
        lastDetailView = [[UIView alloc] init];

        [given([dataSource numberOfItemsInMenuViewController:menuViewController]) willReturnInteger:2];

        [given([dataSource menuViewController:menuViewController
                      titleForMenuItemAtIndex:0]) willReturn:@"First Item"];
        [given([dataSource menuViewController:menuViewController
                      titleForMenuItemAtIndex:1]) willReturn:@"Last Title"];

        [given([dataSource menuViewController:menuViewController
                 detailViewForMenuItemAtIndex:0]) willReturn:firstDetailView];
        [given([dataSource menuViewController:menuViewController
                 detailViewForMenuItemAtIndex:1]) willReturn:lastDetailView];

        menuViewController.dataSource = dataSource;
        menuViewController.delegate = delegate;

        menuViewController.view;
      });

      it(@"should initialize with default values", ^{
        expect(menuViewController.customBackgroundFadeColor).to.equal([UIColor grayColor]);
      });

      // TODO: Make it pass
      it(@"should call delegate method for selecting a menu item", ^{
        UICollectionView *collectionView = (UICollectionView *) menuViewController.view.subviews.firstObject;
        UICollectionViewCell *firstCellView = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0
                                                                                                        inSection:0]];
        expect(firstCellView).notTo.beNil();
      });

      // TODO: Add more specs
    });

    SpecEnd
